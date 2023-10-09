<?php

namespace App\Controller;

use App\Entity\GarageInfo;
use App\Repository\GarageInfoRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Validator\Validator\ValidatorInterface;

#[Route('/contact', name: 'contact_')]
class ContactController extends AbstractController
{
    #[Route('/', name: 'index')]
    public function index(GarageInfoRepository $infoGarageRepository): Response
    {
        // Récupérez les informations de la table InfoGarage depuis votre repository
        $infoGarage = $infoGarageRepository->findOneBy([]); // Vous devrez ajuster cela en fonction de votre logique de récupération

        return $this->render('contact/index.html.twig', [
            'controller_name' => 'ContactController',
            'info_garage' => $infoGarage, // Passez les informations de la table à la vue
        ]);
    }

    #[Route("/contact/send_mail", name: "send_mail", methods: ["POST"])]
    public function sendMail(Request $request, ValidatorInterface $validator): Response
    {
        // Récupérer les valeurs du formulaire
        $name = $request->request->get('name');
        $email = $request->request->get('email');
        $message = $request->request->get('message');
        $subject = $request->request->get('subject');

        // Valider les données avec Symfony Validator
        $errors = $validator->validate([
            'name' => $name,
            'email' => $email,
            'message' => $message,
            'subject' => $subject,
        ]);

        if (count($errors) > 0) {
            // Il y a des erreurs de validation
            $errorMessages = [];
            foreach ($errors as $error) {
                $errorMessages[$error->getPropertyPath()] = $error->getMessage();
            }

            return new JsonResponse(['status' => 'error', 'message' => $errorMessages], 400);
        }

        // Adresse e-mail de destination
        $to = 'Garage-Parrot@gmail.com'; //Mail du destinataire, propriétaire du Garage

        // Corps de l'e-mail
        $body = "Sujet: " . $subject . "\n";
        $body .= "Nom: " . $name . "\n";
        $body .= "Email: " . $email . "\n";
        $body .= "Message: " . $message;

        // En-têtes de l'e-mail
        $headers = "From: " . $email . "\r\n";
        $headers .= "Reply-To: " . $email . "\r\n";

        // Envoyer l'e-mail
        if (mail($to, $subject, $body, $headers)) {
            // L'e-mail a été envoyé avec succès
            return new JsonResponse(['status' => 'success', 'message' => 'Le formulaire a été envoyé avec succès!']);
        } else {
            // Une erreur s'est produite lors de l'envoi de l'e-mail
            return new JsonResponse(['status' => 'error', 'message' => 'Une erreur s\'est produite lors de l\'envoi du formulaire.'], 500);
        }
    }


}
