---
title: Installer node.js et zombie.js sur MacOS X
author: Mikael Randy
layout: post
permalink: /2011/01/07/installer-node-js-et-zombie-js-sur-macos-x/
categories:
  - Node.js
tags:
  - javascript
  - MacOSX
  - node.js
  - npm
  - zombie.js
comments: true
---

Ce soir, alors que je lisais l'article de [Romain Pouclet](http://www.palleas.com) (alias [@Palleas](http://twitter.com/#!/palleas)) sur le blog de Clever Age : [Mise en place de tests fonctionnels avec zombie.js](http://www.clever-age.com/veille/blog/mise-en-place-de-tests-fonctionnels-avec-zombie-js.html), je me suis dit qu'il était temps que j'essaye enfin node.js, dont je n'entends que du bien.

Comme j'ai eu quelques problèmes, notamment lors de l'installation de zombie.js, je vous partage mes découvertes

### Installation de node.js

Pour rappel, [node.js](http://nodejs.org/) est un framework JS se basant sur le moteur javascript V8, le moteur utilisé par Chrome.  
Il permet de créer des applications serveur codées en javascript.

Pour cette première étape, la procédure donnée par Romain fonctionne sans soucis

    git clone https://github.com/ry/node.git
    cd node
    ./configure && make && sudo make install

Pour les débutants de git, la 1ère ligne va downloader le code source de node.js, il est donc nécessaire de se placer dans un répertoire spécifique. Pour ma part, je dispose d'un répertoire "~/vendor" qui me sert à ça.

### Installation de zombie.js

[Zombie.js](http://zombie.labnotes.org/), quand a lui est une extension node.js permettant d'exécuter du code javascript distant.  
Romain l'utilise pour réaliser des tests fonctionnels d'écran utilisant javascript.

#### Installation de npm

La méthode la plus simple est effectivement d'utiliser [npm](http://npmjs.org/), un package manager for node. En gros, il s'agit d'un macport dédié pour node.js

Pour cela, il suffit de taper la ligne suivante :  

    curl http://npmjs.org/install.sh | sudo sh

#### Installation de zombie.js

Maintenant, attaquons la dernière étape, celle qui m'a posé le plus de soucis : l'installation de zombie.js

Normalement, il suffit de lancer la ligne de commande suivante :  

    sudo npm install zombie

Sauf que, dans mon cas, l'installation échouais sur une erreur de ce type :  

    npm ERR! Error: base64@1.0.1 install: `node-waf configure build`
    npm ERR! `sh` failed with 1
    npm ERR!     at ChildProcess.<anonymous> (/usr/local/lib/node/.npm/npm/0.2.14-1/package/lib/utils/exec.js:25:18)
    npm ERR!     at ChildProcess.emit (events.js:34:17)
    npm ERR!     at ChildProcess.onexit (child_process.js:164:12)
    npm ERR!
    npm ERR! Failed at the base64@1.0.1 install script.
    npm ERR! This is most likely a problem with the base64 package,
    npm ERR! not with npm itself.
    npm ERR! Tell the author that this fails on your system:
    npm ERR!     node-waf configure build
    npm ERR! You can get their info via:
    npm ERR!     npm owner ls base64
    npm ERR! There may be additional logging output above.

En remontant un peu, l'erreur exacte était la suivante :  

    Waf: Entering directory `/usr/local/lib/node/.npm/base64/1.0.1/package/build'
    [1/2] cxx: base64.cc -> build/default/base64_1.o
    ../base64.cc: In function ‘v8::Handle<v8::Value> base64_encode_binding(const v8::Arguments&)’:
    ../base64.cc:132: error: ‘class node::Buffer’ has no member named ‘data’
    ../base64.cc:132: error: ‘class node::Buffer’ has no member named ‘length’
    ../base64.cc: In function ‘v8::Handle<v8::Value> base64_decode_binding(const v8::Arguments&)’:
    ../base64.cc:150: error: ‘class node::Buffer’ has no member named ‘data’
    ../base64.cc:150: error: ‘class node::Buffer’ has no member named ‘length’
    Waf: Leaving directory `/usr/local/lib/node/.npm/base64/1.0.1/package/build'
    Build failed:  -> task failed (err #1):
    	{task: cxx base64.cc -> base64_1.o}
    npm info base64@1.0.1 Failed to exec install script
    npm ERR! install failed Error: base64@1.0.1 install: `node-waf configure build`
    npm ERR! install failed `sh` failed with 1
    npm ERR! install failed     at ChildProcess.<anonymous> (/usr/local/lib/node/.npm/npm/0.2.14-1/package/lib/utils/exec.js:25:18)
    npm ERR! install failed     at ChildProcess.emit (events.js:34:17)
    npm ERR! install failed     at ChildProcess.onexit (child_process.js:164:12)

Heureusement, après une petite recherche Google, je suis tombé sur la solution au fond d'un [gist](https://gist.github.com/765894) : npm utilise une version personnelle de la librairie base64, qui n'est pas la meilleure.  
Il vaut mieux commencer par installer la bonne librairie :  

    git clone git://github.com/substack/node-base64.git
    cd node-base64
    sudo npm install .

Une fois cette étape réalisée, il suffit de relancer l'installation de zombie pour que ça fonctionne

    sudo npm install zombie

Le problème dont parle Romain dans son article était un soucis de "missing dependencies" qui était simplement dû au fait que son npm n'était pas à jour, et il a fallu le mettre à jour, donc en gros de reprendre la procédure d'installation.
