<?php

use PHPUnit\Framework\TestCase;
use App\Service\PictureService;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;
use Symfony\Component\HttpFoundation\File\UploadedFile;

class PictureServiceTest extends TestCase
{
    /**
     * @throws TransportExceptionInterface
     */
    public function testAddPicture()
    {
        // Créer un double (mock) pour ParameterBagInterface
        $params = $this->createMock(ParameterBagInterface::class);

        // Configurer le mock pour renvoyer le chemin réel où les images sont stockées dans votre application
        $params->method('get')
            ->with('images_directory') // Assurez-vous que c'est le même que dans votre service
            ->willReturn('/assets/images/uploads/products');

        // Créer un double (mock) pour UploadedFile
        $uploadedFile = $this->createMock(UploadedFile::class);

        // Créer une instance de PictureService en utilisant le mock du ParameterBagInterface
        $pictureService = new PictureService($params);

        // Appeler la méthode add() du service pour ajouter une image
        $result = $pictureService->add($uploadedFile);

        // Vérifier que la méthode renvoie un nom de fichier valide avec l'extension .webp
        $this->assertIsString($result);
        $this->assertStringContainsString('.webp', $result);
    }

    public function testDeletePicture()
    {
        // Créer un double (mock) pour ParameterBagInterface
        $params = $this->createMock(ParameterBagInterface::class);

        // Configurer le mock pour renvoyer le chemin réel où les images sont stockées dans votre application
        $params->method('get')
            ->with('images_directory') // Assurez-vous que c'est le même que dans votre service
            ->willReturn('/assets/images/uploads/products');

        // Créer un double (mock) pour UploadedFile
        $uploadedFile = $this->createMock(UploadedFile::class);

        // Créer une instance de PictureService en utilisant le mock du ParameterBagInterface
        $pictureService = new PictureService($params);

        // Appeler la méthode add() du service pour ajouter une image
        $filename = $pictureService->add($uploadedFile);

        // Appeler la méthode delete() pour supprimer l'image ajoutée
        $result = $pictureService->delete($filename);

        // Vérifier que la méthode renvoie vrai (image supprimée avec succès)
        $this->assertTrue($result);
    }
}
