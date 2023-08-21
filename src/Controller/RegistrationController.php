<?php

namespace App\Controller;

use App\Entity\Users;
use App\Form\RegistrationFormType;
use App\Repository\UsersRepository;
use App\Security\UsersAuthenticator;
use App\Service\JWTService;
use App\Service\SendMailService;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\Mapping\Entity;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Authentication\UserAuthenticatorInterface;
use Symfony\Contracts\Translation\TranslatorInterface;

class RegistrationController extends AbstractController
{
    #[Route('/register', name: 'app_register')]
    public function register(Request $request, UserPasswordHasherInterface $userPasswordHasher,
                             UserAuthenticatorInterface $userAuthenticator, UsersAuthenticator $authenticator,
                             EntityManagerInterface $entityManager, SendMailService $mail, JWTService $jwt): Response
    {
        $user = new Users();
        $form = $this->createForm(RegistrationFormType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // encode the plain password
            $user->setPassword(
                $userPasswordHasher->hashPassword(
                    $user,
                    $form->get('plainPassword')->getData()
                )
            );

            $entityManager->persist($user);
            $entityManager->flush();

            // On génère le JWT de l'utilisateur

            // On créer le header
            $header =
                [
                    'type' => 'JWT',
                    'alg' => 'HS256'
                ];

            // ON créer le payload
            $payload =
                [
                    'user_id' => $user->getId()
                ];

            // On génère le Token

            $token = $jwt ->generate($header, $payload,
            $this->getParameter('app.jwtsecret'));

            //dd($token);

            // do anything else you need here, like send an email
            // On envoie un mail
            $mail->send(
                'no-reply@monsite.com',
                $user->getEmail(),
                "Activation de votre compte sur le site d'E-Commerce",
                'register',
                compact('user', 'token')
            );

            return $userAuthenticator->authenticateUser(
                $user,
                $authenticator,
                $request
            );
        }

        return $this->render('registration/register.html.twig', [
            'registrationForm' => $form->createView(),
        ]);
    }

    #[Route("/verification/{token}", name: "verify_user")]
    public function verifyUser($token, JWTService $jwt,
                               UsersRepository $usersRepository,
                               EntityManagerInterface $em) : Response
    {
       // On va vérifier si le token est valide, n'a pas expiré, et n'a pas été modifié.
        if($jwt->isValid($token) && !$jwt->isExpired($token) &&
            $jwt->CheckSignature($token, $this->getParameter('app.jwtsecret'))) {
            // On récupère le payload
            $payload = $jwt->getPayload($token);

            // On récupère le user du token
           $user = $usersRepository->find($payload['user_id']);

           // On vérfie que l'utilisateur existe, et n'a pas encore activé son compte
            if($user && !$user->getIsVerified()){
                $user->setIsVerified(true);
                $em ->flush($user);
                $this->addFlash('success', 'Utilisateur activé');
                return $this->redirectToRoute('profile_index');
            }
        }
        // Ici un problème se présente, dans le token.
        $this->addFlash('danger', 'Le token est invalide, ou a expiré');

        return $this->redirectToRoute('app_login');
    }

    #[Route ('/renvoiverif', name : 'resend_verif')]

     public function resendVerif(JWTService $jwt, SendMailService $mail, UsersRepository $usersRepository) : response
    {
        $user = $this->getUser();

        // On vérifie s'il est connecté
        if(!$user){
            $this->addFlash('danger', 'Vous devez être connecté pour accèder à cette page');
            return $this->redirectToRoute('app_login');
        }

        // On vérifie s'il est vérifié
        if($user->getIsVerified()){
            $this->addFlash('warning', 'Cette utilisateur est deja activé');
            return $this->redirectToRoute('profile_index');
        }

        // On recréer le token, et on renvoi le mail

        // On génère le JWT de l'utilisateur
        // On créer le header
        $header =
            [
                'type' => 'JWT',
                'alg' => 'HS256'
            ];

        // ON créer le payload
        $payload =
            [
                'user_id' => $user->getId()
            ];

        // On génère le Token

        $token = $jwt ->generate($header, $payload,
            $this->getParameter('app.jwtsecret'));

        //dd($token);

        // do anything else you need here, like send an email
        // On envoie un mail
        $mail->send(
            'no-reply@monsite.com',
            $user->getEmail(),
            "Activation de votre compte sur le site d'E-Commerce",
            'register',
            compact('user', 'token')
        );

        // On a renvoyer l'email pour activer le compte
            $this->addFlash('success', 'Email de vérification renvoyé');
            return $this->redirectToRoute('profile_index');
    }
}