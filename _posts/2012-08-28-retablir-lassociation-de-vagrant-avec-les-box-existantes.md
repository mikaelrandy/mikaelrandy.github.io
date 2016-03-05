---
title: "Rétablir l'association de vagrant avec les box existantes"
author: Mikael Randy
layout: post
permalink: /2012/08/28/retablir-lassociation-de-vagrant-avec-les-box-existantes/
categories:
  - Développement
tags:
  - vagrant
  - VirtualBox
comments: true
---

S'il vous arrive, comme moi, la mésaventure que [Vagrant](http://vagrantup.com/ "Vagrant"), lors du lancement de machines virtuelles qu'il gérait très bien jusqu'alors, tente de créer de nouvelles machines sans reprendre les existantes, cet article va vous intéresser.

Hier matin, au lieu de lance mon habituel `vagrant up`, j'ai lancé un stupide `sudo vagrant up`, ce qui a eu pour conséquence de lancer les VM, mais de manière invisible pour vagrant, et ça a visiblement cassé la liaison entre vagrant et les VM [VirtualBox](https://www.virtualbox.org/).  
Pour s'en rendre compte, il suffit de lancer VirtualBox et de regarder les VM existantes et celles qui sont lancées, les VM VirtualBox qui ont été créées par vagrant sont généralement nommées de cette forme : `www_1338554312`.

Heureusement, il existe une solution très simple permettant de rétablir cette liaison, et je m'en vais vous la partager.

Tout d'abord, il faut savoir que vagrant place un fichier .vagrant au même endroit que se trouve votre fichier Vagrantfile, ce fichier contenant une chaîne JSON représentant l'état de vos VM.  
Voici un exemple de contenu :

{% highlight json %}
{
  "active": {
    "web":"f8a95d07-2692-45b8-b9eb-45ef07565f2f",
    "db":"71bd3711-b90e-442c-84a6-8e59b06f5c26",
    "symfony":"dbcd4cd9-5736-4c66-82c8-8a8efcd48d53",
    "acs":"09fb44ec-b0d6-4c74-9f04-3123e1c978d5"
  }
}
{% endhighlight %}

Ce contenu me permet de savoir que j'ai 4 VM vagrant disponibles, web, db, symfony et acs, l'uuid associé étant l'identifiant de la VM VirtualBox.

Dans notre cas de figure, c'est justement l'association entre la VM vagrant et l'uuid de la VM VirtualBox qui n'est plus bonne.  
Pour le corriger, voici la démarche à suivre :

#### Éteindre toutes les VM

Commencer par faire un `vagrant halt`, puis lancer VirtualBox et s'assurer que toutes les VM sont éteintes.

#### Faire le lien entre les VM vagrant et les VM VirtualBox

Pour ma part, comme je nomme toujours proprement mes serveurs, il me suffisait de lancer la VM via VirtualBox pour l'identifier

#### Obtenir les uuid des VM VirtualBox

Lancer la commande suivante `VBoxManage list vms` qui devrait vous proposer une sortie de la sorte :

    $ VBoxManage list vms
    "www_1338554312" {dbcd4cd9-5736-4c66-82c8-8a8efcd48d53}
    "www_1338554370" {09fb44ec-b0d6-4c74-9f04-3123e1c978d5}
    "www_1338554428" {71bd3711-b90e-442c-84a6-8e59b06f5c26}

Nous avons ici l'uuid de chaque VM VirtualBox

#### Corriger le fichier `.vagrant`

Il faut maintenant éditer le fichier `.vagrant` pour corriger les association VM vagrant/uuid VirtualBox 

#### Relancer les VM vagrant

Relancer les VM vagrant via la commande `vagrant up`

Désormais, tout devrait être revenu à la normale.
