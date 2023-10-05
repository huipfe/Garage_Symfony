<?php

namespace App\Controller\Admin;

use App\Entity\Images;
use App\Entity\OrdersDetails;
use App\Entity\Products;
use App\Form\ProductsFormType;
use App\Repository\ProductsRepository;
use App\Service\PictureService;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;
use Symfony\Component\String\Slugger\SluggerInterface;

#[Route('/admin/produits', name: 'admin_products_')]
class ProductsController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }
    #[Route('/', name: 'index')]
    public function index(ProductsRepository $productsRepository): Response
    {

        $produits = $productsRepository->findAll();
        return $this->render('Admin/products/index.html.twig',
        compact('produits'));
    }

    #[Route('/ajout', name: 'add')]
    public function add(Request $request, EntityManagerInterface $em, SluggerInterface $slugger,
                        PictureService $pictureService): Response
    {
        $this->denyAccessUnlessGranted('ROLE_ADMIN');

       // On créer un "nouveau produit"
        $product = new Products();

        // On créer le formulaire
        $productForm = $this->createForm(ProductsFormType::class, $product);

        // On traite la requête du formulaire
        $productForm->handleRequest($request);

        // On vérifie sur le formulaire est soumis, et valide
        if($productForm->isSubmitted() && $productForm->isValid()){

            // On va récupéré les images
            $images = $productForm->get('images')->getData();
            foreach ($images as $image){
                // On défini le dossier de destination
                $folder = 'products';

                // On appelle le service d'ajout
                $fichier = $pictureService->add($image, $folder, 300, 300);

                $img = new Images();
                $img->setName($fichier);

                $product->addImage($img);

            }

            // On génère le slug
            $slug = $slugger->slug($product->getName());
            $product->setSlug($slug);

            // On arrondit le prix
            //$prix = $product->getPrice() * 100;
            //$product->setPrice($prix);

            // On stock et on enregistre
            $em->persist($product);
            $em->flush();

            // Message
            $this->addFlash('success', 'produit ajouté avec succès');

            // On redirige
            return $this->redirectToRoute('admin_products_index');


        }

        //return $this->render('Admin/products/add.html.twig', [
            //'productForm' => $productForm->createView()
            //]);

        //Second return qui peut être fait, avec nouvelle méthode de render, et nouvelle méthode d'inclusion de form avec compact
        return $this->renderForm('Admin/products/add.html.twig', compact('productForm'));
    }

    #[Route('/edition/{id}', name: 'edit')]
    public function edit(int $id , Request $request, EntityManagerInterface $em, SluggerInterface $slugger,
                         PictureService $pictureService): Response
    {
        // Récupérez l'objet Products à partir de l'identifiant
        $product = $this->entityManager->getRepository(Products::class)->find($id);

        // On vérifie si l'utilisateur peut éditer avec le voter.
        $this->denyAccessUnlessGranted('PRODUCTS_EDIT', $product);

        // On divise le prix par 100
        //$prix = $product->getPrice() / 100;
        //$product->setPrice($prix);

        // On créer le formulaire
        $productForm = $this->createForm(ProductsFormType::class, $product);

        // On traite la requête du formulaire
        $productForm->handleRequest($request);

        // On vérifie sur le formulaire est soumis, et valide
        if($productForm->isSubmitted() && $productForm->isValid()){

            // On va récupéré les images
            $images = $productForm->get('images')->getData();
            foreach ($images as $image){
                // On défini le dossier de destination
                $folder = 'products';

                // On appelle le service d'ajout
                $fichier = $pictureService->add($image, $folder, 300, 300);

                $img = new Images();
                $img->setName($fichier);

                $product->addImage($img);

            }
            // On génère le slug
            $slug = $slugger->slug($product->getName());
            $product->setSlug($slug);

            // On arrondit le prix
            //$prix = $product->getPrice() * 100;
            //$product->setPrice($prix);

            // On stock et on enregistre
            $em->persist($product);
            $em->flush();

            // Message
            $this->addFlash('success', 'produit modifié avec succès');

            // On redirige
            return $this->redirectToRoute('admin_products_index');


        }

        return $this->render('admin/products/edit.html.twig',[
            'productForm' => $productForm->createView(),
            'product' => $product
        ]);

        //Second return qui peut être fait, avec nouvelle méthode de render, et nouvelle méthode d'inclusion de form avec compact
        //return $this->renderForm('Admin/products/edit.html.twig', compact('productForm'));
    }

    #[Route('/suppression/{id}', name: 'delete', methods: ['DELETE'])]
    #[SecurityAnnotation("is_granted('ROLE_ADMIN')")]
    public function delete(int $id, EntityManagerInterface $em, Security $security): Response
    {
        // Récupérez l'objet Products à partir de l'identifiant
        $product = $this->entityManager->getRepository(Products::class)->find($id);

        if (!$product) {
            $this->addFlash('danger', 'Produit non trouvé.');
            return $this->redirectToRoute('products_index');
        }

        // Vérifiez si l'utilisateur a le rôle ROLE_ADMIN
        if (!$security->isGranted('ROLE_ADMIN')) {
            // Ajoutez un message Flash d'erreur
            $this->addFlash('danger', 'Accès refusé. Vous devez être un administrateur pour supprimer un produit.');

            // Redirigez l'utilisateur vers la liste des produits ou toute autre page appropriée
            return $this->redirectToRoute('products_index');

        }

        // Récupérer les détails de commandes liés au produit
        $orderDetails = $this->entityManager->getRepository(OrdersDetails::class)->findBy(['products' => $product]);

        // Supprimer chaque détail de commande
        foreach ($orderDetails as $orderDetail) {
            $em->remove($orderDetail);
        }

        // Supprimez le produit de la base de données.
        $em->remove($product);
        $em->flush();

        // Ajoutez un message Flash pour indiquer que la suppression a réussi
        $this->addFlash('success', 'Produit supprimé avec succès.');

        return $this->render('Admin/products/index.html.twig',[
            'produits' => $product
        ]);

    }

    #[Route('/suppression/image/{id}', name: 'delete_image', methods : ['DELETE'])]
    public function deleteImage(Images $image, Request $request, EntityManagerInterface $em,
                                PictureService $pictureService): JsonResponse
    {

        // On récupère le contenu de la requête.
        $data = json_decode($request->getContent(), true);

        // On récup le token dans Data, et on vérifie s'il est valide
        if($this->IsCsrfTokenValid('delete' . $image->getId(), $data ['_token'])){

            // Le token CSRF est valide
            // On récup le nom de l'image
            $nom = $image->getName();

            if ($pictureService->delete($nom, 'products', 300, 300)) {
                $em->remove($image);
                $em->flush();
                return new JsonResponse(['success' => true], Response::HTTP_OK);
            }

            // La suppression a échoué
            return new JsonResponse(['error' => 'Erreur de suppression'], Response::HTTP_BAD_REQUEST);
        }

        return new JsonResponse(['error' => 'Token Invalide'], 400);
    }

}
