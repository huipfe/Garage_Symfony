<?php

namespace App\Entity;

use App\Repository\CouponsTypesRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CouponsTypesRepository::class)]
class CouponsTypes
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 50)]
    private ?string $name = null;

    #[ORM\OneToMany(mappedBy: 'coupons_types', targetEntity: Coupons::class, orphanRemoval: true)]
    private Collection $Coupons;

    public function __construct()
    {
        $this->Coupons = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): static
    {
        $this->name = $name;

        return $this;
    }

    /**
     * @return Collection<int, Coupons>
     */
    public function getCOUPONS(): Collection
    {
        return $this->Coupons;
    }

    public function addCOUPON(Coupons $cOUPON): static
    {
        if (!$this->Coupons->contains($cOUPON)) {
            $this->Coupons->add($cOUPON);
            $cOUPON->setCouponsTypes($this);
        }

        return $this;
    }

    public function removeCOUPON(Coupons $cOUPON): static
    {
        if ($this->Coupons->removeElement($cOUPON)) {
            // set the owning side to null (unless already changed)
            if ($cOUPON->getCouponsTypes() === $this) {
                $cOUPON->setCouponsTypes(null);
            }
        }

        return $this;
    }

}
