<?php

namespace App\Repository;

use App\Entity\Products;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Tools\Pagination\Paginator;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Products>
 *
 * @method Products|null find($id, $lockMode = null, $lockVersion = null)
 * @method Products|null findOneBy(array $criteria, array $orderBy = null)
 * @method Products[]    findAll()
 * @method Products[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ProductsRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Products::class);
    }

    public function findProductsPaginated(int $page, string $slug, int $limit = 6) : array
    {

        $limit = abs($limit); // Avoir toujours une limite positive

        $result = [];


        // La requête - chercher les catégories et les produits, et filtrer sur le slug
        // c = catégories, p = produits, select = sélection, from = d'ou/localisation, join = jointure, where = vers Ou/localisation
        $query = $this->getEntityManager()->createQueryBuilder()
            ->select('c', 'p') // Selectionner tout ce qui a dans catégorie et produit
            ->from('App\Entity\Products', 'p') // de la table products
            ->join('p.categories', 'c') // Jointe à catégorie/par l'intermédiaire du champ catégories
            ->where("c.slug = '$slug'") // Et on va lui dire : "tu me prends les produits qui ont commme slug de catégorie, le slug qu'on lui passe dans la fonction"
            ->setMaxResults($limit) //Le maxmimun de résultat trouvable sur une page, sinon on pagine.
            ->setFirstResult(($page * $limit) - $limit); // Le premier de la page dans laquelle je me trouve, page multiplié par la limite, moins la limite

        //dd($query->getQuery()->getResult());

        // Pagination, on veux paginer (via doctrine)
        $paginator = new Paginator($query);
        $data = $paginator->getQuery()->getResult();

        //dd($data);

        // On vérifie qu'on a des données
        if(empty($data)){
            return $result; // Si on a pas de donnée, on retourne le résultat
        }

        // On vérifie le nombre de page
        $pages = ceil($paginator->count() / $limit); //Le plafond de page, via le paginator, diviser par la limite

        // On va remplir le tableau
        $result['data'] = $data; // Les données
        $result['pages'] = $pages; // Toutes les pages
        $result['page'] = $page; // Une page, pour savoir à quelle page je me trouve
        $result['limit'] = $limit; //On passe notre limite




        return $result;

    }

//    /**
//     * @return Products[] Returns an array of Products objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('p')
//            ->andWhere('p.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('p.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?Products
//    {
//        return $this->createQueryBuilder('p')
//            ->andWhere('p.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
