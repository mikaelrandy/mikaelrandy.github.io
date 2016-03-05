---
title: "Enregistrer une collection d'objet, avec contrôle de fonctionnement"
author: Mikael Randy
layout: post
permalink: /2009/12/22/enregistrer-une-collection-d-objet-avec-controle-de-fonctionnement/
categories:
  - Symfony
tags:
  - doctrine
  - symfony
comments: true
---

Ce jour, un de mes développeurs a fait une découverte sympathique sur Doctrine.

Le besoin de base était le suivant: On manipule une liste d'objet (création, affectation de contenu) dans l'optique de les sauvegarder.

La syntaxe que nous tout un chacun est tenté de faire est la suivante:

```php
<?php
    
try { 
    for($i = 0; $i < 10; $i++) { 
        $item = new Item();
        $item->setValue($i);
        $item->save();
    }
}  catch (sfException $e) { 
    echo "An error occurs while data saving"
}
```

Or, le soucis, avec cette méthode, c'est que si une erreur intervient au cours de la sauvegarde, par exemple, pour l'item n°5, eh bien en base, nous aurons les items correctement enregistrée (entre 0 et 4), mais il manquera la fin (de 5 à 9).

La solution est simple, me direz vous, il suffit d'ouvrir une transaction avant, et de la fermer après. Eh bien oui, vous avez raison, mais j'ai trouvé encore plus élégant : les collections Doctrine (`Doctrine_Collection`). 
Si vous êtes un habitué de Doctrine, vous avez déjà croisé cette classe puisque Doctrine remplace les tableaux par des instances de celle-ci.

Toujours est-il que l'équivalent du code précédent, mais en prenant en compte la transaction, et en utilisant les `Doctrine_Collection` est le code suivant:

```php
<?php

$items = new Doctrine_Collection('Item', 'id');
try { 
    for($i = 0; $i < 10; $i++) {
        $item = new Item();
        $item->setValue('value ok');
        if($i == 5) {
            $item->setValue('error value');
        }

        // Add item into Doctrine_Collection
        $items->add($item);
    }

    // Save collection content, in a SQL transaction
    $items->save();
} catch (sfException $e) {
    echo "An error occurs while data saving"
}
```

Je trouve ça tellement plus pratique et élégant que je suis tombé sous le charme de cette méthode.
