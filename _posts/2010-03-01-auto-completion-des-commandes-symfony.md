---
title: Auto-complétion des commandes Symfony
author: Mikael Randy
layout: post
permalink: /2010/03/01/auto-completion-des-commandes-symfony/
categories:
  - Symfony
tags:
  - auto-complete
  - CLI
  - symfony
comments: true
---

J'ai découvert au fil de mes flux RSS un petit script qui permet d'obtenir l'auto-complétion du mode CLI de Symfony. Je tente, de cet article, de vous expliquer en quoi il est pratique, et comment l'installer sur votre serveur.

Je pense que, pour toute personne qui utilise couramment symfony, une chose manque cruellement: l'auto-complétion des commande Symfony. J'entends par là l'auto-complétion du mode CLI de symfony. Fort heureusement, une solution existe.

## Le mode CLI de Symfony

Symfony propose de faire énormément de chose en mode CLI: du nettoyage complet du cache à la génération des classes métiers en passant par l'exécution des test unitaires. Tout développeur Symfony connait, par exemple, la commande `./symfony cache:clear`, qui est à Symfony ce que le redémarrage du système est à Windows, à savoir la première chose à essayer quand ça ne marche pas.

Ce CLI est, il faut le dire, une très bonne chose. Beaucoup de tâches sont ainsi simplifié au maximum. Toutefois, appeler ces tâches est quelques fois fastidieux. Par exemple, si je viens de modifier mon schéma de base de données et que je veux reconstruire mon modèle et ma base, je doit taper la commande suivante:

```
$ ./symfony doctrine:buid-all-reload
```

Bon, d'accord, cette commande n'existe plus depuis symfony 1.3, mais je prend cet exemple car je trouvais cette commande horrible a taper. C'est surement l'une des raisons pour lesquelles cette tâche est maintenant plus simple à appeler.

## L'auto-complétion

Mais revenons à nous moutons, comme tout développeurs, je suis <del>fainéant</del> à la recherche de la manière la plus rapide de travailler. Je voudrais donc d'une aide qui me permette de saisir cette commande plus rapidement. Heureusement, une [superbe contribution](http://github.com/biko2/symfony_complete) permet cela.

Une fois le script installé (cf. paragraphe suivant), pour exécuter la commande décrite ci dessus, il me suffit d'écrire

```
$ ./s[tab] d[tab]b[tag]-r[tab]
```

Soit 4 lettres et 4 tabulations.

J'ai découvert ça ce jour, et je commence tous juste à l'utiliser, mais je trouve ça tout simplement génial!

De plus, cerise sur le gateau: ce script s'adapte à votre version de symfony. D'après ce que j'en ai compris, le script exécute la commande `./symfony` et en récupère les valeurs qui pourraient convenir. Il est donc déjà tout prêt pour toutes version de Symfony (j'ai testé 1.2, 1.3 et 1.4 avec succès)

## Installation

Pour disposer du projet, comme l'indique le README sur le site, 2 manières qui dépendent des droits dont vous disposez:

### Installation pour un compte spécifique

Rendez-vous à la racine de votre compte, créez un répertoire `.bash_completion` dans lequel vous créerez un fichier `symfony_complete`

```
$ cd ~
$ mkdir .bash_completion
$ cd .bash_completion
$ touch symfony_complete
```

Editez ensuite ce fichier pour y mettre le [code suivant](http://github.com/biko2/symfony_complete/blob/master/symfony_complete)

Editez votre fichier `~/.bash_profile` pour y ajouter les lignes suivantes:

```
if [ -e ~/.bash_completion/symfony_complete ]; then
  . ~/.bash_completion/symfony_complete
fi
```

Pour que cette modification soit prise en compte, il vaut faut soit redémarrer la connexion à la console, soit taper la commande suivante:

```
$ . ~/.bash_profile
```

### Installation globale sur un serveur

Si vous disposez des droits root sur un serveur et que vous voulez donner ce droit à tout le monde, il suffit de suivre la même méthodologie, mais en se plaçant dans le dossier `/etc` et plus à la racine d'un compte.

```
$ cd /etc
$ mkdir .bash_completion
$ cd .bash_completion
$ touch symfony_complete
```

Editez ensuite ce fichier pour y mettre le [code suivant](http://github.com/biko2/symfony_complete/blob/master/symfony_complete)

Editez le fichier `/etc/.bashrc` pour y ajouter les lignes suivantes:

```
if [ -e /etc/.bash_completion/symfony_complete ]; then
  . /etc/.bash_completion/symfony_complete
fi
```

Pour que cette modification soit prise en compte, il vaut faut soit redémarrer la connexion à la console, soit taper la commande suivante:

```
$ . /etc/.bashrc
```
