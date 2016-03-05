---
title: Utiliser la même version de PHP en CGI et en CLI sous Mac OS X
author: Mikael Randy
layout: post
permalink: /2010/11/03/utiliser-la-meme-version-de-php-en-cgi-et-en-cli-sous-mac-os-x/
categories:
  - Mac
comments: true
---

Sous Mac OS X Snow Leopard, from the bundle, PHP, tout comme Apache, MySQL, SQLite, est installé.

Il y a peu, au cours d'un développement sur un projet Symfony, j'ai utilisé une task nettoyant partiellement un cache APC. Quelle ne fut pas ma surprise en voyant apparaitre un message d'erreur me disant que APC n'était pas installé! Mais qu'osait me dire mon terminal? ôO J'utilise pourtant APC en continue dans mon projet?

Après quelques minutes de recherche, je me suis donc rendu compte que les versions CGI (Apache) et CLI (Command Line Interface) sont différentes.

Avec mes maigres connaissances d'administration système, j'avoue que je n'ai pas saisi l'utilité de cette configuration, et comme je personnalise régulièrement ma configuration PHP, je ne voulais pas passer mon temps à maintenir une double version de PHP.

Dans un 1er temps, j'ai simplement voulu faire en sorte que le php.ini chargé soit le même, mais il s'avère que la version CLI cherchait les extensions dans son répertoire d'installation, et il aurait donc fallu dupliquer les librairies entre les installations.

Après cette petite mise en place, venons en au fait

## Utiliser une unique version de PHP pour les modes CGI et CLI

Pour commencer, par défaut, voici où se trouvent les différentes versions de PHP: 

* CGI: /ect/lib/php/ 
* CLI: /opt/local/lib/php

La solution est très simple: supprimer la version CLI et la remplacer par un lien symbolique vers la version CGI

```
# Se rendre dans le répertoire du PHP CLI
$ cd /opt/local/lib/
# Sauvegarder l'ancienne version
$ sudo tar -czf php.tgz php/
# Créer le lien symbolique vers la version CGI
$ sudo ln -s /etc/lib/php/ php
```

Pour vérifier que tout fonctionne, il faut commencer par appeler la commande php depuis la console

```
$ php -v
# PHP 5.3.2 (cli) (built: Oct  5 2010 23:50:50)
# Copyright (c) 1997-2010 The PHP Group
# Zend Engine v2.3.0, Copyright (c) 1998-2010 Zend Technologies
#    with Xdebug v2.1.0, Copyright (c) 2002-2010, by Derick Rethans
```

A partir de maintenant, toute modification apportée au PHP CGI sera immédiatement reportée dans la version CGI

Comme je le disais plus haut, je suis loin de maitriser l'administration système, ma solution peut donc paraitre aberrante à un vrai administrateur système. Toutefois, comme je ne demande qu'à apprendre, je suis ouvert à toute critique, tant qu'elle est constructive ;)
