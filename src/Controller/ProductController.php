<?php

namespace App\Controller;

use App\Classe\Search;
use App\Entity\Product;
use App\Form\SearchType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductController extends AbstractController
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
     * @Route("/produits", name="products")
     */
    // injecter la dépendance request
    public function index(Request $request): Response
    {
        // instancier la classe Search
        $search = new Search();
        // instancier le formulaire, méthode createForm avec sa classe SearchType et la variable pour les données $search
        $form = $this->createForm(SearchType::class, $search);
        // écouter la requête pour savoir si j'ai un POST
        $form->handleRequest($request);

        // formulaire soumis et valide ? par rapport aux contraintes du formulaire
        if ($form->isSubmitted() && $form->isValid()){
            // récupérer les données du formulaire si filtrage
            $products = $this->entityManager->getRepository(Product::class)->findWithSearch($search);
        } else {
            // récupérer tous les produits
            $products = $this->entityManager->getRepository(Product::class)->findAll();
        }

        return $this->render('product/index.html.twig', [
            'products' => $products,
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("/produit/{slug}", name="product")
     */
    // paramètre de l'URL avec un slug
    public function show($slug): Response
    {
        $product = $this->entityManager->getRepository(Product::class)->findOneBy(['slug' => $slug]);

        if (!$product){
            return $this->redirectToRoute('products');
        }

        return $this->render('product/show.html.twig', [
            'product' => $product
        ]);
    }
}
