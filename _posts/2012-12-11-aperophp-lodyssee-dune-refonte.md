---
title: "AperoPHP, l'odyssée d'une refonte"
author: Mikael Randy
layout: post
permalink: /2012/12/11/aperophp-lodyssee-dune-refonte/
categories:
  - AFUP
tags:
  - afup
  - aperophp
comments: true
---

Lors du PHP Tour Nantais, [Mickael Perraud](https://twitter.com/mikaelkael "Twitter Mickael Perraud") m'a fait la bonne surprise de mettre en production le nouveau [site des apéros PHP](http://www.aperophp.net "ApéroPHP").

Comme il s'agit d'une étape importante de ce travail qui aura débuté 10 mois plus tôt, je me suis dit que c'était l'occasion de faire un petit résumé de ce projet.

## La génèse

Tout à commencé il y a bientôt 1 an, au début de l'antenne lyonnaise de l'AFUP, avec [Geoffrey Bachelet](https://twitter.com/ubermuda "Twitter Geoffrey Bachelet") et [Sarah Haïm-Lubczanski](https://twitter.com/mereteresa "Twitter Sarah Haïm-Lubczanski"), nous nous sommes dit que l'organisation d'une coding party était un bon moyen pour lancer l'association.  
Nous avons cherchés un projet proche de l'AFUP, vieillissant sur lequel il était possible d'avoir la main, et le site des apéro PHP s'est rapidement mise en évidence.

Donc, le 21 janvier 2012, une petite équipe composée de Geoffrey Bachelet, Gautier Di Folco, [Julien Fusco](https://twitter.com/Pkoin "Twitter Julien Fusco"), Sarah Haïm-Lubczanski et moi-même nous sommes retrouvés pour commencer ce chantier.  
La faute à un manque d'expérience, la préparation était insuffisante et, à la fin de la journée, le chantier n'était pas très avancé.  
Fort heureusement, dans les mois qui ont suivi, Gautier et moi-même avons continués à travailler pour atteindre le [MVP](http://en.wikipedia.org/wiki/Minimum_viable_product "Minimum Viable Product").

## Le passage de relais

C'est à ce moment là que j'ai proposé le projet à l'AFUP, et il a été décidé de créer un [compte Github AFUP](https://github.com/afup "Github AFUP") pour héberger le projet, plutôt que de le laisser sur mon compte.  
Cela apportait plusieurs avantages : le projet gagnait en visibilité, il était fortement marqué "open-source" en permettant à tout le monde de participer à son développement, et il devenait officiellement lié à l'AFUP.

A partir de ce moment, plusieurs personnes qui n'étaient pas présentes à la coding party initiale ont pris part au projet : [Olivier Dolbeau](https://twitter.com/odolbeau "Twitter Olivier Dolbeau") a fait une grosse phase d'installation d'atoum et de rédaction des tests unitaires associés, puis Mickael Perraud a habillé proprement le site, puis à ensuite pris à charge la correction des issues importantes qui trainaient, mais également la migration des données de l'ancien site vers le nouveau.

## La mise en production

Après tout ce travail, le site restait tout de même dans son carton, et l'ancienne version continuait de vivre.  
Une démonstration a été installée, puis donnée en pâture au bureau de l'AFUP pour avoir les derniers retours, et Mickael Perraud a profité du PHP Tour pour migrer vers la nouvelle version.

## Et maintenant

Cette mise en production n'est pas une fin en soit. Ce projet est utilisé, puisqu'il y a en moyenne 2 apéros par mois.  
De plus, il reste des [bugs/évolutions/...](https://github.com/afup/aperophp/issues?state=open "Issues AperoPHP") qui permettraient d'améliorer le fonctionnement du site.  
Tout ça pour dire que je vais continuer à travailler sur ce projet, en tant que lead dev. Je vais donc travailler sur les évolutions, mais également relire et intégrer les Pull Request que vous ne manquerez pas de faire ;) 

En quelques mots, voici la roadmap que je me fixe :

*   Corriger les bugs déclarés
*   Refactorer le code de base en Controller/Service
*   Créer les scénarios Behat pour les test

Cette liste n'est pas exhaustive, et reflète les envies que j'ai sur ce projet, mais je suis ouvert à toute proposition qui pourra être faite.
