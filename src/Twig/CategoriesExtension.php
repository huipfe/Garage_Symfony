<?php
// src/Twig/CategoriesExtension.php

namespace App\Twig;

use App\Repository\CategoriesRepository;
use Twig\Extension\AbstractExtension;
use Twig\TwigFunction;

class CategoriesExtension extends AbstractExtension
{
    private $categoriesRepository;

    public function __construct(CategoriesRepository $categoriesRepository)
    {
        $this->categoriesRepository = $categoriesRepository;
    }

    public function getFunctions(): array
    {
        return [
            new TwigFunction('get_categories', [$this, 'getCategories']),
        ];
    }

    public function getCategories()
    {
        // Récupérez les catégories depuis votre repository
        return $this->categoriesRepository->findAll(); // Vous devrez ajuster cela en fonction de votre logique de récupération
    }
}

