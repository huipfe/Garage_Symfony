<?php

// src/Controller/HorairesControllerAdvice.php

namespace App\Controller;

use App\Service\HorairesService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\Event\ControllerEvent;
use Symfony\Component\HttpKernel\HttpKernelInterface;
use Twig\Environment;

class HorairesControllerAdvice extends AbstractController
{
    private $twig;
    private $horairesService;

    public function __construct(Environment $twig, HorairesService $horairesService)
    {
        $this->twig = $twig;
        $this->horairesService = $horairesService;
    }

    public function onKernelController(ControllerEvent $event)
    {
        if (HttpKernelInterface::MASTER_REQUEST !== $event->getRequestType()) {
            return;
        }

        $this->twig->addGlobal('horaires', $this->horairesService->getHoraires());
    }
}
