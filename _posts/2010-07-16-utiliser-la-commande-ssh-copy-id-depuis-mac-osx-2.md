---
title: Utiliser la commande ssh-copy-id depuis Mac OSX
author: Mikael Randy
layout: post
permalink: /2010/07/16/utiliser-la-commande-ssh-copy-id-depuis-mac-osx-2/
categories:
  - Mac
comments: true
---

Comment rendre la commande ssh-copy-id disponible sur Mac OS X

Si vous avez tenté d'utiliser la commande ssh-copy-id sur Mac OS X, vous avez dû vous rendre compte que, même si openssh est installé nativement, cette commande n'est pas disponible.

Heureusement, cette commande est un simple script qu'il suffit de copier au bon endroit, de lui donner les bons droits et **SURPRISE** la commande est disponible.

Et comme je suis sympa, eh bien je vous donne tout ça. ;) Pour commencer le script [ssh-copy-id](/public/ssh-copy-id)

Ensuite, la méthodologie à suivre pour le mettre en place:

* Télécharger le fichier
* Déplacer le fichier dans le répertoire /usr/bin
* Lui donner les droits nécessaires

```
$ chmod 755 /usr/bin/ssh-copy-id
```

***Edit***

Si vous utilisez [homebrew](http://brew.sh), il existe un package pour faire la même chose :  
`brew install ssh-copy-id`
