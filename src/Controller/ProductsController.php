<?php

namespace App\Controller;

use App\Entity\Products;
use App\Repository\CategoriesRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/produits', name: 'products_')]
class ProductsController extends AbstractController
{
    #[Route('/', name: 'index')]
    public function index(CategoriesRepository $categoriesRepository): Response
    {
        return $this->render('products/index.html.twig', [
        'categories' => $categoriesRepository->findBy([],
        ['categoryOrder' => 'asc']),
        ]);
    }

    #[Route('/{slug}', name: 'details')]
    public function details($slug, EntityManagerInterface $entityManager): Response
    {
        $product = $entityManager->getRepository(Products::class)->findOneBy(['slug' => $slug]);

        if (!$product) {
            throw $this->createNotFoundException('Product not found');
        }

        //dd($product);
            return $this->render('products/details.html.twig' , [
                'product' => $product,
            ]);
    }

}
