# tldr openssl

[OpenSSL](https://fr.wikipedia.org/wiki/OpenSSL) est une boîte à outils de chiffrement comportant deux bibliothèques `libcrypto` et `libssl`, fournissant respectivement une implémentation des algorithmes cryptographiques et du protocole de communication SSL/TLS, ainsi qu'une interface en ligne de commande, `openssl`.

Le programme `openssl` est un outil en ligne de commande qui permet :

- la création et gestion de clefs publiques et privées, de paramètres ;
- les opérations cryptographiques à clef publique ;
- la création de certificats X.509, CSR et CRL ;
- le calcul de condensés de messages ;
- le chiffrement et le déchiffrement ;
- le test de clients et serveurs SSL/TLS ;
- la gestion de courriers S/MIME signés ou chiffrés ;
- les requêtes, création et vérification de certifications de date.

```sh
$ tldr openssl

  openssl

  OpenSSL Outil en ligne de commande d'OpenSSL
  Les commandes comme `openssl req` ont leur propre documentation
  https://www.openssl.org

  - Affiche la liste des commandes disponibles :
    openssl help

  - Affiche la liste des options d'une commande :
    openssl help enc

  - Affiche la version d'OpenSSL :
    openssl version

  - Affiche le manuel d'openssl :
    man openssl
```

Les commandes principales sont :

- `enc` : Chiffrement (option `-e` pour chiffrer et `-d` pour déchiffrer)
- `genpkey` : Production de clef privée ou de paramètres.
- `pkey` : Gestion de clefs publiques et privées.
- `rsa` : Gestion de clefs RSA

Exemples :

- [Base64](https://fr.wikipedia.org/wiki/Base64) :

```bash
$ echo -n "secret" | openssl enc -e -base64
c2VjcmV0

$ echo "c2VjcmV0" | openssl enc -d -base64
secret
```

- Génération aléatoire d'une chaîne :

```bash
# Générer aléatoirement une chaîne de 32 caractères
$ openssl rand 32
```

- Chiffer/Déchiffrer un fichier avec l'algorithme de chiffrement symétrique AES :

```bash
# Chiffrer
$ openssl enc -e -aes-256-cbc -in fichier -out fichier_secret

# Déchiffrer
$ openssl enc -d -aes-256-cbc -in fichier_secret -out nouveau_fichier
```

---
©️ LaSalle Avignon - [thierry(dot)vaira(at)gmail(dot)com](thierry.vaira@gmail.com)
