<?php

namespace App\Controller;

use App\Entity\Adress;
use App\Form\AdressType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AccountAdressController extends AbstractController
{
    /**
     * @Route("/compte/adresses", name="account_adress")
     */
    public function index(): Response
    {

        return $this->render('account/adress.html.twig');
    }

    /**
     * @Route("/compte/ajout-adresse", name="account_adress_add")
     */
    public function add(): Response
    {
        $adress= new Adress();
        $form = $this->createForm(AdressType::class, $adress);

        return $this->render('account/adress_add.html.twig', [
            'form' => $form->createView()
        ]);
    }
}
