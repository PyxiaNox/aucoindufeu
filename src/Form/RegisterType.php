<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use function Sodium\add;

class RegisterType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('firstname', TextType::class, [
                'label' => 'Prénom',
                'attr' => [
                    'placeholder' => 'Renseignez votre prénom'
                ]
            ])
            ->add('lastname', TextType::class, [
                'label' => 'Nom',
                'attr' => [
                    'placeholder' => 'Renseignez votre nom'
                ]
            ])
            ->add('email', EmailType::class, [
                'label' => 'Adresse mail',
                'attr' => [
                    'placeholder' => 'Renseignez votre adresse mail'
                ]
            ])
            ->add('password', PasswordType::class, [
                'label' => 'Mot de passe',
                'attr' => [
                    'placeholder' => 'Renseignez votre mot de passe'
                ]
            ])
            ->add('confirmpassword', PasswordType::class, [
                'label' => 'Confirmation du mot de passe',
                'mapped' => false,
                'attr' => [
                    'placeholder' => 'Confirmez votre mot de passe'
                ]
            ])
            ->add('submit', SubmitType::class, [
                'label' => 'Inscription'
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
