# Scripts bash

Ce document présente quelques notions de base sur les _shell_ scripts `bash`.

- [Scripts bash](#scripts-bash)
  - [Qu'est-ce-qu'un script ?](#quest-ce-quun-script-)
  - [Shebang](#shebang)
  - [Les variables](#les-variables)
  - [Les arguments](#les-arguments)
  - [Structures de contrôle](#structures-de-contrôle)
  - [Commandes utiles](#commandes-utiles)
  - [Affichage (`echo`) et saisie (`read`)](#affichage-echo-et-saisie-read)
    - [`echo` et `printf`](#echo-et-printf)
    - [`read`](#read)
  - [Vérification](#vérification)
    - [`test` et son son synonyme `[`](#test-et-son-son-synonyme-)
    - [Nombre d'arguments `$#`](#nombre-darguments-)
    - [Valeur numérique](#valeur-numérique)
    - [Chaîne](#chaîne)
    - [Longueur d'une chaîne](#longueur-dune-chaîne)
    - [Fichier ou répertoire](#fichier-ou-répertoire)
  - [Redirection](#redirection)

## Qu'est-ce-qu'un script ?

Un script est un **fichier texte** (i.e. une suite de caractères codés en [ASCII](https://fr.wikipedia.org/wiki/American_Standard_Code_for_Information_Interchange)) contenant des suites de commandes exécutées par un **interpréteur** (ici un _shell_).

> Le _shell_ est une couche logicielle qui fournit l'interface utilisateur d'un système d'exploitation. Voir aussi : [Shell Unix](https://fr.wikipedia.org/wiki/Shell_Unix)

Les scripts sont surtout utilisés par les administrateurs réseaux et les développeurs car ils permettent d’**automatiser des traitements**.

Exemple `monscript.sh` :

```bash
echo "Contenu du répertoire :"
ls -aAl1
```

Il existe plusieurs manières d’exécuter un script :

- le rendre exécutable : `$ chmod +x monscript.sh ; ./monscript.sh`
- passer son nom en paramètre d’un shell : `$ /bin/bash monscript.sh`
- utiliser une fonction de lancement de commande du shell : `$ . monscript.sh` ou `$ source monscript.sh`

> `.sh` est l'extension habituelle des scripts `sh` ou `bash`

Dans un script :

- un commentaire commence par le caractère `#` et finit à la fin de la ligne
- une instruction nulle est indiquée par le caractère `:`
- le chemin du _shell_ avec lequel il doit être exécuté précédé des caractères `#!` (le _shebang_) est indiqué sur la première ligne. Si ce n’est pas le cas, c’est le _shell_ à partir duquel le script est lancé qui s’en charge.

## Shebang

Le [shebang](https://fr.wikipedia.org/wiki/Shebang) est représenté par `#!` dans l'en-tête d'un fichier texte pour indiquer au système d'exploitation (de type Unix) que ce fichier n'est pas un fichier binaire mais un script (ensemble de commandes). Sur la même ligne, on précisera l'interpréteur permettant d'exécuter ce script.

```bash
$ cat corriger.sh | head -1
#!/bin/bash
```

## Les variables

Une variable existe dès qu’on lui attribue une valeur. Une chaîne vide est une valeur valide.

Une fois qu’une variable existe, elle ne peut être détruite qu’en utilisant la commande interne `unset`.

Une variable peut recevoir une valeur par une affectation de la forme : `nom=[valeur]`

Le caractère `$` permet d’introduire le remplacement des variables : `echo $nom`

La substitution de commandes permet de remplacer le nom d’une commande par son résultat. Il en existe deux formes : 

- `$(commande)`
- `‘commande‘`

Exemple :

```bash
$ fichiers=$(ls)
$ echo $fichiers
```

## Les arguments

Les arguments sont les paramètres passés après le nom du script exécuté. Ils sont accessibles et manipulables au travers de variables prédéfinies :

- `$#` : nombre d’arguments reçus
- `$*` : liste de tous les arguments
- `$0` : nom du script en cours d’exécution
- `$1` : premier argument, `$2` deuxième argument, `$3` troisième argument, ... jusqu'à `$9` ensuite il faut utiliser `shift` pour les décaler d'une position
...
- `$@` : liste de tous les arguments à partir de `$1`

## Structures de contrôle

- Les structures conditionnelles : `if then else fi`, les choix multiples avec `case` ou `select`
- Les contrôles itératifs : les boucles `for`, `while` et `until`

Les structures de contrôles utilisent la commande externe `test` pour évaluer des expressions booléennes. Elle renvoie `0` si le test est **VRAI** (_true_), et `1` sinon. La forme la plus courante est l’utilisation de crochets `[` (ou `[[` depuis la version 2) qui encadrent le test (délimités par au moins un espace).

```bash
$ help test
$ help [
$ help [[
```

## Commandes utiles

- Commandes internes :

  - `echo` : affiche sur la sortie standard (voir aussi printf)
  - `read` : lit l’entrée standard (et stocke dans des variables les mots tapés au clavier par l’utilisateur)
  - `exit` : termine le script immédiatement en retournant une valeur (0 par défaut)
  - `eval` : exécute des arguments comme s’ils étaient une commande. Fonctionne comme les guillements inversés “.
  - `let` : sert à évaluer des expressions arithmétiques.

> Documentation des commandes internes : `man bash`

- Commandes externes :

  - `test` : permet d’évaluer des expressions booléennes. Il y a trois types de tests : sur les fichiers, sur les chaînes de caractères et sur les nombres.
  - `expr` : sert à évaluer des expressions, et notamment les expressions arithmétiques. Un autre manière d’évaluer une expression arithmétique dans un script est d’utiliser la notation suivante : `$(( expressions ))`
  - `bc` : calculatrice pour notamment pour des calculs complexes ou sur des réels (avec un _pipe_ `|` et les options `bc -lq`)

Voir aussi : [Commandes GNU/Linux](../tldr/gnu-linux/README.md)

## Affichage (`echo`) et saisie (`read`)

### `echo` et `printf`

`echo` est une commande interne du _shell_ `bash` qui permet d'afficher sur la sortie standard une chaîne ou le contenu d'une variable :

Exemples :

```sh
$ type echo
echo est une primitive du shell

# Affiche une chaîne
$ echo "Bonjour"
Bonjour
# Affiche une chaîne sans effectuer le saut de ligne final (\n)
$ echo -n "Bonjour"
# Interprête  les caractères de contrôle
$ echo -e "\tBonjour\n"

# Affiche le contenu d'une variable
$ a="Bonjour"
$ echo $a
Bonjour
```

```sh
$ help echo
echo: echo [-neE] [arg ...]
    Écrit les arguments sur la sortie standard.

    Affiche les ARGs, séparés par une espace, sur la sortie standard, suivis
    d'un retour à la ligne.

    Options :
      -n	n'ajoute pas de saut de ligne
      -e	active l'interprétation des barres contre-obliques d'échappement ci-dessous
...
```

Voir aussi :

- affichage en couleur : `echo -e "\x1B[1;31;49mHello World\033[0m"`

> [ANSI escape code](https://en.wikipedia.org/wiki/ANSI_escape_code#graphics)

- `printf`

```sh
# Equivalent de printf en C
$ printf '%s\n' "Bonjour"
Bonjour

$ a="Bonjour"
$ printf '%s\n' $a
Bonjour
$ a=2
$ printf '%d\n' $a
2
```

### `read`

`read` est une commande interne du _shell_ `bash` qui permet de lire depuis l'entrée standard (le clavier par défaut) :

Exemples :

```sh
$ type read
read est une primitive du shell

$ read MESSAGE
Hello
$ echo $MESSAGE
Hello
```

Quelques options utilisées habituellement avec `read` :

```bash
$ help read
read: read [-ers] [-a tableau] [-d delim] [-i texte] [-n ncars] [-N ncars] [-p prompt] [-t timeout] [-u fd] [nom ...]
    Lit une ligne depuis l'entrée standard et la découper en morceaux.
    
    Lit une simple ligne depuis l'entrée standard ou depuis le descripteur de
    fichier FD si l'option « -u » est fournie.  La ligne est découpée en morceaux
    comme des mots, et le premier mot est assigné au premier NOM, le deuxième mot
    au deuxième NOM, et ainsi de suite, le dernier NOM récupérant la liste des mots
    restants. Seuls les caractères trouvés dans $IFS sont reconnus comme délimiteurs
    de mots
    
    Si aucun NOM n'est fourni, la ligne lue est stockée dans la variable REPLY.
    
    Options :
      -d délim	continue jusqu'à ce que le premier caractère de DELIM soit lu,
    		au lieu du retour à la ligne
      -n n	termine après avoir lu N caractères plutôt que d'attendre
    		un retour à la ligne, mais obéi à un délimiteur si moins de N caractères
    		sont lus avant le délimiteur
      -N n	termine seulement après avoir lu exactement N caractères, à moins
    		que le caractère EOF soit rencontré ou que le délai de lecture n'expire.
    		Les délimiteurs sont ignorés
      -p prompt	affiche la chaîne PROMPT sans retour à la ligne final, avant de
    		tenter une lecture
      -s	ne pas répéter l'entrée provenant d'un terminal
      -t timeout	expire et renvoie un code d'échec si une ligne d'entrée complète
    		n'est pas lue en moins de TIMEOUT secondes.  La valeur de la variable TIMEOUT
    		est le délai d'expiration par défaut.  TIMEOUT peut être un nombre décimal.
    		Si TIMEOUT est à zéro, la lecture se termine immédiatement sans essayer de
    		lire la moindre donnée mais elle renvoie un code de succès seulement
    		si l'entrée est disponible sur le descripteur de fichier.  Le code
    		de sortie est supérieur à 128 si le délai a expiré

      ...
    
    Code de sortie :
    Le code de retour est 0, à moins qu'une fin de fichier ne survienne, que le délai expire,
    ou qu'un descripteur de fichier non valable ne soit fourni comme argument à « -u ».
```

## Vérification

### `test` et son son synonyme `[`

La commande `test` permet d'évaluer une expression conditionnelle sur des fichiers, chaînes ou valeurs arithmétiques. On utilise plutôt son synonyme `[` dans les scripts.

Exemples :

```sh
$ help test
$ help [

# Test arithmétique
$ test 2 -eq 2
$ echo $?
0

# Test sur fichier
$ test -f README.md && echo "Le fichier existe"
Le fichier existe

# Test sur chaînes
$ test "azerty" = "qwerty"
$ echo $?
1
```

### Nombre d'arguments `$#`

Le nombre d'arguments passés à un script est contenu dans la variable `$#`.

Il est habituel en début de script de la tester pour s'assurer du bon nombre de paramètres reçus avant de continuer l'exécution. Si ce n'est pas le cas, il est conseillé d'afficher l'usage du script.

Exemple d'un script qui attend un et un seul argument :

```sh
# Attend UN argument ?
if [ $# -eq 1 ]; then
    echo "$1"
else
    echo "Usage : $(basename $0) <truc>"
    exit 1
fi
```

La commande `basename` élimine le chemin d'accès (et le suffixe) d'un nom de fichier.

Exemples :

```sh
# Enlève le chemin
$ basename /usr/bin/sort
sort

# Enlève le suffixe
$ basename -s .sh corriger.sh
corriger
```

### Valeur numérique

On peut utiliser `test` (ou son synonyme `[`) pour effectuer une vérification numérique (`-eq`, `-ne`, ...) :

```sh
if [ $# -eq 1 ]; then
    # nombre ?
    if [ "$1" -eq "$1" ] 2> /dev/null
    then
        echo "Super un nombre !"
    else
        echo "Erreur : il faut un nombre !"
        echo "Usage : $(basename $0) <nombre>"
        exit 2
    fi
else
    echo "Usage : $(basename $0) <nombre>"
    exit 1
fi
```

Avec `bash`, il est possible d'utiliser une expression rationnelle avec `[[` (`help [[`) :

```sh
# Il faut une valeur numérique
if [[ "$1" =~ [^0-9]+ ]]
then
    echo 'le paramètre doit être un nombre !'
    exit 2
fi
```

### Chaîne

On peut utiliser `test` (ou son synonyme `[`) pour effectuer une vérification sur une chaîne (`=`, `!=`, ...) :

```sh
if [ $# -eq 1 ]; then
    # nombre ?
    if [ "$1" = "hello" ] 2> /dev/null
    then
        echo "Merci !"
    else
        echo "Erreur : il manque \"hello\" !"
        echo "Usage : $(basename $0) hello"
        exit 2
    fi
else
    echo "Usage : $(basename $0) hello"
    exit 1
fi
```

### Longueur d'une chaîne

```sh
# détermine la longueur d'une chaine
$ password="hello"
$ longueur=${#password}
$ echo $longueur
5
```

### Fichier ou répertoire

On peut utiliser `test` (ou son synonyme `[`) pour effectuer une vérification sur un fichier ou répertoire (`-f`, `-e`, ...) :

```sh
if [ $# -eq 1 ]; then
    # fichier ?
    if [ -f "$1" ] 2> /dev/null
    then
        echo "Super un fichier !"
    else
        echo "Erreur : fichier introuvable !"
        echo "Usage : $(basename $0) <fichier>"
        exit 2
    fi
else
    echo "Usage : $(basename $0) <fichier>"
    exit 1
fi
```

## Redirection

L'opérateur `>` redirige le flux de sortie standard (_stdout_) vers un fichier. Idem pour l'opérateur `>>` mais en l'ajoutant à la fin du fichier.

L'expression `2> /dev/null` redirige le flux d'erreur standard (_stderr_) vers le fichier `/dev/null`. Cela a pour effet de supprimer les messages d'erreur d'une commande.

L'opérateur `<` redirige le flux d'entrée standard (_stdin_) depuis un fichier.



---
©️ LaSalle Avignon - [thierry(dot)vaira(at)gmail(dot)com](thierry.vaira@gmail.com)
