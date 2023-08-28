<?php

namespace App\Controller\Admin;

use App\Entity\Products;
use App\Form\ProductsFormType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
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
    public function index(): Response
    {
        return $this->render('Admin/products/index.html.twig');
    }

    #[Route('/ajout', name: 'add')]
    public function add(Request $request, EntityManagerInterface $em, SluggerInterface $slugger): Response
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
            // On génère le slug
            $slug = $slugger->slug($product->getName());
            $product->setSlug($slug);

            // On arrondit le prix
            $prix = $product->getPrice() * 100;
            $product->setPrice($prix);

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
    public function edit(int $id , Request $request, EntityManagerInterface $em, SluggerInterface $slugger): Response
    {
        // Récupérez l'objet Products à partir de l'identifiant
        $product = $this->entityManager->getRepository(Products::class)->find($id);

        // On vérifie si l'utilisateur peut éditer avec le voter.
        $this->denyAccessUnlessGranted('PRODUCTS_EDIT', $product);

        // On divise le prix par 100
        $prix = $product->getPrice() / 100;
        $product->setPrice($prix);

        // On créer le formulaire
        $productForm = $this->createForm(ProductsFormType::class, $product);

        // On traite la requête du formulaire
        $productForm->handleRequest($request);

        // On vérifie sur le formulaire est soumis, et valide
        if($productForm->isSubmitted() && $productForm->isValid()){
            // On génère le slug
            $slug = $slugger->slug($product->getName());
            $product->setSlug($slug);

            // On arrondit le prix
            $prix = $product->getPrice() * 100;
            $product->setPrice($prix);

            // On stock et on enregistre
            $em->persist($product);
            $em->flush();

            // Message
            $this->addFlash('success', 'produit modifié avec succès');

            // On redirige
            return $this->redirectToRoute('admin_products_index');


        }

        //return $this->render('Admin/products/add.html.twig', [
        //'productForm' => $productForm->createView()
        //]);

        //Second return qui peut être fait, avec nouvelle méthode de render, et nouvelle méthode d'inclusion de form avec compact
        return $this->renderForm('Admin/products/edit.html.twig', compact('productForm'));
    }

    #[Route('/suppression/{id}', name: 'delete')]
    public function delete(int $id): Response
    {
        // Récupérez l'objet Products à partir de l'identifiant
        $product = $this->entityManager->getRepository(Products::class)->find($id);

        // On vérifie si l'utilisateur peut supprimer avec le voter.
        $this->denyAccessUnlessGranted('PRODUCTS_DELETE', $product);
        return $this->render('Admin/products/index.html.twig');
    }

}
