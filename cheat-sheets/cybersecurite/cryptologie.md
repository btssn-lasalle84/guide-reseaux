# [Cryptologie](https://fr.wikipedia.org/wiki/Cryptologie)

La [cryptologie](https://fr.wikipedia.org/wiki/Cryptologie) est la « **science du secret** » qui englobe la [cryptographie](https://fr.wikipedia.org/wiki/Cryptographie) (l'**écriture secrète**), la [cryptanalyse](https://fr.wikipedia.org/wiki/Cryptanalyse) (l'**analyse de cette dernière**), et la [stéganographie](https://fr.wikipedia.org/wiki/St%C3%A9ganographie) (l’**art de la dissimulation**).

---
- [Cryptologie](#cryptologie)
  - [Définitions](#définitions)
  - [Cryptographie](#cryptographie)
    - [Notion de clés](#notion-de-clés)
    - [Cryptographie à clef secrète](#cryptographie-à-clef-secrète)
    - [Cryptographie à clef publique](#cryptographie-à-clef-publique)
    - [Chiffrement hybride](#chiffrement-hybride)
  - [Cryptanalyse](#cryptanalyse)
  - [Stéganographie](#stéganographie)
  - [Signature numérique](#signature-numérique)
    - [Fonction de hachage](#fonction-de-hachage)
    - [Signature numérique](#signature-numérique-1)
    - [Certificat électronique](#certificat-électronique)
---

## Définitions

Quelques définitions à connaître :

[Cryptographie](https://fr.wikipedia.org/wiki/Cryptographie)
 : La cryptographie s'attache à protéger des messages (assurant confidentialité, authenticité et intégrité) en s'aidant souvent de secrets ou clés.

[Cryptanalyse](https://fr.wikipedia.org/wiki/Cryptanalyse)
 : La cryptanalyse est la technique qui consiste à déduire un texte en clair d’un texte chiffré sans posséder la clé de chiffrement. Le processus par lequel on tente de comprendre un message en particulier est appelé une attaque.

[Stéganographie](https://fr.wikipedia.org/wiki/St%C3%A9ganographie)
 : La stéganographie est l'art de la dissimulation : son objet est de faire passer inaperçu un message dans un autre message.

[Chiffrement](https://fr.wikipedia.org/wiki/Chiffrement)
 : Le chiffrement est un procédé de cryptographie grâce auquel on souhaite rendre la compréhension d’un document impossible à toute personne qui n’a pas la clé de (dé)chiffrement. Attention, le chiffrage c’est évaluer le coût de quelque chose. Cela n'a absolument rien à voir avec le chiffrement !

[Chiffrer](https://fr.wikipedia.org/wiki/D%C3%A9chiffrer)
 : L’action de procéder à un chiffrement. En informatique et en télécommunications, déchiffrer consiste à retrouver le texte original (aussi appelé clair) d’un message chiffré dont on possède la clé de (dé)chiffrement.

[Clé de chiffrement](https://fr.wikipedia.org/wiki/Cl%C3%A9_de_chiffrement)
 : Une clé est un paramètre utilisé en entrée d'une opération cryptographique (chiffrement, déchiffrement, signature numérique, vérification de signature). Une clé de chiffrement peut être symétrique ([cryptographie symétrique](https://fr.wikipedia.org/wiki/Cryptographie_sym%C3%A9trique)) ou asymétrique ([cryptographie asymétrique](https://fr.wikipedia.org/wiki/Cryptographie_asym%C3%A9trique)).

[Signature numérique](https://fr.wikipedia.org/wiki/Signature_num%C3%A9rique)
 : La signature numérique est un mécanisme permettant de garantir la non-répudiation d'un document électronique et d'en authentifier l'auteur, par analogie avec la signature manuscrite d'un document papier.

[Décrypter](https://fr.wikipedia.org/wiki/D%C3%A9crypter)
 : Opération qui consiste à retrouver le texte original à partir d’un message chiffré sans posséder la clé de (dé)chiffrement. Décrypter ne peut accepter d’antonyme : il est en effet impossible de créer un message chiffré sans posséder de clé de chiffrement. En effet, « [crypter](https://fr.wiktionary.org/wiki/crypter) » (ou cryptage) reviendrait à chiffrer un fichier sans en connaître la clé et donc sans pouvoir le déchiffrer ensuite. Le terme n’est par ailleurs pas reconnu par le dictionnaire de l’Académie française.

[Encrypter](https://fr.wiktionary.org/wiki/encrypter)
 : Le terme « encrypter » et ses dérivés sont des anglicismes. Il ne faut donc pas les utiliser.

[Coder](https://fr.wikipedia.org/wiki/Codage)
 : Coder (et encoder) signifie “Constituer (un message, un énoncé) selon les règles d’un système d’expression sous une forme accessible à un destinataire.” En informatique il s’agit d’une façon d’écrire les mêmes données, mais de manière différente (par exemple en base64, en hexadécimal, etc ...). Il n’y a aucune vocation à assurer la confidentialité, ce n’est donc pas du chiffrement.

> Sources : [chiffrer.info](https://chiffrer.info/) et [Wikipedia](https://fr.wikipedia.org/)

## Cryptographie

Les premières méthodes de [chiffrement](https://fr.wikipedia.org/wiki/Chiffrement) remontent à l’Antiquité et se sont améliorées, avec la fabrication de différentes machines de chiffrement, pour obtenir un rôle majeur lors de la Première Guerre mondiale et de la Seconde Guerre mondiale.

La [cryptographie](https://fr.wikipedia.org/wiki/Cryptographie) se scinde en deux parties :

- d'une part la [cryptographie à clef secrète](https://fr.wikipedia.org/wiki/Cryptographie_sym%C3%A9trique), encore appelée symétrique ou bien classique ;
- d'autre part la [cryptographie à clef publique](https://fr.wikipedia.org/wiki/Cryptographie_asym%C3%A9trique), dite également asymétrique ou moderne.

Les premiers algorithmes utilisés pour le [chiffrement](https://fr.wikipedia.org/wiki/Chiffrement) d'une information étaient assez rudimentaires dans leur ensemble. Ils consistaient notamment au remplacement de caractères par d'autres. La confidentialité de l'algorithme de chiffrement était donc la pierre angulaire de ce système pour éviter un décryptage rapide.

Exemples d'algorithmes de chiffrement faibles :

- [ROT13](https://fr.wikipedia.org/wiki/ROT13) (rotation de 13 caractères, sans clé) ;
- [Chiffre de César ou le code de César](https://fr.wikipedia.org/wiki/Chiffrement_par_d%C3%A9calage) (décalage de trois lettres dans l'alphabet sur la gauche, décalage de _n_ lettres) ;
- [Chiffre de Vigenère](https://fr.wikipedia.org/wiki/Chiffre_de_Vigen%C3%A8re) (introduit la notion de clé).

### Notion de clés

Une **clé** est un paramètre utilisé en entrée d'une opération cryptographique (chiffrement, déchiffrement, signature numérique, vérification de signature).

Une [clé de chiffrement](https://fr.wikipedia.org/wiki/Cl%C3%A9_de_chiffrement) peut être symétrique (cryptographie symétrique) ou asymétrique (cryptographie asymétrique). Dans le premier cas, la même clé sert à chiffrer et à déchiffrer. Dans le second cas on utilise deux clés différentes, la clé publique est utilisée au chiffrement alors que celle servant au déchiffrement est gardée secrète : la clé secrète, ou clé privée, et ne peut pas se déduire de la clé publique.

Une clé peut se présenter sous plusieurs formes : mots ou phrases, procédure pour préparer une machine de chiffrement (connexions, câblage, etc. Voir machine Enigma), données codées sous une forme binaire (cryptologie moderne).

> Liens : [Le coffre de Louis XVI](https://www.youtube.com/watch?v=51Cbf8crqWk) et [Alan Turing et la machine Enigma](https://www.youtube.com/watch?v=7dpFeXV_hqs)

La protection apportée par un algorithme de chiffrement est liée à la longueur de la clé, qui peut s'exprimer en bits. La longueur de la clé quantifie le nombre maximal d'opérations nécessaires au décryptage. En effet, il faut que la clé puisse prendre suffisamment de valeurs pour qu'une attaque exhaustive (force brute), qui essaie systématiquement toutes les clés, soit beaucoup trop longue pour être menée à bien.

La sécurité d'un système de chiffrement doit reposer sur le secret de la clé de chiffrement et non sur celui de l'algorithme. Auguste Kerckhoffs énonce le principe de Kerckhoffs : pour être sûr, l'algorithme doit pouvoir être divulgué. En effet, les logiciels et algorithmes les plus performants et répandus sont issus de la connaissance et des logiciels libres comme PGP ou OpenSSH.

### Cryptographie à clef secrète

Les algorithmes de chiffrement symétrique se fondent sur une même clé pour chiffrer et déchiffrer un message. L'un des problèmes de cette technique est que la clé, qui doit rester totalement confidentielle, doit être transmise au correspondant de façon sûre.

Quelques algorithmes de chiffrement symétrique très utilisés : [DES](https://fr.wikipedia.org/wiki/Data_Encryption_Standard) (obsolète), [AES](https://fr.wikipedia.org/wiki/Standard_de_chiffrement_avanc%C3%A9), ...

![](./images/chiffrement-symetrique.png)

> [tl;dr openssl](../tldr/divers/openssl.md)

Exemple : chiffrer un fichier `mystere`

```sh
$ openssl enc -aes-256-cbc -pbkdf2 -iter 100000 -in mystere -out mystere.chiffre
enter aes-256-cbc encryption password:
Verifying - enter aes-256-cbc encryption password:

$ file mystere.chiffre
mystere.chiffre: openssl enc'd data with salted password
```

Exemple : déchiffrer un fichier chiffré

```sh
$ openssl enc -d -aes-256-cbc -pbkdf2 -iter 100000 -in mystere.chiffre -out mystere.dechiffre
enter aes-256-cbc decryption password:
```

### Cryptographie à clef publique

Pour résoudre le problème de l'échange de clés, la cryptographie asymétrique a été mise au point dans les années 1970. Elle se base sur le principe de deux clés : une publique permettant le chiffrement et une privée permettant le déchiffrement.

La cryptographie à clef publique remonte à l'article _New directions in cryptography_ (1976) de W. Diffie et M. Hellman.

La cryptographie à clef publique est dite asymétrique car il y a deux clefs de chiffrement (que l'utilisateur qui souhaite recevoir des messages fabrique lui-même), telles que si l'utilisateur utilise une première clef dans un algorithme dit « de chiffrement », la donnée devient inintelligible à tous ceux qui ne possèdent pas la deuxième clef, qui peut retrouver le message initial lorsque cette deuxième clef est donnée en entrée d'un algorithme dit « de déchiffrement ».

Par convention, on appelle la clef de déchiffrement la clef privée et la clef de chiffrement la clef publique. Les clefs sont différentes et ne peuvent se déduire l'une de l'autre. Elles servent à faire des opérations opposées, d'où l'asymétrie entre les opérations de chiffrement et de déchiffrement.

![](./images/chiffrement-asymetrique.png)

Quelques algorithmes de cryptographie asymétrique très utilisés : [RSA](https://fr.wikipedia.org/wiki/Chiffrement_RSA) (chiffrement et signature), DSA (signature), protocole d'échange de clés Diffie-Hellman (échange de clé), ...

> [tl;dr openssl](../tldr/divers/openssl.md)

Pour chiffrer et déchiffrer en utilisant RSA, il faudra tout d’abord créer une paire de clés. Pour cela, on utilise la commande `genrsa` d'`openssl` :

```sh
$ openssl genrsa -out key.pem 1024
```

On obtient une clé privée RSA de 1024 bits dans un fichier `key.pem`. Ce fichier est au format PEM (_Privacy Enhanced Mail_) et codé en [Base64](https://fr.wikipedia.org/wiki/Base64).

On peut voir le contenu :

```sh
$ cat key.pem
```

La commande `rsa` permet de visualiser le contenu d'un fichier au format PEM contenant une paire de clés RSA :

```sh
$ openssl rsa -in key.pem -text -noout
```

Il est recommandé de protéger cette clé par un mot de passe.

On peut utiliser l’algorithme DES3 (les options disponibles sont `-des`, `-des3` ou `-idea`) pour chiffrer le fichier contenant la clé :

```sh
$ openssl rsa -in key.pem -des3 -out key.pem
```

Maintenant, il faut extraire la clé publique pour ensuite la partager. La personne pourra ensuite envoyer des messages chiffrés avec cette clé.

```sh
$ openssl rsa -in key.pem -pubout -out key.pub
```

Pour chiffrer un message avec RSA, on utilise la commande `rsault` avec l’option `-encrypt` d'`openssl` et la clé publique `key.pub`.

```sh
$ openssl rsautl -encrypt -pubin -inkey key.pub -in fichier.txt -out fichier.chiffre
```

Pour déchiffrer un message avec RSA, on utilise la commande `rsault` avec l’option `-decrypt` d'`openssl` et la clé privée `key.pem`.

```sh
$ openssl rsautl -decrypt -inkey key.pem -in fichier.chiffre -out fichier.dechiffre
```

:warning: Le principal inconvénient des algorithmes à clés publiques est leur grande lenteur par rapport aux algorithmes à clés secrètes. Le chiffrement asymétrique ne permet donc pas de chiffrer de gros volumes de données.

### Chiffrement hybride

Le chiffrement hybride permettra de profiter des avantages des deux types de chiffrement (symétrique et asymétrique). En effet, le principe consiste à chiffrer les données avec une clé symétrique puis chiffrer la clé symétrique avec un algortihme asymétrique.

![](images/chiffrement-hybride.png)

## [Cryptanalyse](https://fr.wikipedia.org/wiki/Cryptanalyse)

La [cryptanalyse](https://fr.wikipedia.org/wiki/Cryptanalyse) est la technique qui consiste à déduire un texte en clair d’un texte chiffré sans posséder la clé de chiffrement.

Le processus par lequel on tente de comprendre un message en particulier est appelé une attaque.

Exemple :

La cryptanalyse du système de César est aisée en se basant sur les propriétés statistiques de la langue française (en français, le `e` est la lettre la plus fréquente et le `w` la moins fréquente).

Fréquence des caractères en français :

```sh
$ cat frequence-fr-pourcentage.txt
a 8.498
b 1.247
c 3.553
d 2.324
e 15.774
f 1.362
g 1.574
h 0.976
i 9.800
j 0.184
k 0.035
l 3.684
m 2.432
n 7.843
o 5.901
p 2.530
q 0.467
r 9.995
s 8.267
t 7.169
u 3.671
v 1.143
w 0.008
x 0.313
y 0.278
z 0.971

# Les 5 caractères les moins et plus fréquents
$ cat frequence-fr.txt | sort -t ' ' -k 2.1g -r | awk 'NR<6 || NR>21 {print $0};'
w 0.08
k 0.35
j 1.84
y 2.78
x 3.13
s 82.67
a 84.98
i 98.00
r 99.95
e 157.74
```

## [Stéganographie](https://fr.wikipedia.org/wiki/St%C3%A9ganographie)

La [stéganographie](https://fr.wikipedia.org/wiki/St%C3%A9ganographie) est l'art de la dissimulation : son objet est de faire passer inaperçu un message dans un autre message.

À ne pas confondre avec la cryptographie (« art du secret ») qui cherche à rendre un message inintelligible à autre que qui-de-droit.

Pour prendre une métaphore, la stéganographie consisterait à enterrer son argent dans son jardin là où la cryptographie consisterait à l'enfermer dans un coffre-fort. Cela dit, rien n'empêche de combiner les deux techniques, de même que l'on peut enterrer un coffre dans son jardin.

Voir aussi :

- [www.spammimic.com](https://www.spammimic.com/)
- [steghide](http://steghide.sourceforge.net/), [spectrology](https://github.com/solusipse/spectrology), [zsteg](https://github.com/zed-0xff/zsteg), [stegsnow](http://manpages.ubuntu.com/manpages/bionic/man1/stegsnow.1.html), ...

## [Signature numérique](https://fr.wikipedia.org/wiki/Signature_num%C3%A9rique)

La signature numérique est un mécanisme permettant de garantir la non-répudiation d'un document électronique et d'en authentifier l'auteur, par analogie avec la signature manuscrite d'un document papier.

### Fonction de hachage

Une [fonction de hachage](https://fr.wikipedia.org/wiki/Fonction_de_hachage) est une fonction qui convertit un grand ensemble en un plus petit ensemble, l'**empreinte**. Il est impossible de la déchiffrer pour revenir à l'ensemble d'origine, ce n'est donc pas une technique de chiffrement. L'empreinte d'un message ne dépasse généralement pas 256 bits (maximum 512 bits pour SHA-512) et permet de vérifier son intégrité.

Quelques fonctions de hachage très utilisées : [MD5](https://fr.wikipedia.org/wiki/MD5), [SHA-1](https://fr.wikipedia.org/wiki/SHA-1) et SHA-256, ....

Voir aussi : [Salage](https://fr.wikipedia.org/wiki/Fonction_de_hachage#Salage)

### Signature numérique

La cryptographie asymétrique est également utilisée pour assurer l'authenticité d'un message. L'empreinte du message est chiffrée à l'aide de la clé privée et est jointe au message. Les destinataires déchiffrent ensuite le cryptogramme à l'aide de la clé publique et retrouvent normalement l'empreinte. Cela leur assure que l'émetteur est bien l'auteur du message. On parle alors de [signature numérique](https://fr.wikipedia.org/wiki/Signature_num%C3%A9rique) (à ne pas confondre avec la signature électronique).

![](images/signature-numerique.png)

Il n’est possible de signer que de petits documents. Pour signer un gros document on calcule d’abord une empreinte de ce document. La commande `dgst` permet de le faire. Par exemple :

```sh
$ openssl dgst -sha256 file.aes > file.aes.hash
```

On génère les clés :

```sh
# génération de la clée privée
$ openssl genrsa -aes256 -out .clePrivee.pem 4096

# génération de la clée publique à partir de la clé privée
$ openssl rsa -in .clePrivee.pem -pubout -out clePublique.pem
```

On signe l’empreinte en utilisant la clé privée. Pour cela, on utilise l’option `-sign` de la commande `rsautl` :

```sh
# signature du fichier lena.png
$ openssl dgst -sha256 -sign .clePrivee.pem -out signature1 lena.png
```

On vérifie la signature avec la clé publique :

```sh
# vérification de la signature
$ openssl dgst -sha256 -verify clePublique.pem -signature signature1 lena.png
Verified OK
```

### [Certificat électronique](https://fr.wikipedia.org/wiki/Certificat_%C3%A9lectronique)

Un certificat électronique est un ensemble de données contenant :

- au moins une clé publique ;
- des informations d'identification, par exemple : nom, localisation, adresse électronique ;
- au moins une [signature numérique](https://fr.wikipedia.org/wiki/Signature_num%C3%A9rique) (construite à partir de la clé privée) ; de fait quand il n'y en a qu'une, l'entité signataire est la seule autorité permettant de prêter confiance (ou non) à l'exactitude des informations du certificat.

![](https://commons.wikimedia.org/wiki/File:Certificat_utilisateur_contenu.png?uselang=fr)

Les certificats électroniques respectent des standards spécifiant leur contenu de façon rigoureuse. Les deux formats les plus utilisés aujourd'hui sont : [X.509](https://fr.wikipedia.org/wiki/X.509) pour les serveurs webs et [OpenPGP](https://fr.wikipedia.org/wiki/OpenPGP) pour le courrier électronique.

Les [autorités de certification](https://fr.wikipedia.org/wiki/Autorit%C3%A9_de_certification) sont des organismes enregistrés et certifiés auprès d'autorités publiques et/ou de gouvernance de l'Internet qui établissent leur viabilité comme intermédiaire fiable. Ces organismes diffusent leurs propres clés publiques. Ils sont en relation avec les principaux producteurs de systèmes d'exploitation et de navigateurs web (tels que Mozilla Firefox, Google Chrome, Microsoft Internet Explorer, etc.) et forment la base de la **chaîne de confiance**.

> Les certificats peuvent être stockés par des [serveurs de clés](https://fr.wikipedia.org/wiki/Serveur_de_cl%C3%A9s).

![](https://commons.wikimedia.org/wiki/File:Certificat_%C3%A9lectronique.svg?uselang=fr)

> Voir aussi : [Vulnérabilités](https://fr.wikipedia.org/wiki/Certificat_%C3%A9lectronique#Vuln%C3%A9rabilit%C3%A9s)

---
©️ LaSalle Avignon - [thierry(dot)vaira(at)gmail(dot)com](thierry.vaira@gmail.com)
