<?php

namespace App\Controller;

use App\Classe\Mail;
use App\Entity\Order;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class OrderCancelController extends AbstractController
{
    // initialiser la variable pour le manager de Doctrine
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    /**
     * @Route("/commande/erreur/{stripeSessionId}", name="order_cancel")
     */
    public function index($stripeSessionId): Response
    {
        $order = $this->entityManager->getRepository(Order::class)->findOneBy(['stripeSessionId' => $stripeSessionId]);

        if (!$order || $order->getUser() != $this->getUser())
        {
            return $this->redirectToRoute('home');
        }

        $mail = new Mail();
        $content = "Bonjour ".$order->getUser()->getFirstname()."<br><br>Il semblerait que le paiement de votre commande ait été annulé et/ou ait connu un échec.<br><br>Vous pouvez retenter la validation de votre commande.<br>br>N'hésitez pas à nous contacter si le problème persiste !</br>.";
        $mail->send($order->getUser()->getEmail(), $order->getUser()->getFirstname(), 'Commande annulée Au Coin du Feu', $content);

        return $this->render('order_cancel/index.html.twig', [
            'order' => $order
        ]);
    }
}
