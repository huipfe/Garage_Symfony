<?php

namespace App\Controller;

use App\Entity\GarageInfo;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

use Symfony\Component\Security\Core\Security;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security as SecurityAnnotation;

#[Route('/garage-info',  name: 'garage-info_')]
#[SecurityAnnotation("is_granted('ROLE_ADMIN')")]
class GarageInfoController extends AbstractController
{
    #[Route('/', name: 'index')]
    public function index(EntityManagerInterface $entityManager, Security $security): Response
    {
        // Vérifiez si l'utilisateur a le rôle ROLE_ADMIN
        if (!$security->isGranted('ROLE_ADMIN')) {
            throw $this->createAccessDeniedException('Accès refusé. Vous devez être un administrateur pour accéder à cette page.');
        }
        $garageInfo = $entityManager->getRepository(GarageInfo::class)->findOneBy([]);

        return $this->render('garage_info/index.html.twig', [
            'garageInfo' => $garageInfo,
        ]);
    }


    #[Route('/edit', name: 'edit')]
    #[SecurityAnnotation("is_granted('ROLE_ADMIN')")]
    public function edit(Request $request, EntityManagerInterface $entityManager, Security $security): Response
    {
    // Vérifiez si l'utilisateur a le rôle ROLE_ADMIN
    if (!$security->isGranted('ROLE_ADMIN')) {
        throw $this->createAccessDeniedException('Accès refusé. Vous devez être un administrateur pour accéder à cette page.');
    }
        $garageInfo = $entityManager->getRepository(GarageInfo::class)->findOneBy([]);

        if (!$garageInfo) {
            throw $this->createNotFoundException('Aucune information de garage trouvée.');
        }

        if ($request->isMethod('POST')) {
            $address = $request->request->get('address');
            $phoneNumber = $request->request->get('phone_number');
            $email = $request->request->get('email');

            $garageInfo->setAddress($address);
            $garageInfo->setPhoneNumber($phoneNumber);
            $garageInfo->setEmail($email);

            $entityManager->flush();

            $this->addFlash('success', 'Informations du garage mises à jour avec succès.');
        } else {
            $this->addFlash('danger', 'Horaires non modifiés');
        }

        return $this->render('garage_info/index.html.twig', [
            'garageInfo' => $garageInfo,
        ]);
    }
}
