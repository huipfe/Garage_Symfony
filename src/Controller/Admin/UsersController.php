<?php

namespace App\Controller\Admin;

use App\Repository\UsersRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/admin/utilisateurs', name: 'admin_users_')]
class UsersController extends AbstractController
{
    #[Route('/', name: 'index')]
    public function index(UsersRepository $usersRepository): Response
    {
        // Récupérez les utilisateurs avec les rôles "admin" et "employé"
        $adminUsers = $usersRepository->findByRoles(['ROLE_ADMIN', 'ROLE_EMPLOYE']);

        // Récupérez les autres utilisateurs
        $otherUsers = $usersRepository->findByExcludedRoles(['ROLE_ADMIN', 'ROLE_EMPLOYE']);

        // Fusionnez les deux tableaux
        $users = array_merge($adminUsers, $otherUsers);

        return $this->render('Admin/users/index.html.twig', compact('users'));
    }
}