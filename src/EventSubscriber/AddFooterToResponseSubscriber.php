<?php

namespace App\EventSubscriber;

use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpKernel\Event\ControllerEvent;
use Symfony\Component\HttpKernel\KernelEvents;

class AddFooterToResponseSubscriber implements EventSubscriberInterface
{
    private $footerController;

    public function __construct(\App\Controller\FooterController $footerController)
    {
        $this->footerController = $footerController;
    }

    public function onKernelController(ControllerEvent $event)
    {
        $controller = $event->getController();
        if (is_array($controller) && $controller[0] instanceof \Symfony\Bundle\FrameworkBundle\Controller\TemplateController) {
            $event->setController([$this->footerController, 'footer']);
        }
    }

    public static function getSubscribedEvents()
    {
        return [
            KernelEvents::CONTROLLER => 'onKernelController',
        ];
    }
}