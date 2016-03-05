---
title: 'Code reviews : just do it'
author: Mikael Randy
layout: post
permalink: /2014/05/14/code-reviews-just-do-it/
categories:
  - Organisation
tags:
  - code review
  - Git
  - pull requests
  - team
comments: true
---

Ce titre est volontairement repris sur l'[article d'Éric](https://n.survol.fr/n/code-reviews-just-do-it "Eric - Code reviews : just do it"), car il s'agit d'une réponse/complément que je ne me voyais pas faire en commentaire.

Ayant travaillé chez TEA par le passé, j'ai donc la connaissance de la manière dont se passent les code reviews chez TEA, et je suis en phase complète avec les avantages listés par Éric : augmentation de la qualité et partage de l'information.  
Il y a non seulement le fait que plusieurs yeux, plusieurs esprits passent sur un code, une problématique, et il y a donc un échange constant sur ce qui est fait, pourquoi et comment. Mais il y a aussi et surtout une vraie communication qui se met en place entre les développeurs, réduisant l'effet de chapelle (une seule personne capable d'intervenir sur un code) et augmentant la cohérence générale d'un projet.

J'ai également constaté un effet de bord plutôt sympathique, car lorsque l'on sait que son code va être relu, on s'oblige à le faire beaucoup plus propre et on s'interdit les petits raccourcis crades qu'on pourrait utiliser dans un moment de flemme, d'une manière semblable à ce qui se passe quand on code pour un projet open-source.

Depuis, je travaille en délégation chez M6Web, dans l'équipe Replay, et nous avons mis en place le même système : tout développement se passe dans sa branche propre, amène à la création d'une PR, et il faut la validation de 2 personnes de l'équipe (sur 8 personnes) pour que la PR soit mergeable.  
Toutefois, ce système peut rapidement trouver ses limites. Chez M6Web, La focalisation par projet est moindre, du fait du nombre de personnes composant l'équipe et de l'organisation de la structure, ce qui implique que nous travaillons sur une grosse dizaine de projets en parallèle et cela a des impacts :

* Il est souvent compliqué intellectuellement de switcher de projet et de problématique pour relire le code de quelqu'un d'autre.
* Savoir quelles sont les PR en attente sur une dizaine de projets est un vrai exercice d'équilibriste qui demande, à l'état brut, de parcourir les PR en attente sur tous les projets pour voir celles qui sont en attente.

Au final, nous avons un phénomène d'empilement des PR qui pénalise l'avancement quotidien.

Toutefois, tout ceci n'est qu'un problème d'organisation, et il vaut mieux trouver comment contourner les limites plutôt que de faire marche arrière sur la code review automatique.

Je ne manquerai pas de vous faire un retour des solutions que nous avons mises en place.
