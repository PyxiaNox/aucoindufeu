<?php

namespace App\Controller;

use App\Classe\Mail;
use App\Entity\User;
use App\Form\RegisterType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class RegisterController extends AbstractController
{
    // initialiser la variable pour le manager de Doctrine
    private $entityManager;

    // injection de la dépendance EntityManagerInterface
    public function __construct(EntityManagerInterface $entityManager){
        // instancier la variable entityManager
        $this->entityManager = $entityManager;
    }

    /**
     * @Route("/inscription", name="register")
     */
    // injecter la dépendance request + cryptage de mots de passe (voir security.yaml)
    public function index(Request $request, UserPasswordEncoderInterface $encoder): Response
    {
        $notification = null;

        // instancier la classe User
        $user = new User();
        // instancier le formulaire, méthode createForm avec sa classe RegisterType et la variable pour les données $user
        $form = $this->createForm(RegisterType::class, $user);

        // écouter la requête pour savoir si j'ai un POST
        $form->handleRequest($request);

        // formulaire soumis et valide ? par rapport aux contraintes du formulaire
        if ($form->isSubmitted() && $form->isValid()){

            // récupérer toutes les données du formulaire
            $user = $form->getData();

            $email = $user->getEmail();
            $search_mail = $this->entityManager->getRepository(User::class)->findOneBy(['email' => $email]);

            if (!$search_mail)
            {
                // stockage du mot de passe crypté
                $password = $encoder->encodePassword($user, $user->getPassword());

                // injection dans l'objet user
                $user->setPassword($password);

                // figer la data pour l'enregistrer
                $this->entityManager->persist($user);
                // exécuter la persistance
                $this->entityManager->flush();

                $mail = new Mail();
                $content = "Bonjour ".$user->getFirstname()."<br>Bienvenue sur le site Au Coin du Feu, 
                votre bouquiniste spécialisé dans l'expertise et la vente de livres rares et anciens !";
                $mail->send($user->getEmail(), $user->getFirstname(), 'Bienvenue Au Coin du Feu', $content);

                $notification = "Votre inscription a bien été enregistrée. Vous pouvez dès à présent 
                vous connecter à votre compte.";
            } else {
                $notification = "L'adresse mail que vous avez renseigné existe déjà.";
            }
        }

        return $this->render('register/index.html.twig', [
            'form' => $form->createView(),
            'notification' => $notification
        ]);
    }
}
