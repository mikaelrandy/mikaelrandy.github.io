---
title: Gérer les connexions SSH distantes avec Mac OS X
author: Mikael Randy
layout: post
permalink: /2010/07/16/utiliser-la-commande-ssh-copy-id-depuis-mac-osx/
categories:
  - Mac
tags:
  - MacOSX
  - SSH
  - ssh-copy-id
comments: true
---

Comme vous le savez si vous passez régulièrement sur ce site, que [je viens de switcher pour utiliser MacOSX](/post/2010/05/22/Je-switche). Je suis donc dans une phase d'apprentissage, et de modifications de mes habitudes de Windowsien convaincu.

Comme je gère quelques sites personnels (dont celui ci), je dispose de quelques comptes sur des serveurs distants. Jusque là, pour gérer ces connexions, j'utilisais l'excellent [Putty Connection Manager](http://puttycm.free.fr/cms/). Toutefois, depuis mon passage à Mac OS X, je n'avais pas trouvé de système équivalent me convenant.

Tout d'abord, comme Mac OS X est basé sur un système Unix, je dispose d'un terminal, et je peux donc utiliser la commande suivante pour me connecter en ssh sur un serveur distant:

```
$ ssh user@server
```

Toutefois, la limitation de cette pratique est qu'il faut se souvenir des mots de passe des serveurs. Or, cette approche me pose un gros soucis puisque j'ai pour (bonne) habitude d'utiliser des mots de passe compliqué pour mes comptes ssh (mélange de lettre, chiffre, majuscule, minuscule, caractères spéciaux, longueur supérieure à 50 caractères), et qu'il me faudrait donc avoir une liste de mes mots de passe quelque part.

Je me suis donc dit que c'était le moment de faire un truc qui est dans ma TODO depuis un moment: passer au [système d'authentification par clé publique](http://fr.wikipedia.org/wiki/Secure_Shell#SSH_avec_authentification_par_clefs).

J'ai donc utilisé l'[excellent tutoriel](http://prendreuncafe.com/blog/post/2005/08/29/262-installer-sa-cle-ssh-sur-un-serveur-distant) de nik0 sur l'installation de ce système. La seule difficulté a été que la commande ssh-copy-id n'est pas disponible nativement. Heureusement, [la solution était simple](/2010/07/16/utiliser-la-commande-ssh-copy-id-depuis-mac-osx-2/)

Couplé à la petite astuce de nik0 (fin du lien, section "Pour aller plus loin"), tout deviens assez simple. A partir de là, il me suffit de gérer mes connexions distantes, et tout roule
