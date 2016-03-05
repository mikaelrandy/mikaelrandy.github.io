---
title: Gérer facilement ses versions de node.js
author: Mikael Randy
layout: post
permalink: /2011/06/03/gerer-facilement-ses-versions-de-node-js/
categories:
  - Node.js
tags:
  - 'n'
  - node.js
comments: true
---

Pour ceux qui ne le savent pas encore, [Node.js](http://nodejs.org/) est un interpreteur de JS en ligne de commande permettant de réaliser des serveurs, dont l'énorme avantage est l'aspect asynchrone de la programmation (voir [cet article de naholyr](http://naholyr.fr/2011/02/node-js-lavenement-de-la-programmation-asynchrone/), qui en parle très bien.  
Rappelez-vous, je vous avais déjà décrit [l'installation de node.js](http://www.mikaelrandy.fr/2011/01/07/installer-node-js-et-zombie-js-sur-macos-x/) et de npm, son *package manager*

Ce projet, en plus d'être très prometteur, est dans une phase de développement très forte, et toujours en version beta, ce qui implique que de nouvelles versions sortent très régulièrement (15 versions depuis le début de l'année 2011, dont une version majeure).  
La principale conséquence est qu'il est à la fois difficile d'être toujours à jour, mais également qu'un code peut ne plus fonctionner du jour au lendemain.  
Heureusement, dans ce genre de technos très dans le vent, il existe toujours une solution.

L'astuce du jour s'appelle [n](https://github.com/visionmedia/n). C'est un package qui permet d'installer/activer/supprimer rapidement et facilement n'importe quelle version de node.js, en permettant à plusieurs versions de cohabiter.

## Installation

n s'installe très facilement grâce à npm :  

    sudo npm install -g n

C'est tout. Il y a pire me direz vous.

EDIT : comme me le fait remarquer Naholyr dans les commentaires, la version actuelle de npm demande l'option "-g" pour une installation globale

## Utilisation

n permet de consulter les versions de node installer, d'en ajouter, de changer la version utilisée, de supprimer des versions inutiles, ou d'installer rapidement la dernière version disponible :

### Voir les versions installées

Cette commande affiche la liste des versions de node installées

    mrandy:~$ n
        0.4.6
      ο 0.4.7

### Activer/installer une version de node.js

Imaginons que vous avez besoin d'installer node.js v0.3.8 (dernière version 0.3) pour exécuter un de vos codes  

    mrandy:~$ sudo n 0.4.6<br />
    mrandy:~$ n
      ο 0.4.6
        0.4.7
  
Cette commande va modifier la version active de node (celle appelée par défaut).  
Dans le cas où la version demandée n'était pas installée, cette commande va télécharger les sources, les compiler, installer la version et l'activer :  

    mrandy:~$ sudo n 0.4.0
    [...]
    mrandy:~$ n
      ο 0.4.0
        0.4.6
        0.4.7

### Installer la version la plus récente

Seulement voilà, sur un projet aussi dynamique, on ne sait jamais si on a la dernière version ou pas.  
Heureusement, n gère ce cas puisque la commande "n latest" est un alias pour la dernière version disponible.  

    mrandy:~$ sudo n latest
    [...]
    mrandy:~$ n
        0.4.0
        0.4.6
        0.4.7
      ο 0.4.8

### Supprimer une version de node

C'est bien joli tout ça, mais au bout d'un moment, on se retrouve avec plus d'une dizaine de versions installée, et c'est un peu le boxon pour un psychorigide comme moi.  
Mais rassurez-vous, là aussi, n a tout prévu :

    mrandy:~$ sudo n rm 0.4.0
    [...]
    mrandy:~$ n
        0.4.6
        0.4.7
      ο 0.4.8

### Et tout le reste

    n help // affiche la liste des commandes de n
    n use 0.4.7 // Execute node avec la version donnée (activation one shot)
    n bin 0.4.7 // Affiche le chemin vers l'exécutable de la version donnée
    n ls // Affiche la liste des versions de node.js disponible, en indiquant lesquelles sont installée
