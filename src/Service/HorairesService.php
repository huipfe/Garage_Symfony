<?php

// src/Service/HorairesService.php

namespace App\Service;

use App\Repository\HorairesRepository;

class HorairesService
{
    private $horairesRepository;
    private $horaires;

    public function __construct(HorairesRepository $horairesRepository)
    {
        $this->horairesRepository = $horairesRepository;
        $this->horaires = $this->horairesRepository->findAll();
    }

    public function getHoraires()
    {
        return $this->horaires;
    }
}
