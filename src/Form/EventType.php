<?php

namespace App\Form;

use App\Entity\Events;

use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;


class EventType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name', TextType::class, [
                'attr' => ['class' => 'form-control', 'style' => 'margin-bottom:15px;']
            ])
            ->add('description', TextType::class, [
                'attr' => ['class' => 'form-control', 'style' => 'margin-bottom:15px']
            ])
            ->add('capacity', NumberType::class, [
                'attr' => ['class' => 'form-control', 'style' => 'margin-bottom:15px;']
            ])
            ->add('email',EmailType::class, [
                'attr' => ['class' => 'form-control', 'style' => 'margin-bottom:15px;', 'placeholder' => 'event@example.com']
            ])
            ->add('address', TextType::class, [
                'attr' => ['class' => 'form-control', 'style' => 'margin-bottom:15px;', 'placeholder' => 'streetname | number (optional) | ZIP code | city name']
            ])
            ->add('image', TextType::class, [
                'attr' => ['class' => 'form-control', 'style' => 'margin-bottom:15px', 'placeholder' => 'image URL']
            ])
            ->add('url', TextType::class, [
                'attr' => ['class' => 'form-control', 'style' => 'margin-bottom:15px' , 'placeholder' => 'URL']
            ])
            ->add('type', TextType::class, [
                'attr' => ['class' => 'form-control', 'style' => 'margin-bottom:15px']
            ])
            ->add('type', ChoiceType::class, [
                'choices' => ['Default' => 'Default', 'Music' => 'Music', 'Sport' => 'Sport', 'Movie' => 'Movie', 'Theater' => 'Theater', 'Museum' => 'Museum', 'Christmas' => 'Christmas'],
                'attr' => ['class' => 'form-control', 'style' => 'margin-bottom:15px; width: 300px;']
            ])
            ->add('date', DateTimeType::class, array('years' => range(date('Y'), date('Y') + 10)))
            ->add('save', SubmitType::class, [
                'label' => 'Submit event',
                'attr' => ['class' => 'btn btn-primary mt-5', 'style' => 'margin-bottom:15px']
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Events::class,
        ]);
    }
}
