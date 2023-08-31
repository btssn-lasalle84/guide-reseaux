# Scripts Python

Ce document présente quelques notions de base sur les scripts en langage Python.

- [Scripts Python](#scripts-python)
  - [Qu'est-ce-qu'un script ?](#quest-ce-quun-script-)
  - [Qu'est-ce-que Python ?](#quest-ce-que-python-)
  - [Premier programme](#premier-programme)
  - [Syntaxe](#syntaxe)
  - [Types de base](#types-de-base)
  - [Saisie au clavier](#saisie-au-clavier)
  - [Affichage à l'écran](#affichage-à-lécran)
  - [Système d'exploitation](#système-dexploitation)
  - [Gestion du réseau](#gestion-du-réseau)

## Qu'est-ce-qu'un script ?

Un script est un **fichier texte** (i.e. une suite de caractères codés en [ASCII](https://fr.wikipedia.org/wiki/American_Standard_Code_for_Information_Interchange)) contenant des suites de commandes exécutées par un **interpréteur** (ici `python`).

## Qu'est-ce-que Python ?

[Python](https://fr.wikipedia.org/wiki/Python_(langage)) est un langage de programmation interprété. Il permet la programmation orientée objet. Il est doté d’un typage dynamique fort, d’une gestion automatique de la mémoire par ramasse-miettes et d’un système de gestion d’exceptions.

Le langage Python est placé sous une licence libre et fonctionne sur la plupart des plates-formes informatiques (Windows, Unix, GNU/Linux, macOS, Android, iOS, ...).

> CPython est l’implémentation de référence du langage Python. C’est un interpréteur de _bytecode_ écrit en langage C. C’est un logiciel libre.

Python est un langage qui peut s’utiliser dans de nombreux contextes et s’adapter à tout type d’utilisation grâce à des bibliothèques spécialisées. Il est cependant particulièrement utilisé comme langage de script pour automatiser des tâches simples mais fastidieuses.

> Il est particulièrement répandu dans le monde scientifique, et possède de nombreuses bibliothèques optimisées destinées au calcul numérique (notamment dans la _data science_). Python est aussi utilisé comme langage de programmation dans l’enseignement élémentaire et supérieur, notamment en France.

Ressources :

- Site officiel : https://www.python.org
- Documentation Python 3 : https://docs.python.org/fr/3/
- Documentation Python 2 : https://docs.python.org/fr/2/
- Le tutoriel Python 3 : https://docs.python.org/fr/3/tutorial/
- Le tutoriel Python 2 : https://docs.python.org/fr/2/tutorial/
- Zen de Python : https://fr.wikipedia.org/wiki/Zen_de_Python

> Deux versions du langage Python ont longtemps cohabité : la version 2 (appelé _python legacy_) et la version 3. L’annonce de la fin de Python 2 pour le 31 décembre 2019 va définitivement accélérer le processus de migration vers la version 3.

Le langage Python est un des langages les plus populaires actuellement : https://www.tiobe.com/tiobe-index/

## Premier programme

Les programmes Python sont des scripts donc des fichiers textes.

Exemple `helloworld.py` :

```python
#!/usr/bin/python3
# coding: utf-8

# un commentaire
print("Hello World!")
```

Dans un script Python :

* le chemin de l'interpréteur avec lequel il doit être exécuté précédé des caractères `#!` (le _shebang_) est indiqué sur la première ligne.
* on peut déclarer l'encodage utilisé (par défaut utf-8 en python 3) : `# coding: utf-8`
* un commentaire commence par le caractère `#` et finit à la fin de la ligne.

Il existe plusieurs manières d'exécuter un script Python :

* le rendre exécutable : `$ chmod +x helloworld.py ; ./helloworld.py`
* utiliser l'interpréteur Python : `$ python helloworld.py` ou `$ python3 helloworld.py`

## Syntaxe

Python utilise pour séparer les instructions : le retour chariot, les deux points (`:`)

Les blocs de code (fonctions, instructions `if`, boucles `for` ou `while` etc.) sont définis par leur indentation après les deux points (`:`).

L’indentation démarre le bloc et la désindendation le termine.

> Il n’y a donc pas d’accolades, de crochets ou de mots clés spécifiques.

## Types de base

Les types de base en Python sont relativement complets et puissants, il y a entre autres :

* Les objets numériques :
    * `int` est un entier illimité. Avant la version 3.0, ce type était dénommé `long`, et le type `int` correspondait à un entier 32 ou 64 bits. Néanmoins, une conversion automatique évitait tout débordement.
    * `float` est un flottant équivalent au type double du C
    * `complex` est une approximation d'un nombre complexe (typiquement deux `float`).

En Python, les variables ne sont jamais explicitement typées. En se basant sur la valeur que vous lui assignez, Python gère les types de données en interne.

Pour connaître le type d'une variable, il suffit d'utiliser la fonction interne à Python `type()`. Pour transtyper (_cast_) une variable, on préfixe les parenthèses avec le type désiré.

Exemple d’utilisation des types en Python (`type.py`) :

```python
#!/usr/bin/python3
# coding: utf-8

a = 1 # un entier
b = 2.5 # un float
c = "hello" # une chaine de caracteres

# afficher le type d'une variable :
print(type(a)) # <class 'int'>
print(type(b)) # <class 'float'>
print(type(c)) # <class 'str'>

# transtypage :
a = int(b) # a vaut 2

# vérifier le type d'une variable :
print(isinstance(a, int))
```

* Les objets « itérables » : `tuple`, `list`, `set`, `dict`, `str` etc.

En Python, on distingue deux types d'objets : les mutables (listes, dictionnaires, sets, ...) et les non mutables (str, int, float, tuples, ...).

Les mutables sont ceux qu'on peut modifier après leur création. Les non mutables (immuable) sont ceux qu'on ne peut pas modifier après création.

Les objets itérables sont parcourus à l'aide d'une boucle `for` de la manière suivante :

```python
for element in objet_iterable:
    traiter(element)
```

Il est possible de dériver les classes des types de base pour créer ses propres types.

## Saisie au clavier

On utilisera suivant les versions de Python :

* En Python 3, `input()` retourne une chaîne comme `raw_input()` en Python 2
* En Python 2, `input()` est équivalent à `eval(raw_input())`

`input(prompt)` et `raw_input(prompt)` peuvent recevoir en argument une invite (_prompt_).

## Affichage à l'écran

On utilisera `print` :

```python
# coding: utf-8

# affiche une chaîne de caractères
print("Hello world !")
s = "Hello world !"
print(s)
print(s + s) # concaténation

# affiche des valeurs
print(1)
i = 1
print(i)
f = 0.5
print('i = %d et f = %.1f' % (i, f))

# avec un formatage :
print('{0:5d}'.format(i))
print(repr(i).rjust(5))
print(repr(i).zfill(5))

# En Python3 :
print('.', end='') # pour désactiver le saut de ligne par défaut de print
```

Ou `write` du module [sys](https://docs.python.org/fr/3/library/sys.html) :

```python
import sys
sys.stdout.write('.') # il n'y aura pas de saut de ligne automatique ici
```

## Système d'exploitation

Le module [os](https://docs.python.org/fr/3/library/os.html) fournit un moyen portable d'utiliser les fonctionnalités dépendantes du système d'exploitation.

Exemple : un script qui crée 100 répertoires nommés toto1, toto2, toto3, ... avec les droits `rwxr-x---` mais en utilisant le mode octal.

```python
#!/usr/bin/python

import os, sys

for i in range(1,100):
    os.mkdir( "toto" + str(i), 0750 );
```

## Gestion du réseau

Le module [socket](https://docs.python.org/fr/3/library/socket.html)

---
©️ LaSalle Avignon - [thierry(dot)vaira(at)gmail(dot)com](thierry.vaira@gmail.com)
