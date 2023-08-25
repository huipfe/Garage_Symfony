<?php

namespace App\Controller\Admin;

use App\Entity\Products;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin/produits', name: 'employe_products_')]
class ProductsController extends AbstractController
{
    #[Route('/', name: 'index')]
    public function index(): Response
    {
        return $this->render('Admin/products/index.html.twig');
    }

    #[Route('/ajout', name: 'add')]
    public function add(): Response
    {
        $this->denyAccessUnlessGranted('ROLE_ADMIN');
        return $this->render('Admin/products/index.html.twig');
    }

    #[Route('/edition/{id}', name: 'edit')]
    public function edit(Products $product): Response
    {
        // On vérifie si l'utilisateur peut éditer avec le voter.
        $this->denyAccessUnlessGranted('PRODUCT_EDIT', $product);
        return $this->render('Admin/products/index.html.twig');
    }

    #[Route('/suppression/{id}', name: 'delete')]
    public function delete(Products $product): Response
    {
        // On vérifie si l'utilisateur peut supprimer avec le voter.
        $this->denyAccessUnlessGranted('PRODUCT_DELETE', $product);
        return $this->render('Admin/products/index.html.twig');
    }

}
