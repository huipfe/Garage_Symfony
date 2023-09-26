<?php

namespace App\Repository;

use App\Entity\GarageInfo;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<GarageInfo>
 *
 * @method GarageInfo|null find($id, $lockMode = null, $lockVersion = null)
 * @method GarageInfo|null findOneBy(array $criteria, array $orderBy = null)
 * @method GarageInfo[]    findAll()
 * @method GarageInfo[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class GarageInfoRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, GarageInfo::class);
    }

//    /**
//     * @return GarageInfo[] Returns an array of GarageInfo objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('g')
//            ->andWhere('g.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('g.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?GarageInfo
//    {
//        return $this->createQueryBuilder('g')
//            ->andWhere('g.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
