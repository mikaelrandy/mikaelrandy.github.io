---
title: Symfony 2 reloaded
author: Mikael Randy
layout: post
permalink: /2010/02/21/symfony-2-reloaded/
categories:
  - Symfony
tags:
  - doctrine
  - symfony
comments: true
---

Ce mercredi 17 février 2010, en clôture du Symfony Live 2010, Fabien Potencier a présenté Symfony 2 qui porte le nom de code de "[Symfony Reloaded](http://symfony-reloaded.org/)". En voici un retour en quelques points clés.

*Vous ne trouverez dans cet article d'exemple de code, de description détaillées. J'ai rédigé cet article avec l'optique de vous donner envie d'en savoir plus et je vais donc me contenter de vous lister les points qui m'ont paru important*

Profitant du [Symfony live 2010](http://www.symfony-live.com), Fabien Potencier a levé le voile sur la nouvelle version de son framework: Symfony 2.0.

## Symfony Reloaded

Fabien Potencier a décidé de donner un nom de code à cette nouvelle version, et pour cela, il a choisi le même principe que [Matrix](http://fr.wikipedia.org/wiki/Matrix). Pour l'anecdote, [Jonathan Wage](http://www.jwage.com) a même fait un trait d'humour pour savoir si Fabien avait déjà commencé le développement de Symfony Revolutions, en référence au 3ème opus du film Matrix.

Outre l'effet de style, cela à permis de créer [un nouveau site](http://symfony-reloaded.org) pour suivre le développement de cette nouvelle version de Symfony.

## Une version alpha

Fabien Potenciera lourdement et fortement insisté sur un point: Symfony 2 n'est pas, dans sa version actuelle, prêt pour être utilisé en production. Symfony 2 est actuellement en version alpha, et est donc en conséquence instable et susceptible de changer du jour au lendemain. Il est donc possible de l'utiliser pour se faire la main, prévoir les migrations, mais il ne faut pas l'utiliser pour un projet de production.

## symfony est mort, vive Symfony

Contrairement à tout ce que je pensais jusque là, Symfony 2 représente une réelle rupture avec la branche 1.X. Les différentes informations que Fabien Potencier a laissé filtrer lors de cette dernière années m'ont laisser penser que Symfony 2 serait Symfony 1 entièrement réécrit, et séparé en [composants](http://components.symfony-project.org). J'avais donc en tête que tout projet 1.X pourrait passer simplement vers Symfony 2.X.

Avec Symfony 2, Fabien Potencier a voulu capitaliser sur les erreurs qui ont été faites avec Symfony 1, et a donc complétement revu sa copie, de 0, puisque presque tout change:

### PHP 5.3

Voulant profiter des dernières technologies, surtout quand cette dernière apporte des gains en termes de temps d'exécution et d'occupation qui se chiffrent à deux décimales, le coeur de framework est désormais entièrement codés pour PHP 5.3. Le principal intérêt est l'utilisation des namespaces, et c'est donc certainement la fin des classes sfWidgetFormInput, mais l'arrivée des /Symfony/Form/Widget/Input.

### Configurabilité

La base de cette nouvelle branche, et c'est ce qui a été largement mis en avant lors de la présentation, c'est la possibilité de tout modifier dans le comportement de base du framework.
Il est possible de choisir le nom des fichiers de configuration, leur format (XML, YAML, INI), leur localisation, ... 
Bien entendu, la règle "tant que c'est évident, le développeur ne devrait pas avoir à le faire" est toujours de rigueur. Ainsi, lors de l'installation du projet, tout est déjà configuré, et tout fonctionne. 

Toutefois, et c'est LA grande nouveauté de Symfony 2, c'est qu'il est possible de modifier le comportement de base du framework.
Autre avantage du nouveau système de configuration: l'inclusion de fichiers de configuration. Désormais, il est possible définir un fichier contenant des données susceptible d'être utilisée dans plusieurs fichiers de configuration (l'adresse IP du serveur, par exemple). Cela permet d'éviter de dupliquer les informations puisque, c'est bien connu, dupliquer des informations, c'est pas bien ;) 

### Architecture de projet

Pour la branche 1.X, symfony utilisait une architecture un peut complexe, mais bien détaillée, et dans laquelle chaque développeur Symfony pouvait se retrouver. Out cette arborescence, puisque la nouvelle repose sur 3 dossiers:

```
app/
src/
web/
```

N'ayant pas encore pris le temps d'utiliser cette nouvelle version, je ne me prononcerais pas encore sur ce que contient chaque dossier, et si cela change de manière positive ou pas.

### Tout est bundle

Avec Symfony 1, il existait 3 notions différentes: les sections du cœur du framework, les sections d'une application, et les plugins. 

Désormais, ces 3 notions sont regroupées sous un seul terme: les bundles. 
En effet, les codes qui se trouvent dans tout ces endroits ont une seule optique: être exécutée dans l'application. 

Avec l'approche Symfony 1, il était toujours plus ou moins compliqué de surcharger des codes du coeur ou des plugin. Désormais, tout change avec les bundles. 

De base, nous pourrions commencer par comparer les bundles et les plugins. En effet, les bundles peuvent contenir des templates, des contrôleurs, des classes métiers ... en un mot, tout ce qui est nécessaire à l'exécution d'un module. 
Comme vous le savez surement, il est assez simple de surcharger tout ou partie du fonctionnement d'un plugin depuis une application. 
De même, il est très simple d'activer tout ou partie d'un plugin dans différentes applications d'un projet. Rassemblement de code, extensibilité, confgurabilité. Je viens de lister les raisons de tout rassembler sous la notions de bundle. En effet, comme le coeur de Symfony, les plugins et les applications sont composés de bundle, tout est mieux organisé et beaucoup plus facilement extensible.

L'ordre d'inclusion d'un plugin est simple: `Coeur < Bundle < Application`. Cela signifie que, depuis un bundle, il est possible de surcharger tout ou partie du coeur de symfony, et depuis une application, il est possible de surcharger le coeur, ou les bundles, même si ceux si surchargent déjà le comportement du coeur.

### Doctrine 2

Symfony et les ORM, c'est une grande histoire. A l'origine, l'ORM PHP le plus performant, lors de la sortie de la branche symfony 1.0 était Propel. Puis Doctrine est sorti, qui semblait plus prometteur (et plus vivant) que Propel. Du coup, bien que Propel reste l'ORM par défaut, Doctrine a été ajouté dans le coeur de Symfony. Puis, avec Symfony 1.2, Doctrine est devenu l'ORM par défaut, Propel étant encore inclu par défaut dans le coeur de symfony. L'année dernière, lors du Symfony Live 2009, Fabien Potencier nous avait fait part de son scepticisme à continuer à maintenir 2 ORM, puisque cela scinde la communauté en 2. Cela se voit pour les plugins, puisque nous nous privons de plugins puisqu'ils n'ont pas été développés pour "notre" ORM.

Ainsi, cela a été décidé, seul Doctrine sera présent dans le coeur de Symfony 2 (un bundle proposant un Propel sera certainement rapidement proposé, mais cela va marginaliser les utilisateurs de Propel, et forcer les nouveaux utilisateurs vers Doctrine). De plus, toujours dans l'optique d'utiliser les dernières évolutions possibles, c'est la future branche 2 de Doctrine qui sera utilisée.

## Disponibilité

La date de sortie de la 1ère version stable de la branche 2.X est prévue pour la fin de l'année 2010. Doctrine 2, quand a lui, est prévu pour le début de l'année 2011. Je pense donc qu'il faille s'attendre à une réelle sortie officielle dans ces eaux là, tout en gardant en tête que Doctrine sera bloquant pour Symfony, et que je ne pense pas qu'il soit judicieux de releaser Symfony 2 avant que Doctrine 2 soit en version stable.
