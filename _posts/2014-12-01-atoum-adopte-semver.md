---
title: 'atoum adopte semver'
author: Mikael Randy
layout: post
permalink: /2014/12/01/atoum-adopte-semver/
categories:
  - atoum
tags:
  - atoum
  - semver
comments: true
---

Pour ceux qui ne le savent pas encore, j'utilise [atoum](https://github.com/atoum/atoum) pour mes tests unitaires.

Il s'agit d'un framework de tests unitaire qui a été le premier à mes yeux à bousculer [PHPUnit](https://phpunit.de/) avec une approche novatrice, orienté objet, avec des performance impressionnante, un système de [mock][#1] très simple et efficace.

Depuis 3 ans, j'évangélise cet outil partout où je passe, même chez [M6Web](http://tech.m6web.fr/), pour qui je travaille depuis 1 an 1/2.

Toutefois, lors de cette dernière expérience, je me suis confronté aux limitations de la [Rolling Release](http://fr.wikipedia.org/wiki/Rolling_release), à savoir que lorsque l'on déploie atoum sur plein de projets, on emporte continuellement des nouveautés qui influent sur le résultats.
Tant que ces changements sont compatibles avec l'existant, cela ne pose pas plus de problème que ça. Par contre, lorsqu'un changement apporte une régression, il suffit d'utiliser des outils d'intégration continue, et c'est tout les déploiements d'une société qui peuvent se retrouver bloquer.

On peut débattre sur la manière de nommer le changement : regression, correction, évolution, mais à partir du moment où le résultat de l'exécution d'une suite de tests change uniquement parce que l'outil de test à évolué, je considère qu'il y a régression.

En conséquence, je milite depuis plus d'un an pour qu'atoum soit taggé, de manière à pouvoir stabiliser la version d'atoum utilisée pour un projet.

Et depuis ce matin, cet espoir est comblé puisque la [release 1.0.0 de atoum a été délivrée](http://jubianchi.fr/atoum-release.htm) ! J'irais même plus loin en disant qu'atoum va désormais être taggé selon l'approche [semver](http://semver.org/lang/fr/) !

Et si vous avez lu l'article de Julien, vous aurez donc vu que nous sommes désormais 2 RM (Release Manager), [Ivan Enderlin](https://github.com/Hywan) et moi-même, à gérer ce versionning qui va très fortement faciliter l'intégration d'atoum via composer, et qui, je l'espère, sera une véritable aide à sa démocratisation.

Me voici donc embarqué dans la team atoum, ce qui est un grand honneur qui m'est fait, et qui me donne désormais envie de m'investir un peu plus dans son développement.

[#1]: http://fr.wikipedia.org/wiki/Mock_(programmation_orient%C3%A9e_objet)
