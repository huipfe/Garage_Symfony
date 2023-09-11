<?php

namespace App\Controller\Admin;


use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;

#[Route("/admin", name:"admin_")]
class MainController extends AbstractController
{

    private $security;

    public function __construct(Security $security)
    {
        $this->security = $security;
    }

    #[Route('/', name: 'index')]
    public function index(): Response
    {
        $user = $this->security->getUser(); // Récupère l'utilisateur connecté
        return $this->render('Admin/index.html.twig', [
            'user' => $user, // Transmet l'utilisateur à la vue
        ]);
    }

}