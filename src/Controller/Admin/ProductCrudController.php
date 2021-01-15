<?php

namespace App\Controller\Admin;

use App\Entity\Product;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IntegerField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\SlugField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;

class ProductCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Product::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            TextField::new('name', 'Nom')
                ->setTextAlign('center'),
            SlugField::new('slug', 'Slug')
                ->setTargetFieldName('name'),
            TextField::new('subtitle', 'Sous-titre')
                ->setTextAlign('center'),
            ImageField::new('picture', 'Illustration')
                ->setBasePath('products/')
                ->setUploadDir('public/assets/img/products/')
                ->setUploadedFileNamePattern('[randomhash].[extension]')
                ->setRequired(false),
            TextField::new('author', 'Auteur')
                ->setTextAlign('center'),
            TextField::new('editor', 'Editeur')
                ->setTextAlign('center'),
            IntegerField::new('publication_date', 'Date de publication')
                ->setTextAlign('center'),
            TextareaField::new('description', 'Description'),
            AssociationField::new('category', 'Catégorie')
                ->setTextAlign('center'),
            BooleanField::new('isBest', 'Favoris'),
            MoneyField::new('price', 'Prix')
                ->setCurrency('EUR'),
        ];
    }

}
