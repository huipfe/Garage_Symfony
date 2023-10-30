<?php


namespace App\Controller;

use App\Entity\Products;
use App\Repository\ProductsRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

#[Route("/cart", name: "cart_")]
class CartController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    #[Route("/", name: "index")]
    public function index(SessionInterface $session, ProductsRepository $productsRepository): Response
    {
        // Vérifiez si l'utilisateur à un compte connecté
        if (!$this->isGranted('ROLE_USER')) {
            $this->addFlash('danger', 'Veuillez vous connecter pour accéder à votre panier.');
            return $this->redirectToRoute('app_login'); // Redirigez l'utilisateur vers la page de connexion
        }

        $user = $this->getUser();

        // Vérifiez si l'utilisateur a validé son compte
        if ($user->getIsVerified() === false) {
            $this->addFlash('danger', 'Votre compte doit être vérifié pour accéder au panier.');
            return $this->redirectToRoute('profile_index'); // Redirigez l'utilisateur vers la page de connexion
        }

        $panier = $session->get('panier', []);

         // On initialise les variables
        $data = [];
        $total = 0;

        // $session->set('panier', []); Vider notre panier de notre session.
        // Si on y avait mis des produits non existant, pour ne plus avoir d'erreur

        // On boucle sur le panier
        foreach ($panier as $id => $quantity){
            $product = $productsRepository->find($id);

            $data[] = [
                'product' => $product,
                'quantity' => $quantity,
            ];
            $total += $product->getPrice() * $quantity;
        }
          return $this->render('cart/index.html.twig', compact('data', 'total'));
    }

    #[Route("/add/{id}", name: "add")]
    public function add($id, Request $request, SessionInterface $session): Response
    {
        // Récupérer le produit par son ID
        $product = $this->entityManager->getRepository(Products::class)->find($id);

        if (!$product) {
            throw $this->createNotFoundException('Le produit n\'existe pas');
        }

        // On récupérer l'id du produit
        $id = $product->getId();

        // On récupère le panier existant, s'il y en a un.
        $panier = $session->get('panier', []);

        // On ajoute le produit de la session, dans le panier, s'il n'y est pas encore
        // sinon on incrémente sa quantité.
        if(empty($panier[$id])){
             $panier[$id] = 1;
        }else {
            $panier[$id]++;
        }

        $session->set('panier', $panier);

        // On redirige vers la page du panier
        return $this->redirectToRoute('cart_index');


    }

    #[Route("/remove/{id}", name: "remove")]
    public function remove($id, Request $request, SessionInterface $session): Response
    {
        // Récupérer le produit par son ID
        $product = $this->entityManager->getRepository(Products::class)->find($id);

        if (!$product) {
            throw $this->createNotFoundException('Le produit n\'existe pas');
        }

        // On récupérer l'id du produit
        $id = $product->getId();

        // On récupère le panier existant, s'il y en a un.
        $panier = $session->get('panier', []);

        // On retire le produit de la session, du panier, s'il n'y a qu'un exemplaire
        // sinon on décrémente sa quantité.
        if(!empty($panier[$id])){
            if($panier[$id] > 1){
                $panier[$id]-- ;
            }else{
                unset($panier[$id]);
            }
        }
        $session->set('panier', $panier);

        // On redirige vers la page du panier
        return $this->redirectToRoute('cart_index');
    }


    #[Route("/delete/{id}", name: "delete")]
    public function delete($id, Request $request, SessionInterface $session): Response
    {
        // Récupérer le produit par son ID
        $product = $this->entityManager->getRepository(Products::class)->find($id);

        if (!$product) {
            throw $this->createNotFoundException('Le produit n\'existe pas');
        }

        // On récupérer l'id du produit
        $id = $product->getId();

        // On récupère le panier existant, s'il y en a un.
        $panier = $session->get('panier', []);

        if(!empty($panier[$id])){
            unset($panier[$id]);
        }

        $session->set('panier', $panier);

        // On redirige vers la page du panier
        return $this->redirectToRoute('cart_index');
    }

    #[Route("/empty", name: "empty")]
    public function empty(SessionInterface $session): Response
    {

        $session->remove('panier');

        return $this->redirectToRoute('cart_index');


    }
}