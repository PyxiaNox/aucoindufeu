<?php

namespace App\Form;

use App\Entity\Adress;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class AdressType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name', TextType::class, [
                'label' => "Nom personnalisé de l'adresse",
                'attr' => [
                    'placeholder' => "Nom personnalisé de l'adresse"
                ]
            ])
            ->add('firstname', TextType::class, [
                'label' => "Prénom",
                'attr' => [
                    'placeholder' => "Votre prénom"
                ]
            ])
            ->add('lastname', TextType::class, [
                'label' => "Nom",
                'attr' => [
                    'placeholder' => "Votre nom"
                ]
            ])
            ->add('company', TextType::class, [
                'label' => "Nom de société (optionnel)",
                'attr' => [
                    'placeholder' => "Nom de votre société (optionnel)"
                ]
            ])
            ->add('adress', TextType::class, [
                'label' => "Adresse",
                'attr' => [
                    'placeholder' => "Votre adresse ou celle de votre société"
                ]
            ])
            ->add('zipcode', TextType::class, [
                'label' => "Code postal",
                'attr' => [
                    'placeholder' => "Votre code postal"
                ]
            ])
            ->add('city', TextType::class, [
                'label' => "Ville",
                'attr' => [
                    'placeholder' => "Votre ville"
                ]
            ])
            ->add('country', TextType::class, [
                'label' => "Pays",
                'attr' => [
                    'placeholder' => "Votre pays"
                ]
            ])
            ->add('phone', TextType::class, [
                'label' => "Téléphone",
                'attr' => [
                    'placeholder' => "Votre numéro de téléphone"
                ]
            ])
            ->add('submit', SubmitType::class, [
                'label' => "Ajouter l'adresse"
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Adress::class,
        ]);
    }
}
