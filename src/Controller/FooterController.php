<?php

namespace App\Controller;

use App\Repository\HorairesRepository;
use App\Repository\GarageInfoRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class FooterController extends AbstractController
{
    public function footer(HorairesRepository $horairesRepository, GarageInfoRepository $garageInfoRepository): Response
    {
        $horaires = $horairesRepository->findAll();
        $garageInfo = $garageInfoRepository->findOneBy([]);

        return $this->render('_template/_footer.html.twig', [
            'horaires' => $horaires,
            'garage_info' => $garageInfo,
        ]);
    }
}

