---
title: Attention, méthode privée, interdit de circuler
author: Mikael Randy
layout: post
permalink: /2010/12/13/attention-methode-privee-interdit-de-circuler/
categories:
  - PHP
tags:
  - php
  - POO
  - skoop
  - visibilité
comments: true
---

Ce soir, alors que je rattrapais une partie de mon retard dans mes flux d'informations (un mariage, qu'est-ce que ça prend comme temps ...), et lors de la lecture de la [revue de presse d'industrialisation PHP de la semaine dernière](http://www.industrialisation-php.com/revue-de-presse-industrialisation-php-de-la-semaine-50-2010/), je me suis intéressé au billet de [Stefan Koopmanschap](http://twitter.com/#!/skoop) : [My privates are not public, they are protected](http://www.leftontheweb.com/message/My_privates_are_not_public_they_are_protected)

Pour vous faire un résumé, Stephan se pose la question de l'utilisation de la visibilité private dans les codes sources PHP (pour rappel, un attribut/méthode private ne sera jamais accessible en dehors de la classe, même dans les classes filles, contrairement aux attributs/méthodes protected.

Selon lui, rendre une méthode privée permet de protéger certaines portion de son code de toute transformation faites par d'autres, particulièrement par des développeurs débutants qui ne testerais pas tout les cas d'utilisation de la surcharge, et qui mettrait en conséquence le fonctionnement général de votre classe.

Toutefois, il pose la question de la "surchargeabilité". En effet, en rendant une méthode privée, il n'est pas possible de la surcharger, ce qui peut devenir problématique dans des codes open source, puisqu'il n'est pas possible d'étendre une classe pour la spécialisé.

Il conclu cependant en disant que, selon lui, rendre une méthode privée, et donc bloquer la surchargeabilité d'une méthode a un bon effet : entrainer la demande d'évolution de la classe principale (via un patch, par exemple) plutôt que de la surcharger.

A la fin de cette lecture, je me suis donc reposer la question de mes choix, et il s'avère qu'ils ne sont pas trop différents des siens : pour moi, toute méthode est par défaut protected, et tout attribut est private.

Pour les attributs, c'est que je met à disposition au minimum un getter, et je ne vois donc pas l'utilité de permettre l'accès à ces attributs, mais sinon, je laisse la possibilité de modifier l'état standard de mes classes sans que je le sache (mon constructeur initialise proprement mon instance, mes getters gèrent proprement les mutations, et me garantissent un état propre. Bref, rien d'extraordinaire).  

Pour les méthodes, utiliser protected par défaut me permet d'ouvrir à la surcharge, sans permettre une utilisation ouverte à tous et de n'importe où.

Je change ces visibilités lorsque le besoin s'en fait clairement sentir : une méthode doit faire partie de l'API de ma classe, elle devient publique, et je vais donc faire attention à ce qu'elle soit d'autant plus sécurisée. Cette méthode est du traitement brut, et elle assure tout le fonctionnement de ma classe, elle deviendra donc privée.

Ma vision d'une classe est avant tout la mise à disposition d'un service. Pour faire un parallèle avec la voiture, je donne accès au démarreur, au volant et au levier de vitesse, mais pas à la boite de vitesse, ni au différentiel.  

Il n'est donc pas nécessaire de rendre toute une classe publique. Et pour le système de piston, puisque le moindre décalage met en péril le moteur complet, cette méthode sera donc privée. Et si quelqu'un veut installer un moteur électrique, soit il fait son propre fork "voiture électrique", soit il me contacte et nous réfléchissons ensemble à faire une voiture hybride, mais dans laquelle j'aurais mon mot à dire.

Et vous, comment gérez-vous vos visibilités ?
