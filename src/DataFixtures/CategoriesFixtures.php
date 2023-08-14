<?php

namespace App\DataFixtures;

use App\Entity\Categories;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\String\Slugger\SluggerInterface;

class CategoriesFixtures extends Fixture
{
    private $counter = 1;
    public function __construct(private SluggerInterface $slugger){}

    public function load(ObjectManager $manager): void
    {

        //$parent = $this->createCategory('Voiture', null, $manager);
        $parent = $this->createCategory(name : 'Voiture', manager : $manager);

        $this->createCategory("Voitures d'occasions", $parent, $manager);

        $this->createCategory("Voitures de course", $parent, $manager);

        $this->createCategory("Voitures Familiale", $parent, $manager);

        $parent = $this->createCategory(name : 'Services', manager : $manager);

        $this->createCategory("Service 1", $parent, $manager);

        $this->createCategory("Service 2", $parent, $manager);

        $this->createCategory("Service 3", $parent, $manager);
        $manager->flush();
    }

    public function createCategory(string $name, Categories $parent = null, ObjectManager $manager = null)
    {
        $category = new Categories();
        $category->setName($name);
        $category->setSlug($this->slugger->slug($category->getName())
            ->lower());
        $category->setParent($parent);
        $manager->persist($category);


        $this->addReference('cat-'.$this->counter, $category);
        $this->counter++;

        return $category;
    }
}
