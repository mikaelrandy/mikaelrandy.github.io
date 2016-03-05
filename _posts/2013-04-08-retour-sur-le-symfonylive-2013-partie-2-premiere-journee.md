---
title: 'Retour sur le symfonyLive 2013 &#8211; partie 2 &#8211; première journée'
author: Mikael Randy
layout: post
permalink: /2013/04/08/retour-sur-le-symfonylive-2013-partie-2-premiere-journee/
categories:
  - Conférences
comments: true
---

* [Partie 1 - Mes retours](/2013/04/07/retour-sur-le-symfonylive-2013-partie-1/ "Retour sur le symfonyLive - partie 1")
* [Partie 3 - Mes retours](/2013/04/11/retour-sur-le-symfonylive-2013-partie-3-seconde-journee/ "Retour sur le symfonyLive - partie 3")
* [Liste des présentations](https://gist.github.com/nfabre/5318630 "Liste présentation Symfony Live Paris 2013")

## Keynote d'ouverture

Pour bien commencer cette conférence, Fabien Potencier a pris la parole pour nous parler de qualité. Il est vrai que, vu de ma fenêtre, Symfony a beaucoup participé à la démocratisation de bonnes pratiques de développement, et donc à l'augmentation générale des projets PHP.

Après nous avoir rappelé l'importance de la qualité, il a fait un petit tour des outils de tests et des plateformes d'intégration continues qui existent actuellement sur le marché pour les projets PHP.

Tout ça pour, au final, nous présenter le service SensioLabs Insight, qui est une plateforme d'intégration continue développée par SensioLabs, et qui est destinée à pousser la validation des projets un peu plus loin, et particulièrement sur un axe qui manque aux outils existant, selon lui : les actions à mener lors de la détection d'un manque de qualité.

Ce service me semble, sur le papier, très intéressant car il analyse les projets selon plusieurs axes :

* **Analyse statique** : comme des outils comme PHPMessDetector, il analyse les fichiers à plat et remontes les manques
* **Analyse contextuelle** : Il est possible de conceptualiser le projet (Symfony, Magento, Drupal, EzPublish, Silex, ...) et donc de pousser l'analyse statique sur des bones pratiques de l'outils
* **Analyse tendancielle** : Plutôt que de fixer des seuils d'alerte globaux, et hurler à la moindre petite entorse, ce service va partir sur des indicateurs fixe, mais en les rapportant au projet global, et donc en s'autorisant un delta si c'est la seule anomalie du projet, mais également pour indiquer que, sans dépasser les seuils, les indicateurs de qualité sont à la baisse, et donc prévenir avant qu'il ne soit trop tard
* **Analyse dynamique** : le service, lorsqu'il déroule les tests du projet, boote une VM dédiée pour le projet, qu'il est possible de personnaliser via un fichier de configuration. Cela permet de dérouler les tests dans un contexte proche de celui de production

Une fois toutes ses analyses faites, un rapport détaillé contenant pleins d'informations utiles est généré :

* La liste des anomalies, par niveau de criticité
* Pour chaque anomalie, une explication complète et détaillée sur ce qu'elle représente, les conséquences possibles et les bonnes pratiques qui permettent de la résoudre est accessible facilement
* Pour chaque anomalie, une estimation du temps de correction nécessaire est donné
* A partir de ses temps de correction, une estimation de la dette technique du projet est avancée, permettant aux décideurs d'un projet de se baser sur des données quantifiées, et non plus seulement sur un ressenti de l'équipe de développement.
* Un "grade" est attribué au projet en fonction du nombre d'anomalies détectées et de leur criticité

Au final, c'est un service qui me tente, je me suis d'ailleurs déjà inscrit sur [la beta](http://beta.insight.sensiolabs.com/ "Sensio Labs Insight beta") pour le tester et faire des retours.

J'attends maintenant les gammes d'offres qui vont être associées une fois le service stabilisé

## Apporter du TDD sur un projet existant

Cette conférence, donnée par [Benjamin Grandfond](https://twitter.com/benjaM1 "Twitter Benjamin Grandfond") était une explication de ce qu'est le [TDD](http://fr.wikipedia.org/wiki/Test_Driven_Development) et comment l'introduire dans un projet existant.  
Il est toujours intéressant de voir des conférences qui évangélisent le test, et les bonnes pratiques associées, mais étant déjà sensible à ces pratiques, j'avoue que cela ne m'a pas particulièrement apporté

[Lien vers les slides](https://speakerdeck.com/benjam1/adoptez-le-tdd-sur-vos-projets-symfony2-existants)

## Dependancy Injection Container

Lorsque j'ai vu que [Thomas Rabaix](https://twitter.com/th0masr "Twitter Thomas Rabaix") donnais cette conférence, je me suis dit que c'était un "must see". Mais, comme j'ai profité de la pause pour faire un peu de networking, je suis arrivé en retard et je me suis retrouvé sur le côté, assis par terre, et j'ai donc totalement décroché de la conférence puisque je ne voyais pas les slides.  
C'est dommage, mais je pense analyser [ses slides](https://dl.dropbox.com/u/581816/sflive_Paris_2013_DIC_-_Thomas_Rabaix.pdf "Dependancy Injection Container") en détails prochainement

## Git Flow : un processus de développement Agile

Nous avons ensuite eu une présentation du workflow Git utilisé par [Xavier Hausherr](https://twitter.com/xKobal "Twitter Xavier Hausherr") chez Overblog.  
Ce type de conférence est toujours particulièrement intéressante pour voir comment les gens utilisent Git pour leurs besoins, de voir les ecueils qu'ils ont affrontés, et confronter leurs vision à la sienne.

Toutefois, comme leur approche de livraison est par release, il y avait une différence d'approche fondamentale qui fait que je ne peux pas en tirer grand chose à cours terme

[Slides de la présentation](http://fr.slideshare.net/xkobal/git-flow-un-processus-de-dveloppement-agile)

## Symfony et eZ Publish : embarquement immédiat

[Nicolas Pastorino](https://twitter.com/jeanvoye "Twitter Nicolas Pastorino"), lors de la conférence suivante, nous a présenté la nouvelle architecture de ezPublish 5, qui est complètement baséee sur Symfony2, au points que ezPublish n'est "que" un bundle Symfony2, et qu'il est donc totalement possible, non seulement de le surcharger et l'étendre, mais également de développer d'autres modules complèmentaires dans le même projet.  
Le plus impressionnant de cette présentation était l'explication du module "Legacy" permettant de faire fonctionner un projet ezPublish 5 tout en conservant les templates et la base de données d'un projet ezPublish 4. C'est un gros challenge qu'ils se sont lancés et qu'ils ont réussi.  
Je voudrais chipoter, je demanderais quel est le cout en performance, mais ça serait mesquin puisque ce module sert avant tout à migrer en douceur d'un projet ezPublish 4 vers ezPublish 5

[Lien vers les slides](http://fr.slideshare.net/jeanvoye/symfony-et-ez-publish-embarquement-immediat-talk-at-symfony-live-paris?from=ss_embed)

## Lightning talks

La journée se terminait par les lightning talks, mais je n'ai pas été très attentif, et je ne m'aventurerais donc pas à vous faire un compte-rendu.

## After

Une fois les présentations terminées, j'ai fait un petit tour à mon hotel pour commencer à migrer mon support de reveal.js vers Keynote car je me suis rendu compte dans la journée que j'avais soit le plein écran, soit mes notes, mais pas les 2, et que comme je ne met pas toutes les informations que je donne dans les slides, je ne peux pas m'en passer.  
A 19h30, j'ai rejoint une petite centaine de personne dans un bar à quelques pâtés de maison, dans une bonne ambiance, discussions sympa et beaucoup de mojitos >_<"

Il ne me restait plus qu'à rentrer à l'hôtel pour finir de porter mes slides et cette première journée se terminait.
