---
title: Conférence AFUP du 03 avril 2008
author: Mikael Randy
excerpt: "Le 3 avril 2008 s'est tenue une conférence AFUP à Lyon, portant sur les apports de PHP6 et sur les architectures matérielles"
layout: post
permalink: /2008/04/03/2-conference-afup-du-03-avril-2008/
categories:
  - Conférences
tags:
  - afup
  - php
comments: true
---
Le 3 avril 2008 s'est tenue une conférence AFUP à Lyon, portant sur les apports de PHP6 et sur les architectures matérielles

Aujourd'hui, pour la 1ère fois, je me suis rendu à une conférence de l'AFUP. Il faut dire qu'ils ne se déplacent pas non plus tout les jours à Lyon, et que je n'ose pas demander à mon boss s'il me financerais le voyage jusqu'à Paris pour ce genre de conférence.

Eh bien je doit dire que j'en reviens ravi: le lieu était bien sympa puisque nous étions au café-livre, un bar/bibliothèque installé dans une cave dont les voutes en pierres sont magnifiques. Il y fait juste un peu froid.

Concernant la conférence, j'ai appris pas mal de truc sur PHP 6, mais je retiens principalement quelques notions. **LE** énorme avantage de PHP tiens en 1 mot: Unicode.  
Avec Unicode, il est permis de stocker tout type de chaîne, de n'importe quel encodage sans se soucier de gérer ces encodages. par exemple, testons le code suivant :  

```php
<?php

$foo = "déjà"; 
echo strlen($foo);
```

En PHP5, ce code affiche "6" car les accents sont codés sur 2 octets et que la fonction strlen() compte un caractère par octet, comme indiqué dans l'encodage ISO-8859-1.  
Or, en PHP6, cela affichera "4", qui correspond au nombre de caractères contenus dans la chaine. Voyez-vous apparaitre les avantages ?  
Là où je suis moins d'accord, c'est que le langage en lui même est également encode-free, il est donc possible de code en japonais ou d'écrire

```php
<?php

$déjà = null;
```

et, c'est moins cool quand on pense à l'outsourcing dans les pays asiatiques. Il va falloir nous prévoir une traduction de source PHP avec PHP6.

Au chapitre des nouveautés, on voit également (enfin) disparaitre `register_global`, `safe_mode` et consort

Sinon, ce que j'attendais le plus de PHP6, à savoir les espaces de noms ou namespace (dans la langue de Shakespeare) n'ont pas été abordés, puisque ajouté dans la version 5.3.

Mon sentiment est donc que le passage à PHP 5.3 sera beaucoup plus intéressant que le passage à PHP6. En effet, ceux qui utiliserons rapidement PHP 5.3 sont ceux qui seront prêt à passer à PHP6 et les plus frileux ne changerons leur PHP4 qu'une fois le 6 éprouvé.  
Attendons donc avec impatience cette version 5.3 qui devrait sortir sous peu.
