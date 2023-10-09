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

use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;

class ProductsFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        //$builder->addEventListener(FormEvents::PRE_SET_DATA, function (FormEvent $event) {
            //$product = $event->getData();
            //$form = $event->getForm();

            // Vérifiez si un produit est en cours de modification (auquel cas $product sera un objet Products)
            // ou s'il s'agit d'une création (auquel cas $product sera null).
            //if ($product instanceof Products) {
                //$parentCategoryName = $product->getCategories()->getParent()->getName();

                // Personnalisez les labels en fonction de la catégorie parente.
                //$form->add('name', null, [
                    //'label' => $parentCategoryName === 'Services' ? 'Nom du Service' : 'Nom de la Voiture',
                //]);
                //$form->add('modeles', null, [
                    //'label' => $parentCategoryName === 'Services' ? 'Type de Service' : 'Modèle',
                //]);
                //$form->add('years', null, [
                    //'label' => $parentCategoryName === 'Services' ? 'Disponible jusqu\'en' : 'Année',
                //]);
                //$form->add('kilometrage', null, [
                    //'label' => $parentCategoryName === 'Services' ? 'Durée' : 'Kilométrage',
                //]);
            //}
        //});

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
                'label' => 'Modèle/Type de Service',
            ])

            ->add('years', options:[
                'label' => 'Années/Disponible jusqu\'en',
            ])

            ->add('kilometrage', options:[
                'label' => 'Kilométrage/Durée',
            ])

            ->add('stock', options:[
                'label' => 'Unités en stock/Nombre disponible',
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
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Products::class,
        ]);
    }
}



