---
title: Mettre à jour MacPorts après une mise à jour de MacOS X
author: Mikael Randy
layout: post
permalink: /2011/11/04/mettre-a-jour-macport-apres-une-mise-a-jour-de-macos-x/
categories:
  - Mac
tags:
  - lion
  - MacOSX
  - macports
comments: true
---

Puisque, à la suite de la mise à jour de mon MacBook Pro vers OS X Lion, j'ai eu un problème de fonctionnement de [MacPorts](http://www.macports.org/) qui m'a posé beaucoup de soucis, je partage avec vous la solution.

J'ai détecté le soucis en essayant de mettre à jour les ports  

```
sudo port selfupdate
sudo port upgrade outdated
```

Je suis tombé rapidement sur l'erreur suivante (dans mon cas, c'était sur gettext) :  

```
Error: Target org.macports.build returned: shell command failed (see log for details)
Log for gettext is at: /opt/local/var/macports/logs/_opt_local_var_macports_sources_rsync.macports.org_release_ports_devel_gettext/gettext/main.log
Error: Status 1 encountered during processing.
To report a bug, see <http://guide.macports.org/#project.tickets>
```

Le soucis viens en fait de MacPorts, qui n'est plus adapté au nouvel OS, mais qui ne sais pas se mettre à jour.  
Pour résoudre ce soucis, il existe heureusement une [explication fournie par MacPort](https://trac.macports.org/wiki/Migration "Migration MacPort").
