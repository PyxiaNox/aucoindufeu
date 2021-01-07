<?php

namespace App\Controller;

use App\Classe\Cart;
use App\Classe\Mail;
use App\Entity\Order;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class OrderSuccessController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    /**
     * @Route("/commande/merci/{stripeSessionId}", name="order_success")
     * @param $stripeSessionId
     * @param Cart $cart
     * @return Response
     */
    public function index($stripeSessionId, Cart $cart): Response
    {
        $order = $this->entityManager->getRepository(Order::class)->findOneBy(['stripeSessionId' => $stripeSessionId]);

        if (!$order || $order->getUser() != $this->getUser())
        {
            return $this->redirectToRoute('home');
        }

        $cart->remove();

        // Modifier le status 'isPaid' de la commande en mettant "1"
        if (!$order->getIsPaid())
        {
            $order->setIdPaid(1);
            $this->entityManager->flush();
        }

        $mail = new Mail();
        $content = "Bonjour ".$order->getUser()->getFirstname()."<br>Nous vous remercions pour votre commande et souhaitons qu'elle vous satisfasse.<br>En espérant vous revoir bientôt !</br>.";
        $mail->send($order->getUser()->getEmail(), $order->getUser()->getFirstname(), 'Commande validée Au Coin du Feu', $content);


        return $this->render('order_success/index.html.twig', [
            'order' => $order
        ]);
    }
}
