---
title: Apple quitte MySQL pour PostGreSQL
author: Mikael Randy
layout: post
permalink: /2011/08/03/apple-quitte-mysql-pour-postgresql/
categories:
  - Mac
tags:
  - apple
  - MacOSX
  - MySQL
  - PostGreSQL
comments: true
---

Ce jour, en lisant mes flux RSS, je suis tombé sur un article indiquant que [Mac OS X Lion abandonnait MySQL pour PostGreSQL](http://www.macgeneration.com/news/voir/211032/pourquoi-mysql-a-disparu-de-lion-server).

Pour information, je n'ai toujours pas migré de Snow Leopard vers Lion, car j'attends les 1er retours avant de me jeter sur la mise à jour.

Mais revenons au sujet : le remplacement de MySQL par PostGreSQL.  
Pour ma part, cela fait longtemps que MySQL n'est plus mon SGBD préféré, et je dirais même que j'ai pas mal de choses à lui reprocher, dont la source est toujours la même : sous couvert de simplicité d'utilisation, il ne respecte pas la norme [SQL ANSI-92](http://www.contrib.andrew.cmu.edu/~shadow/sql/sql1992.txt).

* Possibilité d'utiliser des mots-clés réservés pour les tables, colonnes, ... en utilisant le "\`"
* Création automatique d'index
* Intégration des dates plus que limitée (tout est converti en timestamp à votre insu)
* tant encore

Je sais bien que vous pourrez me répondre "mais si c'est plus simple à utiliser, où est le mal ?". Et j'aurais du mal à vous contredire sur ce point.  
Mais le soucis est ailleurs, au niveau de la maîtrise.  
Non seulement, les milliers (millions ?) de développeurs ayant découvert le SQL avec MySQL apprennent de très mauvaises habitudes, mais les défendent alors même qu'elles sont contraires aux standards.

Le plus marrant, selon moi, est que ce sont ces mêmes personnes qui défendent Mozilla parce que "c'est libre, respectueux des standards, alors que Internet Explorer, non" qui utilisent MySQL (preuve selon moi de l'immense majorité de personnes qui ont adoptés Firefox pour être "hype" et pas par conviction).

Bref, pour en revenir à nouveau au sujet de base, j'utilise PostGreSQL depuis plusieurs années, et j'en pense le plus grand bien : non seulement il est ouvert, en pleine force de l'âge, équipé pour supporter les très gros volumes, permettant l'utilisation de techniques SQL avancées, mais également utilisable rapidement pour des sites à petits volumes, avec des bases de données simples.

Donc, en conclusion, je trouve que cette migration est une très bonne nouvelle pour PostGreSQL, pour augmenter sa visibilité au développeurs amateurs, qui apprennent sur les outils démocratiques.  
Et, qui sais, un jour nous aurons une majorité de LAPP (Linux-Apache-PostGreSQL-PHP) au détriment du traditionnel LAMP (Linux-Apache-MySQL-PHP)
