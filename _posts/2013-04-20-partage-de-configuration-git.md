---
title: Partage de configuration git
author: Mikael Randy
layout: post
permalink: /2013/04/20/partage-de-configuration-git/
categories:
  - Git
comments: true
---

Depuis que je travaille avec Git, j'ai un problème : "comment partager mes configurations entre mon poste de travail professionnel et mon poste de travail personnel ?"

Jusqu'à ce jour, j'avais trouvé une solution pour [beaucoup de mes outils](https://github.com/mikaelrandy/Save), mais j'avais toujours un soucis avec Git parce que le fichier de configuration contient des éléments qui ne sont pas partageables (l'email du commiteur, par exemple)

J'ai découvert récemment qu'il était possible d'inclure une fichier dans le fichier `.gitconfig`, et la solution est donc apparue.  
J'ai finalement placé les éléments partageables dans une [fichier spécifique](https://github.com/mikaelrandy/Save/blob/master/Git/.gitconfig) que je versionne, et dans mon fichier `~/.gitconfig`, il me suffit de placer le code suivant :  

{% gist mikaelrandy/dda36c9e2f0dce6eff4e %}
