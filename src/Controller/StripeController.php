<?php

namespace App\Controller;

use App\Entity\Order;
use App\Entity\Product;
use Doctrine\ORM\EntityManagerInterface;
use Stripe\Checkout\Session;
use Stripe\Exception\ApiErrorException;
use Stripe\Stripe;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class StripeController extends AbstractController
{
    /**
     * @Route("/commande/creation-session/{reference}", name="stripe_create_session", methods={"GET", "POST"})
     * @param EntityManagerInterface $entityManager
     * @param $reference
     * @return Response
     * @throws ApiErrorException
     */
    public function index(EntityManagerInterface $entityManager, $reference): Response
    {
        require 'vendor/autoload.php';

        header('Content-Type: application/json');

        $products_for_stripe = [];
        $YOUR_DOMAIN = 'http://127.0.0.1:80';

        $order = $entityManager->getRepository(Order::class)->findOneBy(['reference' => $reference]);

        if (!$order)
        {
            new JsonResponse(['error' => 'order']);
        }

        foreach ($order->getOrderDetails()->getValues() as $product)
        {
            $product_object = $entityManager->getRepository(Product::class)->findOneBy([$product->getProduct()]);
            $products_for_stripe[] = [
                'price_data' => [
                    'currency' => 'EUR',
                    'unit_amount' => $product->getPrice(),
                    'product_data' => [
                        'name' => $product->getProduct(),
                        'images' => [$YOUR_DOMAIN."/img/products/".$product_object->getPicture()],
                    ],
                ],
            ];
        }

        $products_for_stripe[] = [
            'price_data' => [
                'currency' => 'EUR',
                'unit_amount' => $order->getCarrierPrice(),
                'product_data' => [
                    'name' => $order->getCarrierName(),
                    'images' => [$YOUR_DOMAIN],
                ],
            ],
            'quantity' => 1
        ];

        Stripe::setApiKey('sk_test_51I5hTJCnopHiSqQNaiopuA8W8zWySDbAzrKsgrWth4i4hC2oQcNv6lKKFXdW3RYhRchrxM3gsl7bfj1YQ4j25UQf00woWIqim2');

        $YOUR_DOMAIN = 'http://127.0.0.1:80';

        $checkout_session = Session::create([
            'customer_email' => $this->getUser()->getEmail(),
            'payment_method_types' => ['card'],
            'line_items' => [
                $products_for_stripe
            ],
            'mode' => 'payment',
            'success_url' => $YOUR_DOMAIN . '/commande/merci/{CHECKOUT_SESSION_ID}',
            'cancel_url' => $YOUR_DOMAIN . '/commande/erreur/{CHECKOUT_SESSION_ID}',
        ]);

        $order->setStripeSessionId($checkout_session->id);
        $entityManager->flush();

        $response = new JsonResponse(['id' => $checkout_session->id]);
        return $response;
    }
}
