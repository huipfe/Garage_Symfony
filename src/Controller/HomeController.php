<?php
namespace App\Controller;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
class HomeController extends AbstractController
{
    //#[Route('/')]
    //public function index() : Response
    //{
    //return $this->render('base.html.twig');
    //}

    #[Route('/')]
    public function index(): Response
    {
        return $this->render('main/index.html.twig');
    }

}

