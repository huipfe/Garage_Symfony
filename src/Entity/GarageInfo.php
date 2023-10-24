<?php

namespace App\Entity;

use App\Repository\GarageInfoRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

#[ORM\Entity(repositoryClass: GarageInfoRepository::class)]
class GarageInfo
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 100)]
    private ?string $address = null;

    #[ORM\Column(length: 20)]
    #[Assert\PositiveOrZero(message: 'Le numéro ne pas être négatif')]
    #[Assert\Regex(
        pattern: "/^\d+$/",
        message: "Le numéro de téléphone doit contenir uniquement des chiffres."
    )]
    private ?string $phoneNumber = null;


    #[ORM\Column(length: 100)]
    private ?string $email = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getAddress(): ?string
    {
        return $this->address;
    }

    public function setAddress(string $address): static
    {
        $this->address = $address;

        return $this;
    }

    public function getPhoneNumber(): ?string
    {
        return $this->phoneNumber;
    }

    public function setPhoneNumber(string $phoneNumber): static
    {
        $this->phoneNumber = $phoneNumber;

        return $this;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): static
    {
        $this->email = $email;

        return $this;
    }
}
