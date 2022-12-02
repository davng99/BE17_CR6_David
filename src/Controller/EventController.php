<?php

namespace App\Controller;

use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;

use App\Entity\Events;
use App\Form\EventType;


class EventController extends AbstractController
{
    #[Route('/', name: 'app_event')]
    public function index(ManagerRegistry $doctrine): Response
    {
        $events = $doctrine->getRepository(Events::class)->findAll();

        return $this->render('event/index.html.twig', ['events' => $events]);
    }

    #[Route('/create', name: 'event_create')]
    public function create(Request $request, ManagerRegistry $doctrine): Response
    {
        $event = new Events();
        $form = $this->createForm(EventType::class, $event);

        $form->handleRequest($request);

        /* Here we have an if statement, if we click submit and if  the form is valid we will take the values from the form and we will save them in the new variables */
        if ($form->isSubmitted() && $form->isValid()) {
            // $now = new \DateTime('now');

            // taking the data from the inputs with the getData() function and assign it to the $todo variable
            $event = $form->getData();
            //$event->setCreateDate($now);  // this field is not included in the form so we set the today date
            $em = $doctrine->getManager();
            $em->persist($event);
            $em->flush();

            $this->addFlash(
                'notice',
                'Event Added'
            );

            return $this->redirectToRoute('app_event');
        }

        /* now to make the form we will add this line form->createView() and now you can see the form in create.html.twig file  */
        return $this->render('event/create.html.twig', ['form' => $form->createView()]);
    }


    #[Route('/edit/{id}', name: 'event_edit')]
    public function edit(Request $request, ManagerRegistry $doctrine, $id): Response
    {
        $event = $doctrine->getRepository(Events::class)->find($id);
        $form = $this->createForm(EventType::class, $event);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // $now = new \DateTime('now');
            $event = $form->getData();
            // $event->setCreateDate($now);
            $em = $doctrine->getManager();
            $em->persist($event);
            $em->flush();
            $this->addFlash(
                'notice',
                'Event Edited'
            );

            return $this->redirectToRoute('app_event');
        }

        return $this->render('event/edit.html.twig', ['form' => $form->createView(), 'event' => $event]);
    }

    #[Route('/details/{id}', name: 'event_details')]
    public function details(ManagerRegistry $doctrine, $id): Response
    {
        $event = $doctrine->getRepository(Events::class)->find($id);

        return $this->render('event/details.html.twig', ['event' => $event]);
    }

    #[Route('/delete/{id}', name: 'event_delete')]
    public function delete($id, ManagerRegistry $doctrine)
    {
        $em = $doctrine->getManager();
        $event = $doctrine->getRepository(Events::class)->find($id);
        $em->remove($event);

        $em->flush();
        $this->addFlash(
            'notice',
            'Event Removed'
        );

        return $this->redirectToRoute('app_event');
    }

    // =============================== filter (somehow not working with event type column; it actually worked with other columns - capacity, name, etc...) ======================================

    #[Route('/filter/{filter}', name: 'filter_event')]
    public function filter(ManagerRegistry $doctrine, $filter): Response
    {
        $events = $doctrine->getRepository(Events::class)->findBy(['Type' => $filter]);
        // $events = $doctrine->getRepository(Events::class)->findBy(['name' => 'Rebecca']);
        // $events = $doctrine->getRepository(Events::class)->findBy(['email' => 'wienticket@mail.com']);

        return $this->render('event/filter.html.twig', ['events' => $events]);
    }

    // ============================= filter ======================================
}
