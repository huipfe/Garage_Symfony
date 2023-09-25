<?php

namespace App\Controller;

use App\Entity\Horaires;
use App\Form\HorairesFormType;
use App\Repository\HorairesRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;




#[Route('/horaires', name: 'horaires_')]

class HorairesController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    #[Route('/', name: 'index')]
    public function index(HorairesRepository $horairesRepository): Response
    {
        $horaires = $horairesRepository->findAll();

        return $this->render('horaires/index.html.twig', [
            'horaires' => $horaires,
        ]);
    }

    //#[Route('/horaires/edit', name: 'horaires_edit')]
    /**
     * @Route("/horaires/edit", name="horaires_edit")
     * @IsGranted("ROLE_ADMIN")
     */
    public function edit(Request $request, HorairesRepository $horairesRepository, EntityManagerInterface $entityManager): Response
    {
        if ($request->isMethod('POST')) {
            foreach ($horairesRepository->findAll() as $horaire) {
                $heureDebut = $request->request->get('heure_debut_' . $horaire->getId());
                $heureFin = $request->request->get('heure_fin_' . $horaire->getId());

                if ($heureDebut !== null && $heureFin !== null) {
                    $horaire->setHeureDebut($heureDebut);
                    $horaire->setHeureFin($heureFin);

                    $entityManager->persist($horaire);
                    $entityManager->flush();
                } else {
                    $this->addFlash('danger', 'Horaires non modifiés');
                }
            }

            $this->addFlash('success', 'Horaires modifiés avec succès');
        }

        $horaires = $horairesRepository->findAll();

        return $this->render('horaires/index.html.twig', [
            'horaires' => $horaires,
        ]);
    }

}
