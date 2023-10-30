<?php

namespace App\Controller;

use App\Entity\Categories;
use App\Repository\CategoriesRepository;
use App\Repository\HorairesRepository;
use App\Repository\GarageInfoRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class FooterController extends AbstractController
{
    public function footer(HorairesRepository $horairesRepository,
                           GarageInfoRepository $garageInfoRepository,
                           EntityManagerInterface $entityManager,
                           CategoriesRepository $categoryRepository,): Response
    {
        $horaires = $horairesRepository->findAll();
        $garageInfo = $garageInfoRepository->findOneBy([]);
        $categories = $categoryRepository->findAll();



        return $this->render('_template/_footer.html.twig', [
            'horaires' => $horaires,
            'garage_info' => $garageInfo,
            'categories' => $categories,
        ]);
    }
}

