<?php

namespace App\Controller;

use App\Entity\Orders;
use App\Entity\OrdersDetails;
use App\Repository\ProductsRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Annotation\Route;


#[Route('/commandes', name: 'app_orders_')]
class OrdersController extends AbstractController
{
    #[Route('/ajout', name: 'add')]
    public function add(SessionInterface $session, ProductsRepository $productsRepository,
    EntityManagerInterface $em): Response
    {
        $this->denyAccessUnlessGranted('ROLE_USER');

        $panier = $session->get('panier', []);

        // Le panier est vide, on redirige avec un message
        if($panier === []){
            $this->addFlash('message', 'Votre panier est vide');
            return $this->redirectToRoute('app_main');
        }

        // Le panier n'est pas vide, on créer la commande
        $order = new Orders();

        // On remplit la commande
        $order->setUsers($this->getUser());
        $order->setReference(uniqid());


        // On parcourt le panier pour créer les détails de commande
        foreach ($panier as $item => $quantity){
            $orderDetails = new OrdersDetails();

            // On va chercher le produit
            $product = $productsRepository->find($item);

            $price = $product->getPrice();

            // On créer le détails de commande
            $orderDetails->setProducts($product);
            $orderDetails->setPrice($price);
            $orderDetails->setQuantity($quantity);

            // On ajoute les détails de la commande
            $order->addOrdersDetail($orderDetails);

        }
        // On persiste et on flush (créer les requetes, et les éxecuter)
        $em->persist($order);
        $em->flush();

        // On vide le panier, pour ne pas l'envoyer en boucle
        $session->remove('panier');

        // Message de confirmation de commande
        $this->addFlash('message', 'Commande créer avec succès');
        return $this->redirectToRoute('app_main');


        //return $this->render('orders/index.html.twig', [
            //'controller_name' => 'OrdersController',
        //]);
    }
}
