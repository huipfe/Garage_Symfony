<?php


use PHPUnit\Framework\TestCase;
use App\Service\MyFeatureService;

class MyFeatureTest extends TestCase
{
    // Les méthodes de test iront ici

    public function testSomething()
    {
        // Code de test
        // Utilisez les méthodes assert* de PHPUnit pour vérifier les résultats attendus.
    }


    public function testCalculateSomething()
    {
        $myFeatureService = new MyFeatureService(); // Remplacez par l'instanciation de votre service

        $result = $myFeatureService->calculateSomething(2, 3); // Appel de la fonction à tester

        $this->assertEquals(5, $result); // Vérifie que le résultat est égal à 5
    }

}
