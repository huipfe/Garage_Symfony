<?php
namespace App\Controller;
use App\Repository\CategoriesRepository;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

#[Route('/', name: 'home_')]
class HomeController extends AbstractController
{
    #[Route('/', name: 'index')]
    public function index(CategoriesRepository $categoriesRepository) : Response
    {
    return $this->render('main/index.html.twig', [
        'categories' => $categoriesRepository->findBy([],
            ['categoryOrder' => 'asc']),
    ]);
  }

}

