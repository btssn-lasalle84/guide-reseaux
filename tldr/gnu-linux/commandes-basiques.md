# Commandes de base (GNU/Linux)

Ce document présente quelques commandes de base.

> D'autres commandes GNU/Linux sont aussi abordées dans les [shell scripts](../../cheat-sheets/scripts.md) `bash`.

- [Commandes de base (GNU/Linux)](#commandes-de-base-gnulinux)
  - [Aide et documentation](#aide-et-documentation)
    - [`man` : Affiche les pages du manuel (`man man`)](#man--affiche-les-pages-du-manuel-man-man)
    - [`apropos` : Recherche dans les pages de manuel](#apropos--recherche-dans-les-pages-de-manuel)
    - [`tldr` : Affiche les usages utiles des commandes](#tldr--affiche-les-usages-utiles-des-commandes)
    - [`help` : Affiche des informations sur les commandes internes du shell](#help--affiche-des-informations-sur-les-commandes-internes-du-shell)
    - [`info` : Affiche la documentation détaillée](#info--affiche-la-documentation-détaillée)
  - [Manipulation de répertoires](#manipulation-de-répertoires)
    - [`pwd` : Affiche le nom du répertoire actuel](#pwd--affiche-le-nom-du-répertoire-actuel)
    - [`mkdir` : Crée un répertoire](#mkdir--crée-un-répertoire)
    - [`cd` : Modifie le répertoire de travail courant](#cd--modifie-le-répertoire-de-travail-courant)
    - [`ls` : Liste le contenu d'un répertoire](#ls--liste-le-contenu-dun-répertoire)
    - [`stat` : Affiche des informations sur le fichier](#stat--affiche-des-informations-sur-le-fichier)
  - [Manipulation de fichiers](#manipulation-de-fichiers)
    - [`touch` : Modifie l'horodatage d'un fichier](#touch--modifie-lhorodatage-dun-fichier)
    - [`file` : Détermine le type d'un fichier](#file--détermine-le-type-dun-fichier)
    - [`vim` : Éditeur de texte en ligne de commandes](#vim--éditeur-de-texte-en-ligne-de-commandes)
    - [`cat` : Affiche et concatène le contenu d'un ou plusieurs fichiers](#cat--affiche-et-concatène-le-contenu-dun-ou-plusieurs-fichiers)
    - [`strings` : N'affiche que les chaînes "imprimables" d'un fichier objet ou binaire](#strings--naffiche-que-les-chaînes-imprimables-dun-fichier-objet-ou-binaire)
    - [`head` et `tail` : Affiche les premières et dernières lignes d'un fichier](#head-et-tail--affiche-les-premières-et-dernières-lignes-dun-fichier)
    - [`wc` : Affiche le nombre de lignes, de mots et d'octets d'un fichier](#wc--affiche-le-nombre-de-lignes-de-mots-et-doctets-dun-fichier)
    - [`tr` : Convertir ou éliminer des caractères](#tr--convertir-ou-éliminer-des-caractères)
    - [`expand` - Convertit les tabulations en espaces](#expand---convertit-les-tabulations-en-espaces)
    - [`paste` : Regroupe les lignes de différents fichiers](#paste--regroupe-les-lignes-de-différents-fichiers)
    - [`diff` : Compare des fichiers et des répertoires](#diff--compare-des-fichiers-et-des-répertoires)
    - [`patch`: _Patche_ (applique) un fichier (ou des fichiers) avec un fichier de différences (cf. `diff`)](#patch-patche-applique-un-fichier-ou-des-fichiers-avec-un-fichier-de-différences-cf-diff)
    - [`sha1sum` : Calcule une empreinte à partir d'une fonction de hachage SHA-1](#sha1sum--calcule-une-empreinte-à-partir-dune-fonction-de-hachage-sha-1)
    - [`md5sum` : Calcule une empreinte à partir d'une fonction de hachage MD5](#md5sum--calcule-une-empreinte-à-partir-dune-fonction-de-hachage-md5)
  - [Manipulation de fichiers et répertoires](#manipulation-de-fichiers-et-répertoires)
    - [`cp` : Copie des fichiers et des répertoires](#cp--copie-des-fichiers-et-des-répertoires)
    - [`mv` : Déplace ou renomme des fichiers ou répertoires](#mv--déplace-ou-renomme-des-fichiers-ou-répertoires)
    - [`rm` : Supprime des fichiers ou répertoires](#rm--supprime-des-fichiers-ou-répertoires)
    - [`find` : Recherche des fichiers ou des répertoires (à partir des critères)](#find--recherche-des-fichiers-ou-des-répertoires-à-partir-des-critères)
  - [Commandes](#commandes)
    - [`xargs` : Construit et exécute des lignes de commandes à partir de l'entrée standard](#xargs--construit-et-exécute-des-lignes-de-commandes-à-partir-de-lentrée-standard)
    - [`alias` : Crée des alias (des raccourcis de commandes)](#alias--crée-des-alias-des-raccourcis-de-commandes)
    - [`clear` : Efface l'écran du terminal](#clear--efface-lécran-du-terminal)
    - [`history` : Affiche l'historique des commandes](#history--affiche-lhistorique-des-commandes)
    - [`date` : Affiche ou configure la date et l'heure du système](#date--affiche-ou-configure-la-date-et-lheure-du-système)
  - [Filtrage](#filtrage)
    - [`sort` : Trie les lignes de fichiers texte](#sort--trie-les-lignes-de-fichiers-texte)
    - [`uniq` : Signale ou élimine les lignes répétées](#uniq--signale-ou-élimine-les-lignes-répétées)
    - [`grep` : Recherche des motifs dans un texte](#grep--recherche-des-motifs-dans-un-texte)
    - [`awk` : Manipule les fichiers textes](#awk--manipule-les-fichiers-textes)
    - [`sed` : Éditeur non interactif de flux de données textuelles](#sed--éditeur-non-interactif-de-flux-de-données-textuelles)
  - [Divers](#divers)
    - [`bc` : Effectue des calculs](#bc--effectue-des-calculs)
    - [`cal` : Affiche un calendrier](#cal--affiche-un-calendrier)
---
> « Voici [la philosophie d'Unix](https://fr.wikipedia.org/wiki/Philosophie_d%27Unix) :
>   Écrivez des programmes qui effectuent une seule chose et qui le font bien.
>   Écrivez des programmes qui collaborent.
>   Écrivez des programmes pour gérer des flux de texte, car c'est une interface universelle. »
> Ce qui est souvent résumé par : « Ne faire qu'une seule chose, et la faire bien. ».
---

## Aide et documentation

Lien : https://linuxcommandlibrary.com/

### `man` : Affiche les pages du manuel (`man man`)

Voir aussi les commandes : `info`, `help`, ...

  - Affiche les pages du manuel d'une commande :
    `man commande`

  - Affiche la page du manuel sur le code ASCII :
    `man ascii`

  - Affiche les pages du manuel d'une commande du chapitre (section) 7 :
    `man commande.7` ou `man 7 commande`

  - Recherche une page de manuel contenant une chaîne de caractères :
    `man -k "chaine"`

### `apropos` : Recherche dans les pages de manuel

Par exemple pour trouver une nouvelle commande.

  - Recherche par mot clé :
    `apropos expression_reguliere`

Voir aussi : `man -k "chaine"`

### `tldr` : Affiche les usages utiles des commandes

  - Affiche la page d'aide d'une commande :
    `tldr commande`

  - Affiche la page d'aide d'une sous-commande :
    `tldr git-checkout`

  - Met à jour localement les pages d'aide :
    `tldr -u`

Voir aussi : [TL;DR](../README.md)

### `help` : Affiche des informations sur les commandes internes du shell

```bash
$ help help
help: help [-dms] [motif ...]
    Affiche des informations sur les commandes intégrées.

    Affiche de courts résumés des commandes intégrées.  Si MOTIF est
    spécifié, une aide détaillée de toutes les commandes correspondantes
    au MOTIF est affichée, sinon la liste des sujets d'aide est affichée.

    Options :
      -d	affiche une courte description pour chaque sujet
      -m	affiche l'aide dans un format proche des pages de man(uel)
      -s	n'affiche qu'une courte aide pour chaque sujet correspondant au
    		MOTIF

    Arguments :
      MOTIF	Motif spécifiant un sujet d'aide

    Code de retour :
    Renvoie le code de succès à moins que le MOTIF ne soit pas trouvé ou qu'une
    option non valable ne soit donnée.

$ help echo
echo: echo [-neE] [arg ...]
    Écrit les arguments sur la sortie standard.

    Affiche les ARGs, séparés par une espace, sur la sortie standard, suivis
    d'un retour à la ligne.

    Options :
      -n	n'ajoute pas de saut de ligne
      -e	active l'interprétation des barres contre-obliques d'échappement ci-dessous
      -E	supprime explicitement l'interprétation des barres contre-obliques d'échappement
...
```

### `info` : Affiche la documentation détaillée

```bash
$ info info
...

$ info ls
...
```

## Manipulation de répertoires

### `pwd` : Affiche le nom du répertoire actuel

### `mkdir` : Crée un répertoire

  - Crée un répertoire dans le répertoire actuel ou dans un chemin donné :
    `mkdir répertoire`

  - Crée des répertoires récursivement (utile pour créer des répertoires imbriqués) :
    `mkdir -p chemin/vers/répertoire`

### `cd` : Modifie le répertoire de travail courant

  - Se déplace vers le dossier donné :
    `cd chemin/vers/dossier`
    On distingue les **chemins absolus** qui commencent toujours par `/` des **chemins relatifs** qui utilisent des références connus du système comme `.` (le répertoire courant) ou `..` (le répertoire parent). Le système d'exploitation a une vision très limitée de l'arborescence (cf. la variable d'environnement `$PATH`)

  - Se déplace vers le répertoire personnel de l'utilisateur actuel :
    `cd` ou `cd ~` ou `cd $HOME`

  - Remonte vers le parent du répertoire courant :
    `cd ..`

  - Revient au répertoire précédent :
    `cd -`

### `ls` : Liste le contenu d'un répertoire

On utilise souvent des **alias** de cette commande comme `ll`

  - Liste les fichiers, un par ligne :
    `ls -1`

  - Liste tous les fichiers, ainsi que les fichiers cachés (les fichiers qui commencent par un point `.` :
    `ls -a`

  - Liste tous les fichiers avec un format détaillé (permissions, propriétaire, taille et date de modification) :
    `ls -la`

  - Liste les fichiers avec un format détaillé en utilisant des préfixes d'unités informatiques (KiB, MiB, GiB) ou internationales en utilisant des puissances de 1000 et non de 1024 :
    `ls -lh` ou `ls --si`

  - Liste les fichiers avec un format détaillé en triant par taille décroissante :
    `ls -lS`

  - Liste avec un format détaillé tous les fichiers en triant par date de modification (les plus anciennes en premier) :
    `ls -ltr`

Vois aussi : `stat`

### `stat` : Affiche des informations sur le fichier

## Manipulation de fichiers

### `touch` : Modifie l'horodatage d'un fichier

  - Crée un fichier vide ou modifie son horodatage si le fichier existe déjà :
    `touch fichier`

  - Modifie la date et l'heure :
    `touch -t YYYYMMDDHHMM.SS fichier`

### `file` : Détermine le type d'un fichier

  - Fournit la description de type d'un fichier :
    `file fichier`

  - Détermine le type de fichiers contenu dans une archive [Zip](https://fr.wikipedia.org/wiki/ZIP_(format_de_fichier)) :
    `file -z foo.zip`

  - Determine le type [MIME](https://fr.wikipedia.org/wiki/Type_de_m%C3%A9dias) d'un fichier :
    `file -i fichier`

### `vim` : Éditeur de texte en ligne de commandes

Vim (_Vi IMproved_), un clone de `vi`, fournit plusieurs modes pour différentes manipulations de texte. Taper `i` pour passer en mode édition et `Esc` pour revenir au mode normal. Taper `:` pour passer en mode ligne de commande. Lien : https://www.vim.org.

  - Ouvre un fichier :
    `vim chemin/vers/fichier`

  - Consulte le manuel utilisateur :
    `:help<Entrée>`

  - Sauvegarde et ferme :
    `:wq<Entrée>`

  - Annule la dernière opération :
    `u`

  - Recherche un motif dans un fichier (appuyez `n`/`N` pour aller à la prochaine / précédente occurrence) :
    `/motif_recherché<Entrée>`

  - Affiche les numéros de ligne :
    `:set nu<Entrée>`

Voir aussi : `nano`

### `cat` : Affiche et concatène le contenu d'un ou plusieurs fichiers

`cat` affiche (et concatène) le contenu d'un ou plusieurs fichiers. La commande `tac` fait la même chose mais à l'envers.

Exemples :

```sh
# Affiche le contenu d'un fichier sur la sortie standard
$ cat fichier
```

  - Concatène le contenu de plusieurs fichiers vers le fichier de destination :
    `cat fichier1 fichier2 > fichier_de_destination`

  - Ajoute le contenu d'un ficher à la fin du fichier de destination :
    `cat fichier1 fichier2 >> fichier_de_destination`

  - Numérote toutes les lignes affichées :
    `cat -n fichier`

> Il existe aussi `bat`, un clone de `cat`, qui utilise la coloration syntaxique et s'intégre avec Git.

### `strings` : N'affiche que les chaînes "imprimables" d'un fichier objet ou binaire

`hexdump` : Affiche (_dump_) le contenu brut (_raw_) d'un fichier en ASCII, décimal, hexadécimal ou octal. En informatique ce type d'affichage se nomme un [_dump_](https://fr.wikipedia.org/wiki/Dump). Voir aussi la commande `od`.

  - Affiche en hexadécimal le contenu d'un fichier :
    `hexdump file`

  - Affiche en hexadécimal et en ASCII le contenu d'un fichier :
    `hexdump -C file`

### `head` et `tail` : Affiche les premières et dernières lignes d'un fichier

La commande `head` affiche les `nb` (10 par défaut) premières lignes d'un fichier.

La commande `tail` affiche les `nb` (10 par défaut) dernières lignes d'un fichier.

Exemples :

```sh
# Affiche les 2 premières lignes au lieu des 10 premières
$ cat fichier | head -n 2
$ cat fichier | head -2
$ head -n 2 fichier
$ head -2 fichier

# Affiche toutes les lignes sauf les 5 dernières lignes
$ cat fichier | head -n -5
$ head -n -5 fichier

# Affiche les 2 dernières lignes
$ cat fichier | tail -n 2
$ cat fichier | tail -2
$ tail -n 2 fichier
$ tail -2 fichier

# Affiche toutes les lignes sauf les 5 premières lignes
$ cat fichier | tail -n +5
$ tail -n +5 fichier
```

### `wc` : Affiche le nombre de lignes, de mots et d'octets d'un fichier

Exemples :

```sh
$ cat README.md | wc -l

$ echo "azerty" | wc -c
7
```

### `tr` : Convertir ou éliminer des caractères

Exemples :

```sh
# Fais correspondre chaque caractère du premier ensemble au caractère correspondant du second ensemble
$ echo "qwerty" | tr 'qw' 'az'
azerty

$ echo "azerty" | tr 'a-z' 'A-Z'
AZERTY

# Convertis une chaîne en MAJUSCULES
$ echo "azerty" | tr '[:lower:]' '[:upper:]'
AZERTY

# Supprime toutes les occurrences de l'ensemble de caractères spécifié dans l'entrée
$ echo "a   b c    d" | tr -d ' '
abcd

# Comprime une série de caractères identiques en un seul caractère
$ echo "a   b c    d" | tr -s ' '
a b c d

# Supprime les caractères non imprimables d'un fichier
$ tr -cd "[:print:]" < fichier
```

### `expand` - Convertit les tabulations en espaces

Voir aussi : `unexpand`

### `paste` : Regroupe les lignes de différents fichiers

Voir aussi : `column`

### `diff` : Compare des fichiers et des répertoires

  - Compare deux fichiers :
    `diff old_file new_file` ou `diff -y old_file new_file` ou `diff -u old_file new_file`

  - Compare deux fichiers en ignorant les espaces :
    `diff -w old_file new_file`

  - Compare récursivement deux répertoires :
    `diff -r old_directory new_directory` ou `diff -rq old_directory new_directory`

Voir aussi : `cmp`

### `patch`: _Patche_ (applique) un fichier (ou des fichiers) avec un fichier de différences (cf. `diff`)

  - Applique le patch sur un fichier :
    `patch path/to/file < patch.diff`

  - Applique le patch sur un fichier pour en créer un nouveau :
    `patch path/to/input_file -o path/to/output_file < patch.diff`

  - Inverse le patch sur un fichier :
    `patch -R < patch.diff`

### `sha1sum` : Calcule une empreinte à partir d'une [fonction de hachage](https://fr.wikipedia.org/wiki/Fonction_de_hachage_cryptographique) [SHA-1](https://fr.wikipedia.org/wiki/SHA-1)

Les applications de ces empreintes sont essentiellement : la vérification de l'intégrité des fichiers ou des messages, la vérification de mot de passe et l'identification de fichiers ou de données. On parle aussi de somme de contrôle (_checksum_).

Lire : [Fonction de hachage](https://fr.wikipedia.org/wiki/Fonction_de_hachage)

  - Calcule une somme de contrôle SHA1 pour un fichier :
    `shasum chemin/vers/fichier` ou `sha1sum chemin/vers/fichier`

  - Calcule une somme de contrôle SHA256 ou SHA512 pour un fichier :
    `shasum --algorithm XXX chemin/vers/fichier`

> Voir aussi : `md5sum`

### `md5sum` : Calcule une empreinte à partir d'une [fonction de hachage](https://fr.wikipedia.org/wiki/Fonction_de_hachage_cryptographique) [MD5](https://fr.wikipedia.org/wiki/MD5)

Les applications de ces empreintes sont essentiellement : la vérification de l'intégrité des fichiers ou des messages, la vérification de mot de passe et l'identification de fichiers ou de données. On parle aussi de somme de contrôle (_checksum_).

Lire : [Fonction de hachage](https://fr.wikipedia.org/wiki/Fonction_de_hachage)

  - Calcule une somme de contrôle MD5 pour un fichier :
    `md5sum chemin/vers/fichier`

  - Calcule une somme de contrôle MD5 à partir de l'entrée standard :
    `echo "text" | md5sum`

> Voir aussi : `sha1sum`

## Manipulation de fichiers et répertoires

### `cp` : Copie des fichiers et des répertoires

  - Copie un fichier dans un autre emplacement avec un nouveau nom :
    `cp path/to/source_file.ext path/to/target_file.ext`

  - Copie un fichier dans un autre emplacement avec le même nom :
    `cp path/to/source_file.ext path/to/target_parent_directory`

  - Copie récursivement la structure d'un répertoire avec son contenu :
    `cp -r path/to/source_directory path/to/target_directory`

  - Copie récursivement la structure d'un répertoire avec son contenu en conservant les méta-données (droits, ...) :
    `cp -ar path/to/source_directory path/to/target_directory`

### `mv` : Déplace ou renomme des fichiers ou répertoires

  - Déplace :
    `mv source destination`

  - Renomme :
    `mv nom nouveau_nom`

  - Déplace plusieurs fichiers dans une autre destination en conservant leur nom :
    `mv source1 source2 source3 destination`

Voir aussi : `rename`

### `rm` : Supprime des fichiers ou répertoires

  - Supprime un fichier :
    `rm fichier`

  - Supprime un répertoire :
    `rm -r repertoire`

> L'option `-f` force l'opération

Voir aussi : `unlink`, `shred` et `rmdir`

### `find` : Recherche des fichiers ou des répertoires (à partir des critères)

  - Trouve des fichiers par extension :
    `find racine -name '*.ext'`

  - Trouve des fichiers correspondant à plusieurs chemins ou motifs :
    `find racine -path '**/chemin/**/*.ext' -or -name '*motif*'`

  - Trouve des dossiers correspondant à un nom donné sans vérifier la casse :
    `find racine -type d -iname '*lib*'`

  - Trouve des fichiers correspondant à un motif donné en excluant certains chemins de la recherche :
    `find racine -name '*.py' -not -path '*/site-packages/*'`

  - Trouve des fichiers dans une fourchette de tailles :
    `find racine -size +500k -size -10M`

  - Exécute une commande pour chaque fichier (utiliser `{}` dans la commande pour utiliser le nom des fichiers) :
    `find racine -name '*.ext' -exec wc -l {} \;`

  - Trouve les fichiers modifiés dans les 7 derniers jours et les supprimer :
    `find racine -daystart -mtime -7 -delete`

  - Trouve les fichiers vides (de taille nulle) et les supprimer :
    `find racine -type f -empty -delete`

## Commandes

### `xargs` : Construit et exécute des lignes de commandes à partir de l'entrée standard

  - Exécute une commande en utilisant les données d'entrée comme arguments :
    `arguments_source | xargs command`
    `ls *.md | xargs cat`

  - Crée une liste compacte de tous les utilisateurs sur le système :
    `cut -d: -f1 < /etc/passwd | sort | xargs echo`

### `alias` : Crée des alias (des raccourcis de commandes)

Les alias expirent avec la session _shell_ actuelle, sauf s'ils sont définis dans le fichier de configuration du _shell_, par exemple `~/.bashrc`.

  - Liste tous les alias :
    `alias`

  - Crée un alias :
    `alias raccourci="commande"` par exemple `alias ll="ls -l"`

  - Affiche la commande associée à l'alias :
    `alias raccourci`

  - Supprime un alias :
    `unalias raccourci`

### `clear` : Efface l'écran du terminal

### `history` : Affiche l'historique des commandes

  - Affiche l'historique des commandes avec un numérotage des lignes :
    `history`

> Les commandes peuvent être rappellées directement avec `!num` où `num` est le numéro de ligne dans l'historique. On peut tout simplement se déplacer dans l'historique avec les flèches directionnelles Haut et Bas. Il est possible de faire une recherche avec `Ctrl r`.

  - Affiche les 20 dernières commandes :
    `history 20`

  - Affiche puis efface l'historique :
    `history -c`

### `date` : Affiche ou configure la date et l'heure du système

  - Display the current date using the default locale's format:
    `date +%c`

  - Display the current date in UTC, using the ISO 8601 format:
    `date -u +%Y-%m-%dT%H:%M:%S%Z`

  - Display the current date as a Unix timestamp (seconds since the Unix epoch):
    `date +%s`

  - Convert a date specified as a Unix timestamp to the default format:
    `date -d @1473305798`

  - Convert a given date to the Unix timestamp format:
    `date -d "2018-09-01 00:00" +%s --utc`

  - Display the current date using the RFC-3339 format (`YYYY-MM-DD hh:mm:ss TZ`):
    `date --rfc-3339=s`

  - Set the current date using the format `MMDDhhmmYYYY.ss` (`YYYY` and `.ss` are optional):
    `date 093023592021.59`

  - Display the current ISO week number:
    `date +%V`

## Filtrage

### `sort` : Trie les lignes de fichiers texte

Exemples :

```sh
# Trie un fichier
$ cat fichier | sort
$ sort fichier

# Trie des lignes
$ echo -e "titi\ntata\ntoto" | sort
tata
titi
toto

# Tri dans l'ordre inverse
$ echo -e "tata\ntiti\ntoto" | sort -r
toto
titi
tata

# Trie numériquement
$ echo -e "2\n8\n1\n5" | sort -n
1
2
5
8

# Tri à partir d'une clé
$ echo -e "tata:10\ntiti:5\ntoto:1" | sort -n -k 2 -t ':'
toto:1
titi:5
tata:10

# Mélange aléatoirement les lignes
$ echo -e "titi\ntata\ntoto" | sort -R
toto
titi
tata
```

### `uniq` : Signale ou élimine les lignes répétées

  - Affiche chaque ligne une fois :
    `sort path/to/file | uniq`

  - Affiche les lignes uniques :
    `sort path/to/file | uniq -u`

### `grep` : Recherche des motifs dans un texte

La commande `grep` permet de rechercher des motifs (simples ou à base de d'expressions rationnelles) dans un texte. On peut utiliser des expressions régulières étendues avec l'option `-E` ou l'équivalent `egrep`.

Exemples :

```sh
# Recherche une chaîne de caractères précise
$ echo "azerty" | grep "az"
azerty
$ echo "azerty" | grep "qw"
$ cat README.md | grep -E "crypter|chiffrage"
$ cat README.md | egrep "crypter|chiffrage"

# Recherche en ignorant la casse
cat README.md | grep -i linux

# Recherche silencieusement
$ cat README.md | grep -q Linux
$ echo $?
0
$ cat README.md | grep -q Windows
$ echo $?
1

# Recherche en affichant que les parties correspondantes sur des lignes séparées
$ echo -e "tata\ntiti\ntoto" | grep "i"
titi
$ echo -e "tata\ntiti\ntoto" | grep -o "i"
i
i
$ echo -e "tata\ntiti\ntoto" | grep -o "i" | wc -l
2

# Inverse le résultat pour exclure des chaînes de caractères spécifiques
$ echo -e "tata\ntiti\ntoto" | grep -v "titi"
tata
toto
```

Voir aussi : `fgrep`, `egrep`, `rgrep`

### `awk` : Manipule les fichiers textes

[awk](https://fr.wikipedia.org/wiki/Awk) est plus qu'une simple commande, c'est un de langage programmation polyvalent pour travailler sur des fichiers. La commande `awk` est principalement utilisée pour la manipulation de fichiers textuels pour des opérations de recherches, de remplacement et de transformations complexes.

Exemples :

```sh
# Affiche la cinquième colonne (ou le champ) dans un fichier qui utilise des espaces comme séparateur
$ awk '{print $5}' fichier

# Affiche une ligne sur trois en partant de la première ligne
$ awk 'NR%3==1' fichier
```

```
# Les 4 caractères les plus fréquents suivis des 4 moins fréquents
$ cat frequence-fr-pourcentage.txt | sort -k 2 -t ' ' -n -r | awk 'NR<5 || NR>22 {print $0};'
e 15.774
r 9.995
i 9.800
s 8.267
q 0.467
k 0.035
j 0.184
h 0.976
```

### `sed` : Éditeur non interactif de flux de données textuelles

[sed](https://fr.wikipedia.org/wiki/Stream_Editor) (_Stream EDitor_) est, comme `awk`, un programme informatique permettant d'appliquer différentes transformations prédéfinies à un flux séquentiel de données textuelles.

Exemples :

```sh
# Remplace la première occurrence d'une expression rationnelle dans chaque ligne d'un fichier
$ sed 's/expression/remplacement/' fichier

$ tldr sed
```

## Divers

### `bc` : Effectue des calculs

  - Calcule une expression :
    `echo '5 / 3' | bc`

  - Calcule une expression avec l'échelle spécifiée :
    `echo 'scale = 10; 5 / 3' | bc`

### `cal` : Affiche un calendrier

---
©️ LaSalle Avignon - [thierry(dot)vaira(at)gmail(dot)com](thierry.vaira@gmail.com)
