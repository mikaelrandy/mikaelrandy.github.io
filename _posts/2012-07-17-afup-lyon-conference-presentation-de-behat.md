---
title: '[AFUP Lyon] Conférence présentation de Behat'
author: Mikael Randy
layout: post
permalink: /2012/07/17/afup-lyon-conference-presentation-de-behat/
categories:
  - AFUP
tags:
  - afup
  - behat
  - conférence
  - Lyon
comments: true
---

Le mercredi 25 juillet prochain, à partir de 19h, [Julien Bianchi](http://www.jubianchi.fr/ "Julien Bianchi") ([@jubianchi](https://twitter.com/jubianchi "@jubianchi")) et [Gabriel Pillet](https://twitter.com/tentacode "Gabriel Pillet") nous présenteront [Behat](http://behat.org/ "Behat").  
La conférence aura lieu dans les locaux de [TEA](http://www.tea-ebook.com/ "The Ebook Alternative"), au 6 rue Pinton 69008 Lyon.

Pour laisser plus de chances à tout le monde de s'inscrire, les [inscriptions](http://www.eventbrite.fr/event/3936532274 "Inscription conférence behat eventbrite") ne seront ouvertes que le 17/07 à 17h (dommage qu'il n'y ait que 12 mois dans l'année ;)).

Behat est un outil permettant de rédiger des [tests de validations](http://fr.wikipedia.org/wiki/Test_de_validation "Tests de validation (Wikipedia)") qui sont un des garants du fonctionnement des méthodes agiles, tout particulièrement [SCRUM](http://fr.wikipedia.org/wiki/Scrum_(m%C3%A9thode "SCRUM (Wikipedia)").  
Il permet de rédiger des scénarios de fonctionnement, en s'abstrayant complètement du code technique nécessaire pour que ces tests passent.

Voici un exemple de scénario Behat :  

    Scénario:
      Etant donné que j'ai un compte bancaire
      Et que le solde de mon compte est de "10" euros
      Quand j'ajoute "5" euros sur mon compte
      Alors mon solde doit être de "15" euros
    Scénario:
      Etant donné que j'ai un compte bancaire
      Et que le solde de mon compte est de "10" euros
      Quand je retire "50" euros sur mon compte
      Alors je dois avoir le message d'erreur "vous n'avez pas le droit d'être à découvert"
      Et mon solde doit être de "10" euros
