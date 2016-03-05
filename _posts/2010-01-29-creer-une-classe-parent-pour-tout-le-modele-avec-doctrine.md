---
title: Créer une classe parent pour tout le modèle avec Doctrine
author: Mikael Randy
layout: post
permalink: /2010/01/29/creer-une-classe-parent-pour-tout-le-modele-avec-doctrine/
categories:
  - Symfony
tags:
  - doctrine
  - php
  - symfony
comments: true
---

Pour qui a déjà utilisé Doctrine de manière un tant soit peu avancé, une problématique a dû se poser à un moment où à un autre: **Comment faire pour définir un comportement pour tout mon modèle ?**

Dernièrement, j'ai voulu mettre en place un système loguant toutes les suppressions, pour des besoins de tracabilité. La solution la plus simple me semblait être de pouvoir surcharger la méthode de suppression générique au niveau de mon projet.

Or, lorsque l'on regarde d'un peu plus près l'arborescence de classe généré par Doctrine, on peut se rendre compte qu'il manque d'une classe générique à tout le modèle, au niveau du projet et qui permettrait de faire ce que je cherchais à faire.

## Le fonctionnement de base de Doctrine

Doctrine gère 2 types de classes, qui ont chacune une arborescence bien spécifique: les **classes de tables** et les **classes d'entités**.

* Les classes de tables permettent de gérer les collections, c'est à dire les groupes d'enregistrements
* Les classes d'entités permettent la gestion des unités, c'est à dire chaque enregistrement indépendamment.

Si votre projet nécessite la présence, par exemple, de 2 tables: `User` et `Right`, Doctrine va générer l'arborescence de classe suivante:

![](/public/doctrine-diagrame_model_1.png)

Comme on peut le remarquer, toutes les classes qui se trouvent dans le projet sont gérées indépendamment, et la 1ère classe générique se trouve au niveau du coeur de symfony. Dans le `sfDoctrinePlugin`, pour être précis.

## Ajouter un niveau de classe avec Doctrine

Afin de pouvoir disposer d'un niveau de classe supplémentaire, au niveau du projet, il est possible de configurer Doctrine pour que les classes `Base` et `BaseTable` héritent d'autres tables que celles par défaut (respectivement `sfDoctrineRecord` et `Doctrine_Table`).

Pour agir sur la configuration de Doctrine, il vous faut éditer le fichier `config/ProjectConfiguration.class.php` comme suit:

{%highlight php startinline %}
class ProjectConfiguration extends sfProjectConfiguration
{
  public function setup()
  {
    // ...

    // custom builder options for doctrine
    sfConfig::set('doctrine_model_builder_options', array(
      'baseTableClassName' => 'MyDoctrineTable',
      'baseClassName' => 'MyDoctrineRecord'));
  }
}
{% endhighlight %}


Ainsi, avec ces configurations, on demande à Doctrine de faire en sorte que toutes les classes `Base` héritent de la classe `MyDoctrineRecord` et que les classes `BaseTable` héritent de la classe `MyDoctrineTable`, comme illustré dans l'exemple suivant:

![](/public/doctrine-diagrame_model_2.png)


Ces classes là doivent bien entendu elles même se remettre dans l'arborescence de classe.

Les squelettes de base de ces classes doivent donc être les suivants:

{% highlight php startinline %}
class MyDoctrineTable extends Doctrine_Table
{
    // ...
}

class MyDoctrineRecord extends sfDoctrineRecord
{
    // ...
}
{% endhighlight %}

A partir de là, il suffit de régénérer le modèle pour que la nouvelle arborescence soit disponible:

```
$ symfony doctrine:build-model
```

Et, de cette manière, il est donc possible d'agir sur toutes les opérations réalisées par le modèle depuis ces classes.
