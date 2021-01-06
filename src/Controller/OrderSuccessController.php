<?php

namespace App\Controller;

use App\Classe\Cart;
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

        // Envoyer un mail au client pour confirmation de commande


        return $this->render('order_success/index.html.twig', [
            'order' => $order
        ]);
    }
}
