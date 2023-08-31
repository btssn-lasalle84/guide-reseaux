# regex (_regular expression_)

Les expressions rationnelles ou expression régulière(_Regular Expressions_) sont beaucoup utilisées sous UNIX, et notamment avec les outils d’éditions de texte
et les filtres (`sed`, `grep`, `awk`, ...).

> `grep` (_Global Regular Expression Printer_) permet de faire des recherches de lignes contenant une chaîne correspondant à une expression rationnelle. `sed` (_Stream Editor_) est un éditeur qui possède les mêmes fonctionnalités que l’éditeur `ed` mais qui ne travaille pas en mode interactif. Il permet donc, contrairement à `grep`, de modifier le flux de lignes qui lui est passé.

Il s’agit d’un mécanisme qui permet de décrire des ensembles de caractères dans le cadre d’une recherche ou d’un remplacement de texte.

Exemples :

- code postal (fr) : `\d{2}[ ]?\d{3}`
- heure `HH:MM` : `^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$`
- date : `^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$`
- email : `^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6})*$`
- adresse IPv4 : `\b(?:(?:25[0-5]|2[0-4]\d|[01]?\d\d?)\.){3}(?:25[0-5]|2[0-4]\d|[01]?\d\d?)\b`
- URL : `^(((h..ps?|f.p):\/\/)?(?:([\w\-\.])+(\[?\.\]?)([\w]){2,4}|(?:(?:25[0–5]|2[0–4]\d|[01]?\d\d?)\[?\.\]?){3}(?:25[0–5]|2[0–4]\d|[01]?\d\d?)))*([\w\/+=%&_\.~?\-]*)$`
- mot de passe (doit contenir 1 lettre minuscule, 1 lettre majuscule, 1 chiffre, 1 caractère spécial et comporter au moins 8 caractères)
- etc.

```
/(?=(.*[0-9]))(?=.*[\!@#$%^&*()\\[\]{}\-_+=~`|:;"'<>,./?])(?=.*[a-z])(?=(.*[A-Z]))(?=(.*)).{8,}/
```


Une expression rationnelle est une suite de caractères qu’on appelle plus simplement **motif** (_pattern_) pour trouver une **correspondance** (_match_).

Les mécanismes de base pour former un motif sont basés sur des caractères spéciaux de substitution, de groupement et de quantification.

## Les quantificateurs

- `?` qui définit un groupe qui existe zéro ou une fois : `toto?` correspondant (_match_) alors à « tot » ou « toto » mais pas « totoo
»
- `*` qui définit un groupe qui existe zéro ou plusieurs fois : `toto*` correspondant à « tot », « toto », « totoo », « totooo », etc.
- `+` qui définit un groupe qui existe une ou plusieurs fois : `toto+` correspondant à « toto », « totoo », « totooo », etc. mais pas « tot »
- `{n}` qui définit exactement `n` occurrences de l’expression précédant les accolades : `a{3}` correspondant à « aaa » mais pas à « aa », ni « aaaa » etc.
- `{n,m}` qui définit entre `n` et `m` occurrences de l’expression précédant les accolades : `a{2,4}` correspondant à « aa », « aaa », « aaaa » mais pas à « a », ni « aaaaa »
- `{n,}` qui définit au moins n occurrences de l’expression précédant les accolades : `a{3,}` correspondant à « aaa », « aaaa », « aaaaa » mais pas à « aa »

> Pour neutraliser un caractère spécial, il faut l’« échapper », c’est-à-dire le faire précéder du caractère `\` (anti-slash).

## Les opérateurs de base

- l’opérateur de concaténation de deux expressions (implicite) : `ab` correspondant à « ab » mais pas à « a », ni « b », ni une chaîne vide ;
- `.` qui définit un caractère et un seul : `.` correspondant à « a », « b », ... mais pas une chaîne vide, ni « ab » ;
- `|` qui est l’opérateur de choix entre plusieurs alternatives. Il peut être combiné autant de fois que nécessaire pour chacune des alternatives possibles. Il fait correspondre l’une des expressions placées avant ou après l’opérateur : `a|b` correspondant à « a », « b » mais pas à une chaîne vide, ni « ab », ni « c » ;
- `[]` qui définit un des caractères entre crochets (« classe de caractères ») : `[aeiou]` correspondant à « a », « e », « i », ... mais pas à une chaîne vide, ni « b », ni « ae » ; Entre ces crochets, un intervalle de caractères peut être indiqué en donnant le premier et le dernier caractère, séparés par un tiret : `[a-d]` est équivalent à `[abcd]` 
- `[ˆ]` qui définit un caractère n’étant pas entre crochets (négation) : `[ˆaeiou]` correspondant à « b », ... mais pas à une chaîne vide, ni « a », ni « e », ... ni « bc » ;
- `()` qui définit un groupement de l’expression entre parenthèses : `(détecté)` correspondant à « détecté » mais pas à « détect », « détecta », « détectés » ;

- `^` qui ne correspond à aucun caractère mais fixe une condition en indiquant que ce doit être au début d’une ligne : `^a` trouve « a » en début de ligne mais pas dans « ba » ;
- `$` qui ne correspond à aucun caractère mais fixe une condition en indiquant que ce doit être à la fin d’une ligne : `a$` trouve « a » en fin de ligne mais pas dans « ab » ;

> Entre les crochets [], les métacaractères sont interprétés de manière littérale : `[.?*]` désigne l’ensemble constitué des caractères « . », « ? » et « * ».

> Les sous-ensembles placés entres `(` et `)` peuvent êtres rappelés par un numéro correspondant à leur ordre de déclaration, précédé du caractère `\`.

## Les classes de caractères

Les classes de caractères les plus utilisées sont généralement fournies avec le moteur d’expression régulière.

> Un moteur d’expressions rationnelles est un outil permettant de manipuler des expressions rationnelles.

Quelques classes de caractères POSIX prédéfinies :

- `[:digit:]` = chiffres décimaux
- `[:alpha:]` = caractères alphabétiques
- `[:alnum:]` = caractères alphanumériques
- `[:blank:]` = espace et tabulation
- `[:space:]` = caractères d’espacement
- `[:punct:]` = caractères de ponctuation
- etc.

:point_right: `[[:alnum:]]` est équivalent à `[0-9A-Za-z]` pour des caractères ASCII.

## Les standards

Le standard POSIX propose plusieurs normes :

- BRE (_Basic Regular Expressions_) pour les expressions rationnelles basiques. C’est par exemple le standard par défaut pour `sed` et `grep`.
- ERE (_Extended Regular Expressions_) pour les expressions rationnelles étendues. C’est l’option `-E` pour `grep` (`egrep`) et `-r` pour `sed`.
- Les expressions rationnelles de Perl sont également un standard de fait, en raison de leur richesse et de leur puissance (elles ont donné la bibliothèque **PCRE**). C’est l’option `-P` pour `grep`.

:warning: Les notations peuvent varier légèrement d’un moteur d’expressions rationnelles à l’autre.

> Un moteur d’expressions rationnelles est un outil permettant de manipuler des expressions rationnelles.

Dans BRE, les accolades, les parenthèses, le symbole « ? » et le symbole « + » ne sont pas des métacaractères : ils ne représentent qu’eux même. Pour prendre leur notion de métacaractères, ils ont besoin d’être échappés par le symbole `\`.

Contrairement aux expressions rationnelles basiques, la norme ERE reconnaît les caractères vus précédemment comme des métacaractères. Ils doivent ainsi être échappés pour être interprétés littéralement.

## Exemples

> _regex_ en ligne : https://regex101.com/ ou https://regexr.com/

Un nombre entier : `^([0-9]+)$` ou `^(\d+)$`
Un nombre décimal : `^([0-9]*)[.,]([0-9]+)$` ou `^(\d*)[.,](\d+)$`
Un mot : `^(\w*)$`

---
©️ LaSalle Avignon - [thierry(dot)vaira(at)gmail(dot)com](thierry.vaira@gmail.com)
