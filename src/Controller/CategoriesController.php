<?php

namespace App\Controller;

use App\Entity\Categories;
use App\Repository\CategoriesRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/categories', name: 'categories_')]
class CategoriesController extends AbstractController
{
    #[Route('/{slug}', name: 'list')]
    public function details($slug, EntityManagerInterface $entityManager): Response
    {
        $category = $entityManager->getRepository(Categories::class)->findOneBy(['slug' => $slug]);

        if (!$category) {
            throw $this->createNotFoundException('Product not found');
        }

        #On va chercher la liste des produits de la catégorie.
        $products = $category->getProducts();

        return $this->render('categories/list.html.twig' , [
            'category' => $category,
            'products' => $products,
        ]);
    }

}
