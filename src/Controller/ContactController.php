<?php

namespace App\Controller;

use App\Entity\GarageInfo;
use App\Repository\GarageInfoRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/contact', name: 'contact_')]
class ContactController extends AbstractController
{
    #[Route('/', name: 'index')]
    public function index(GarageInfoRepository $infoGarageRepository): Response
    {
        // Récupérez les informations de la table InfoGarage depuis votre repository
        $infoGarage = $infoGarageRepository->findOneBy([]); // Vous devrez ajuster cela en fonction de votre logique de récupération

        return $this->render('contact/index.html.twig', [
            'controller_name' => 'ContactController',
            'info_garage' => $infoGarage, // Passez les informations de la table à la vue
        ]);
    }

    #[Route("/contact/send_mail", name: "send_mail", methods: ["POST"])]
    public function sendMail(Request $request): Response
    {
        // Votre logique de traitement de formulaire ici

        return new Response('success'); // Réponse de succès
    }


}
