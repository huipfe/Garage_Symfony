<?php

namespace App\Controller;

use App\Entity\Categories;
use App\Repository\CategoriesRepository;
use App\Repository\ProductsRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/categories', name: 'categories_')]
class CategoriesController extends AbstractController
{
    #[Route('/{slug}', name: 'list')]
    public function details(
        string $slug,
        CategoriesRepository $categoriesRepository,
        ProductsRepository $productsRepository,
        Request $request
    ): Response
    {
        $category = $categoriesRepository->findOneBy(['slug' => $slug]);

        if (!$category) {
            throw $this->createNotFoundException('Product not found');
        }
        // On va chercher le numéro de page dans l'URL
        $page = $request->query->getInt('page', 1);

        #On va chercher la liste des produits de la catégorie.
        $products = $productsRepository->findProductsPaginated($page, $category->getSlug(), 2);

        return $this->render('categories/list.html.twig' , [
            'category' => $category,
            'products' => $products,
        ]);
    }

}
