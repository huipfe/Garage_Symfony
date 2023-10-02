<?php

namespace App\Form;

use App\Entity\Categories;
use App\Entity\Products;
use App\Repository\CategoriesRepository;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\MoneyType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\All;
use Symfony\Component\Validator\Constraints\Image;
use Symfony\Component\Validator\Constraints\Positive;

class ProductsFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name', options:[
                'label' => 'Nom',
            ])

            ->add('description')

            ->add('price',MoneyType::class, options:[
                'label' => 'Prix',
                'divisor' => 100,
                'constraints' => [
                    new Positive(
                        message : 'Le prix ne peut être negatif'
                    )
                ]
            ])

            ->add('modeles', options:[
                'label' => 'Modèle',
            ])

            ->add('years', options:[
                'label' => 'Années',
            ])

            ->add('kilometrage', options:[
                'label' => 'Kilométrage',
            ])

            ->add('stock', options:[
                'label' => 'Unités en stock',
            ])
            ->add('categories', EntityType::class, [
                'class' => Categories::class,
                'choice_label' => 'name',
                'label' => 'Catégorie',
                'group_by' => 'parent.name',
                // Pour remplir ma liste déroulante, il va me chercher uniquement les catégories, dont le parent n'est pas null
                // Et classé en ordre de nom croissant.
                'query_builder' => function(CategoriesRepository $cr)
                {
                    return $cr->createQueryBuilder('c')
                        ->where('c.parent IS NOT NULL')
                        ->orderBy('c.name', 'ASC');
                }
            ])
            ->add('images', FileType::class, [
                'label' => false,
                'multiple' => true,
                'mapped' => false, // à false, il ne va pas aller vérif, si j'ai l'équivalent dans mon entité.
                'required' => false,
                'constraints' => [
                    new All(
                        new Image([
                        'maxWidth' => 1280,
                        'maxWidthMessage' => "L'image doit faire {{ max_width }} de largeur au maximum.",
                        ])
                    )
                ]
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Products::class,
        ]);
    }
}
