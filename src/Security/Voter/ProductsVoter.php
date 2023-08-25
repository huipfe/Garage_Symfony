<?php


namespace App\Security\Voter;

use App\Entity\Products;
use phpDocumentor\Reflection\Types\Self_;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Core\Authorization\Voter\Voter;
use Symfony\Component\Security\Core\Security;
use Symfony\Component\Security\Core\User\UserInterface;

class ProductsVoter extends Voter
{
    const EDIT = 'PRODUCTS_EDIT';
    const DELETE = 'PRODUCTS_DELETE';

    private $security;

    public function __construct(Security $security)
    {

        $this->security = $security;

    }

    protected function supports(string $attribute, $product): bool
    {
        //Si l'attribut n'est pas dans un tableau
        if(!in_array($attribute, [self::EDIT, self::DELETE])){ //Si l'attribut n'est pas dans ces deux là, Edit et Delete, alors
            return false;
        }
        // On vérifie si product est une instance de l'entité products
        if(!$product instanceof Products){
            return false;
        }
        return true;

        // On aurait pu juste écrire cette ligne là.
        // return in_array($attribute, [self::EDIT, self::DELETE])) && $product instanceof Products;
    }

    protected function voteOnAttribute($attribute, $product, TokenInterface $token): bool
    {

        // On récupère l'utilisateur à partir du token.
        $user = $token->getUser();

        if(!$user instanceof UserInterface) return false;


        // On vérifie si l'utilisateur est admin
        // Il fait ce qu'il veut, donc on valide les informations
        if($this->security->isGranted('ROLE_ADMIN')) return true;

        // Si l'utilisateur est connecté, mais pas admin
        // On vérifie les permissions
        switch ($attribute){
            case self::EDIT:
                // On vérifie si l'utilisateur peut éditer
                return $this->canEdit();
                break;
            case self::DELETE:
                // On vérifie si l'utilisateur peut supprimer
                return $this->canDelete();
                break;
        }

        return false;
    }

    private function canEdit(){
        // si l'utilisateur à le role employé
        return $this->security->isGranted('ROLE_EMPLOYE');
    }

    private function canDelete(){
        // si l'utilisateur à le role employé
        return $this->security->isGranted('ROLE_ADMIN');
    }
}