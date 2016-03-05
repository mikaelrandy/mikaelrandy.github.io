---
title: Déployer une version spécifique via Capistrano
author: Mikael Randy
layout: post
permalink: /2013/03/28/deployer-une-version-specifique-via-capistrano/
categories:
  - Développement
comments: true
---

Je viens de découvrir l'option "-set-before" (et son raccourci "-S") de Capistrano qui permet de redéfinir une variable de configuration à la volée pour l'exécution courante.

Cela m'a beaucoup servi ce matin lorsque, pour des besoins de debug, j'ai voulu déployer un commit antérieur d'un de mes projets, je n'ai eu qu'à lancer la commande 

    cap -S revision=80655da8d80aaaf92ce5357e7828dc09adb00993 deploy

Mais, si vous avez suivi, il est possible de changer ponctuellement toutes les variable : chemin de déploiement, branche, nombre de release à conserver

Have fun
