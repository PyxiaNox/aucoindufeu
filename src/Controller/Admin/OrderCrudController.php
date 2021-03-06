<?php

namespace App\Controller\Admin;

use App\Classe\Mail;
use App\Entity\Order;
use App\Entity\Product;
use Doctrine\ORM\EntityManagerInterface;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Context\AdminContext;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\ArrayField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ChoiceField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Router\CrudUrlGenerator;

class OrderCrudController extends AbstractCrudController
{
    private $entityManager;
    private $crudUrlGenerator;

    public function __construct(EntityManagerInterface $entityManager, CrudUrlGenerator $crudUrlGenerator)
    {
        $this->entityManager = $entityManager;
        $this->crudUrlGenerator = $crudUrlGenerator;
    }

    public static function getEntityFqcn(): string
    {
        return Order::class;
    }

    public function configureActions(Actions $actions): Actions
    {
        $updatePreparation = Action::new('updatePreparation', 'Préparation en cours', 'fas fa-box-open')->linkToCrudAction('updatePreparation');
        $updateDelivery = Action::new('updateDelivery', 'Livraison en cours', 'fas fa-truck')->linkToCrudAction('updateDelivery');

        return $actions
            ->add('detail', $updatePreparation)
            ->add('detail', $updateDelivery)
            ->add('index', 'detail');
    }

    public function UpdatePreparation(AdminContext $context)
    {
        $order = $context->getEntity()->getInstance();
        $order->setState(2);

        $this->entityManager->flush();
        $this->addFlash('notice', "<span style='color: #008855;'><strong>La commande ".$order->getReference()." est bien <u>en cours de préparation</u>.</strong></span>");

        $url = $this->crudUrlGenerator->build()
            ->setController(OrderCrudController::class)
            ->setAction('index')
            ->generateUrl();

        $mail = new Mail();
        $content = "Bonjour ".$order->getUser()->getFirstname()."<br><br>Votre commande <strong>".$order->getReference()."</strong> sur le site Au Coin du Feu est en cours de préparation.";
        $mail->send($order->getUser()->getEmail(), $order->getUser()->getFirstname(), 'Commande en cours de préparation Au Coin du Feu', $content);

        return $this->redirect($url);
    }

    public function UpdateDelivery(AdminContext $context)
    {
        $order = $context->getEntity()->getInstance();
        $order->setState(3);

        $this->entityManager->flush();
        $this->addFlash('notice', "<span style='color: #008855;'><strong>La commande ".$order->getReference()." est bien <u>en cours de livraison</u>.</strong></span>");

        $url = $this->crudUrlGenerator->build()
            ->setController(OrderCrudController::class)
            ->setAction('index')
            ->generateUrl();

        $mail = new Mail();
        $content = "Bonjour ".$order->getUser()->getFirstname()."<br><br>Votre commande <strong>".$order->getReference()."</strong> sur le site Au Coin du Feu est en cours de livraison.";
        $mail->send($order->getUser()->getEmail(), $order->getUser()->getFirstname(), 'Commande en cours de livraison Au Coin du Feu', $content);

        return $this->redirect($url);
    }

    public function configureCrud(Crud $crud): Crud
    {
        return $crud->setDefaultSort(['id'=>'DESC']);
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id', 'Commande n°')
                ->setTextAlign('center'),
            DateTimeField::new('createAt', 'Passée le'),
            TextField::new('user.getFullname', 'Client')
                ->setTextAlign('center'),
            TextEditorField::new('delivery', 'Adresse de livraison')->onlyOnDetail(),
            MoneyField::new('total', 'Total')->setCurrency('EUR')
                ->setTextAlign('center'),
            TextField::new('carrierName', 'Transporteur')
                ->setTextAlign('center'),
            MoneyField::new('carrierPrice', 'Frais de port')->setCurrency('EUR')
                ->setTextAlign('center'),
            ChoiceField::new('state', 'Etat')->setChoices([
                'Non-payée' => 0,
                'Payée' => 1,
                'Préparation en cours' => 2,
                'Livraison en cours' => 3
            ])
                ->setTextAlign('center'),
            ArrayField::new('orderDetails', 'Livres achetés')->hideOnIndex()
        ];
    }

}
