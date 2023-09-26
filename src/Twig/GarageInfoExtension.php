<?php
// src/Twig/GarageInfoExtension.php

namespace App\Twig;

use App\Repository\GarageInfoRepository;
use Twig\Extension\AbstractExtension;
use Twig\TwigFunction;

class GarageInfoExtension extends AbstractExtension
{
private $garageInfoRepository;

public function __construct(GarageInfoRepository $garageInfoRepository)
{
$this->garageInfoRepository = $garageInfoRepository;
}

public function getFunctions(): array
{
return [
new TwigFunction('get_garage_info', [$this, 'getGarageInfo']),
];
}

public function getGarageInfo()
{
// Récupérez les informations de la table GarageInfo depuis votre repository
return $this->garageInfoRepository->findOneBy([]); // Vous devrez ajuster cela en fonction de votre logique de récupération
}
}
