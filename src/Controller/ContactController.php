<?php

namespace App\Controller;

use App\Classe\Mail;
use App\Form\ContactType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ContactController extends AbstractController
{
    /**
     * @Route("/nous-contacter", name="contact")
     */
    public function index(Request $request): Response
    {
        $form = $this->createForm(ContactType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid())
        {
            $this->addFlash('notice', 'Merci de nous avoir contacter, nous vous répondrons dans les meilleurs délais.');

            $form->getData();

            $mail = new Mail();
            $mail->send('andre.claudel.bouquiniste@gmail.com', 'Au Coin du Feu', 'Demande de contact',
                'Vous avez reçu une nouvelle demande de contact.');
        }

        return $this->render('contact/index.html.twig', [
            'form' => $form->createView()
        ]);
    }
}
