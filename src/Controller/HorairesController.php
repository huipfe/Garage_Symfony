<?php

namespace App\Controller;

use App\Repository\HorairesRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;


use Symfony\Component\Security\Core\Security;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security as SecurityAnnotation;

#[Route('/horaires', name: 'horaires_')]
#[SecurityAnnotation("is_granted('ROLE_ADMIN')")]
class HorairesController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    #[Route('/', name: 'index')]
    public function index(HorairesRepository $horairesRepository, Security $security): Response
    {
        // Vérifiez si l'utilisateur a le rôle ROLE_ADMIN
        if (!$security->isGranted('ROLE_ADMIN')) {
            throw $this->createAccessDeniedException('Accès refusé. Vous devez être un administrateur pour accéder à cette page.');
        }
        $horaires = $horairesRepository->findAll();

        return $this->render('horaires/index.html.twig', [
            'horaires' => $horaires,
        ]);
    }

    #[Route('/horaires/edit', name: 'horaires_edit')]
    #[SecurityAnnotation("is_granted('ROLE_ADMIN')")]
    public function edit(Request $request, HorairesRepository $horairesRepository,
                         EntityManagerInterface $entityManager,
                         Security $security): Response
    {
        // Vérifiez si l'utilisateur a le rôle ROLE_ADMIN
        if (!$security->isGranted('ROLE_ADMIN')) {
            throw $this->createAccessDeniedException('Accès refusé. Vous devez être un administrateur pour accéder à cette page.');
        }

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
