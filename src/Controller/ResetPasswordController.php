<?php

namespace App\Controller;

use App\Classe\Mail;
use App\Entity\ResetPassword;
use App\Entity\User;
use App\Form\ResetPasswordType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class ResetPasswordController extends AbstractController
{
    // initialiser la variable pour le manager de Doctrine
    private $entityManager;

    // injection de la dépendance EntityManagerInterface
    public function __construct(EntityManagerInterface $entityManager)
    {
        // instancier la variable entityManager
        $this->entityManager = $entityManager;
    }

    /**
     * @Route("/mot-de-passe-oublie", name="reset_password")
     */
    public function index(Request $request): Response
    {
        if ($this->getUser())
        {
            return $this->redirectToRoute('homepage');
        }

        if ($request->get('email'))
        {
            $user = $this->entityManager->getRepository(User::class)->findOneByEmail($request->get('email'));

            if ($user)
            {
                // enregistrement en BDD de la demande de reset_password
                $reset_password = new ResetPassword();
                $reset_password->setUser($user);
                $reset_password->setToken(uniqid());
                $reset_password->setCreatedAt(new \DateTime());

                $this->entityManager->persist($reset_password);
                $this->entityManager->flush();

                // mail à l'utilisateur avec lien pour maj du mot de passe
                $url = $this->generateUrl('update_password', ['token' => $reset_password->getToken()]);

                $content = "Bonjour ".$user->getFirstname()."<br><br>Vous avez demandé à réinitialiser votre mot de passe sur le site Au Coin du Feu.<br><br>";
                $content .= "Merci de bien vouloir cliquer sur le lien suivant pour <a href='".$url."'>mettre à jour celui-ci.</a>";

                $mail = new Mail();
                $mail->send($user->getEmail(), $user->getFirstname().' '.$user->getLastname(), "Réinitiliaser votre mot de passe Au Coin du Feu", $content);
                $this->addFlash('notice', 'Vous allez recevoir, sous peu, un mail avec la procédure pour réinitiliaser votre mot de passe. La demande expire dans trente minutes.');
            } else {
                $this->addFlash('notice', 'Cette adresse mail est inconnue.');
            }
        }

        return $this->render('reset_password/index.html.twig');
    }

    /**
     * @Route("/modifier-mot-de-passe/{token}", name="update_password")
     */
    public function update(Request $request, $token, UserPasswordEncoderInterface $encoder): Response
    {
        $reset_password = $this->entityManager->getRepository(ResetPassword::class)->findOneBy(['token' => $token]);

        if (!$reset_password)
        {
            return $this->redirectToRoute('reset_password');
        }

        // vérification si createAt = maintenant jusqu'à 30 minutes
        $now = new \DateTime();
        if ($now > $reset_password->getCreatedAt()->modify('+ 30 minutes'))
        {
            $this->addFlash('notice', 'Le délai de votre demande de réinitialisation de mot de passe a expiré. Merci de la renouveller.');

            return $this->redirectToRoute('reset_password');
        }

        $form = $this->createForm(ResetPasswordType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid())
        {
            $new_password = $form->get('new_password')->getData();

            $password = $encoder->encodePassword($reset_password->getUser(), $new_password);
            $reset_password->getUser()->setPassword($password);
            $this->entityManager->flush();

            $this->addFlash('notice', "Votre mot de passe a bien été mis à jour.");
            return $this->redirectToRoute('app_login');
        }

        return $this->render('reset_password/update.html.twig', [
            'form' => $form->createView()
        ]);

    }
}
