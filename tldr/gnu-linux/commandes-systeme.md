# Commandes système (GNU/Linux)

Ce document présente quelques commandes système.

- [Commandes système (GNU/Linux)](#commandes-système-gnulinux)
  - [Informations](#informations)
    - [`hostname` : Affiche et modifie le nom de la machine](#hostname--affiche-et-modifie-le-nom-de-la-machine)
    - [`uname` : Affiche des informations sur le système](#uname--affiche-des-informations-sur-le-système)
    - [`dmesg` : Affiche les messages du noyau](#dmesg--affiche-les-messages-du-noyau)
    - [`df` : Indique l'espace occupé par les systèmes de fichiers](#df--indique-lespace-occupé-par-les-systèmes-de-fichiers)
    - [CPU et mémoires](#cpu-et-mémoires)
  - [Matériels](#matériels)
    - [`lsblk` : Liste des informations sur les périphériques de type bloc](#lsblk--liste-des-informations-sur-les-périphériques-de-type-bloc)
    - [`blkid` : Affiche des informations sur les périphériques de type bloc](#blkid--affiche-des-informations-sur-les-périphériques-de-type-bloc)
    - [`lshw` : Liste tous les périphériques matériels](#lshw--liste-tous-les-périphériques-matériels)
    - [`dmidecode` : Affiche des informations du BIOS](#dmidecode--affiche-des-informations-du-bios)
    - [`lspci` : Liste tous les périphériques PCI](#lspci--liste-tous-les-périphériques-pci)
    - [`lsusb` : Liste tous les périphériques USB](#lsusb--liste-tous-les-périphériques-usb)
    - [`smartctl` : Surveille la santé des disques](#smartctl--surveille-la-santé-des-disques)
  - [Paquets](#paquets)
    - [`dpkg` : Gestion des paquets Debian](#dpkg--gestion-des-paquets-debian)
    - [`apt` : Utilitaire de gestion des paquets pour les distributions basées sur Debian](#apt--utilitaire-de-gestion-des-paquets-pour-les-distributions-basées-sur-debian)
  - [Fichiers et répertoires](#fichiers-et-répertoires)
    - [`chmod` : Modifie les droits d'accès d'un fichier ou d'un répertoire](#chmod--modifie-les-droits-daccès-dun-fichier-ou-dun-répertoire)
    - [`chown` : Modifie l'utilisateur et le groupe propriétaire des fichiers et répertoires](#chown--modifie-lutilisateur-et-le-groupe-propriétaire-des-fichiers-et-répertoires)
    - [`chgrp` : Change la propriété de groupe des fichiers et des répertoires](#chgrp--change-la-propriété-de-groupe-des-fichiers-et-des-répertoires)
    - [`umask` : Définit le masque de création de fichiers et répertoires](#umask--définit-le-masque-de-création-de-fichiers-et-répertoires)
    - [`getfacl` et `getfacl` : Contrôle la liste de contrôle d'accès](#getfacl-et-getfacl--contrôle-la-liste-de-contrôle-daccès)
    - [`dd` : Copie conforme et sélective de données de fichiers](#dd--copie-conforme-et-sélective-de-données-de-fichiers)
    - [`lsof` : Liste les fichiers ouverts](#lsof-liste-les-fichiers-ouverts)
    - [`wget` : Télécharge des fichiers](#wget--télécharge-des-fichiers)
  - [Système de fichiers](#système-de-fichiers)
    - [`fdisk` : Gère les partition d'un disque](#fdisk--gère-les-partition-dun-disque)
    - [`mkfs` : Crée (i.e. formate) un système de fichiers](#mkfs--crée-ie-formate-un-système-de-fichiers)
    - [`tune2fs` : Modifie les paramètres des systèmes de fichiers ext2/ext3/ext4](#tune2fs--modifie-les-paramètres-des-systèmes-de-fichiers-ext2ext3ext4)
    - [`fsck` : Vérifie et répare les systèmes de fichiers ext2/ext3/ext4](#fsck--vérifie-et-répare-les-systèmes-de-fichiers-ext2ext3ext4)
    - [`dumpe2fs` : Dumpe les systèmes de fichiers ext2/ext3/ext4](#dumpe2fs--dumpe-les-systèmes-de-fichiers-ext2ext3ext4)
    - [`debugfs` : Débogue les systèmes de fichiers ext2/ext3/ext4](#debugfs--débogue-les-systèmes-de-fichiers-ext2ext3ext4)
    - [`mount` : Monte un système de fichiers](#mount--monte-un-système-de-fichiers)
    - [`tar` : Archive des fichiers et répertoires](#tar--archive-des-fichiers-et-répertoires)
    - [`gzip` : Compresse et décompresse des fichiers](#gzip--compresse-et-décompresse-des-fichiers)
    - [`ddrescue` : Copie les données d'un fichier ou d'un disque vers un autre](#ddrescue--copie-les-données-dun-fichier-ou-dun-disque-vers-un-autre)
    - [`testdisk` : Répare et récupère des systèmes de fichiers](#testdisk--répare-et-récupère-des-systèmes-de-fichiers)
    - [`filefrag` : Indique la fragmentation des fichiers](#filefrag--indique-la-fragmentation-des-fichiers)
    - [`shred` : Écrit par dessus un fichier pour en camoufler le contenu, et optionnellement l'effacer](#shred--écrit-par-dessus-un-fichier-pour-en-camoufler-le-contenu-et-optionnellement-leffacer)
  - [Processus](#processus)
    - [`ps` : Affiche les processus en cours d'exécution](#ps-affiche-les-processus-en-cours-dexécution)
    - [`pidof` : Trouve le PID d'un programme](#pidof-trouve-le-pid-dun-programme)
    - [`kill` : Envoie un signal à un processus](#kill-envoie-un-signal-à-un-processus)
    - [`which` : Localise un programme](#which--localise-un-programme)
    - [`fuser` : identifier les processus qui utilisent des fichiers ou des sockets](#fuser-identifier-les-processus-qui-utilisent-des-fichiers-ou-des-sockets)
    - [`env` : Exécute un programme dans un environnement modifié](#env--exécute-un-programme-dans-un-environnement-modifié)
    - [`chroot`  : Exécute une commande dans un shell avec un répertoire racine](#chroot---exécute-une-commande-dans-un-shell-avec-un-répertoire-racine)
    - [`cron`  : Planifie les tâches pour qu'elles s'exécutent sur un intervalle de temps](#cron---planifie-les-tâches-pour-quelles-sexécutent-sur-un-intervalle-de-temps)
    - [`at`  : Exécute des commandes à des temps détermintés](#at---exécute-des-commandes-à-des-temps-détermintés)
    - [`watch`  : Exécute une commande périodiquement](#watch---exécute-une-commande-périodiquement)
    - [`batch`  : Exécute une commande lorsque la charge du système le permet](#batch---exécute-une-commande-lorsque-la-charge-du-système-le-permet)
  - [Utilisateurs](#utilisateurs)
    - [`useradd` : Crée un nouvel utilisateur ou modifie les informations par défaut appliquées aux nouveaux utilisateurs](#useradd--crée-un-nouvel-utilisateur-ou-modifie-les-informations-par-défaut-appliquées-aux-nouveaux-utilisateurs)
    - [`usermod` : Modifie un compte utilisateur](#usermod--modifie-un-compte-utilisateur)
    - [`userdel` : Supprime un compte utilisateur (et les fichiers associés)](#userdel--supprime-un-compte-utilisateur-et-les-fichiers-associés)
    - [`passwd` : Modifie le mot de passe d'un utilisateur](#passwd--modifie-le-mot-de-passe-dun-utilisateur)
    - [`chage` : Modifie les informations de validité d'un mot de passe](#chage--modifie-les-informations-de-validité-dun-mot-de-passe)
    - [`su` : Exécute une commande avec un UID et un GID de substitution](#su--exécute-une-commande-avec-un-uid-et-un-gid-de-substitution)
    - [`sudo` : Exécute une commande en tant qu'un autre utilisateur](#sudo--exécute-une-commande-en-tant-quun-autre-utilisateur)
    - [`finger` : Affiche des informations sur les utilisateurs connectés](#finger--affiche-des-informations-sur-les-utilisateurs-connectés)
    - [`w` : Affiche les utilisateurs connectés et leur activité](#w--affiche-les-utilisateurs-connectés-et-leur-activité)
    - [`who` : Affiche qui est connecté](#who--affiche-qui-est-connecté)
    - [`getent` : Récupére des entrées depuis les base de données NSS](#getent--récupére-des-entrées-depuis-les-base-de-données-nss)
  - [Environnement de travail](#environnement-de-travail)
    - [`id` : Affiche les identifiants d'utilisateur et de groupe](#id--affiche-les-identifiants-dutilisateur-et-de-groupe)
  - [Utilisation du système](#utilisation-du-système)
    - [`shutdown` : Arrête, éteint ou redémarre la machine](#shutdown--arrête-éteint-ou-redémarre-la-machine)
    - [`date` : Affiche ou configure la date et l'heure du système](#date--affiche-ou-configure-la-date-et-lheure-du-système)
    - [`uptime` : Indique depuis quand le système a été mis en route](#uptime--indique-depuis-quand-le-système-a-été-mis-en-route)
    - [`top` : Affiche en temps réel les processus en cours d'exécution](#top--affiche-en-temps-réel-les-processus-en-cours-dexécution)
    - [`free` : Affiche la quantité de mémoire libre et utilisée du système](#free--affiche-la-quantité-de-mémoire-libre-et-utilisée-du-système)
    - [`vmstat` : Affiche des statistiques sur la mémoire virtuelle](#vmstat--affiche-des-statistiques-sur-la-mémoire-virtuelle)
    - [`history` : Affiche l'historique des commandes](#history--affiche-lhistorique-des-commandes)
    - [`time` : Lance des programmes et résume leur utilisation des ressources du système](#time--lance-des-programmes-et-résume-leur-utilisation-des-ressources-du-système)
---
> « Voici [la philosophie d'Unix](https://fr.wikipedia.org/wiki/Philosophie_d%27Unix) :
>   Écrivez des programmes qui effectuent une seule chose et qui le font bien.
>   Écrivez des programmes qui collaborent.
>   Écrivez des programmes pour gérer des flux de texte, car c'est une interface universelle. »
> Ce qui est souvent résumé par : « Ne faire qu'une seule chose, et la faire bien. ».
---

Lien : https://linuxcommandlibrary.com/

## Informations

### `hostname` : Affiche et modifie le nom de la machine

```bash
$ hostname
sedatech

$ cat /etc/hostname
sedatech

$ hostname -i
127.0.1.1
$ hostname -I
192.168.1.12 192.168.122.1 fd10:784b:2aa3:be52:22ed:746a:3617:34ef fd10:784b:2aa3:be52:3035:9463:6413:4381

$ cat /etc/hosts
127.0.0.1	localhost
127.0.1.1	sedatech

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
```

Voir aussi : `domainname` et `dnsdomainname`

### `uname` : Affiche des informations sur le système

```bash
$ uname -a
Linux sedatech 5.19.0-32-generic #33~22.04.1-Ubuntu SMP PREEMPT_DYNAMIC Mon Jan 30 17:03:34 UTC 2 x86_64 x86_64 x86_64 GNU/Linux
```

Voir aussi :

```bash
$ cat /etc/os-release
PRETTY_NAME="Ubuntu 22.04.2 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.2 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy

$ cat /etc/lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=22.04
DISTRIB_CODENAME=jammy
DISTRIB_DESCRIPTION="Ubuntu 22.04.2 LTS"

$ cat /etc/issue
Ubuntu 22.04.2 LTS \n \l
```

### `dmesg` : Affiche les messages du noyau

  - Affiche les messages depuis le démarrage :
    `dmesg`

  - Affiche en temps réel (vois aussi `--follow-new`) :
    `dmesg --follow`

  - Efface les messages :
    `dmesg --clear`

  - Affiche les messages lisible pour un humain :
    `dmesg -H`

### `df` : Indique l'espace occupé par les systèmes de fichiers

  - Affiche tous les systèmes de fichiers :
    `df -a`

  - Affiche les tailles en puissances de 1000 (i.e. `--si`) :
    `df -H`

  - Affiche les systèmes de fichiers locaux :
    `df -l`

### CPU et mémoires

```bash
$ cat /proc/cpuinfo
$ cat /proc/cpuinfo | grep -e "^\(vendor_id\|model name\|cpu\)"
$ cat /proc/meminfo
$ cat /proc/mtrr
```

## Matériels

### `lsblk` : Liste des informations sur les périphériques de type bloc

### `blkid` : Affiche des informations sur les périphériques de type bloc

### `lshw` : Liste tous les périphériques matériels

  - Format court :
    `sudo lshw -short`

  - Prériphérique de stockage :
    `sudo lshw -class disk -class storage -short`

  - Interface réseaux vers un fichier HTML :
    `sudo lshw -class network -html > interfaces.html`

### `dmidecode` : Affiche des informations du BIOS

  - Tout :
    `sudo dmidecode`

  - LA version du BIOS :
    `sudo dmidecode -s bios-version`

  - Informations du BIOS :
    `sudo dmidecode -t bios`

  - Processeur :
    `sudo dmidecode -t processor`

  - Mémoire :
    `sudo dmidecode -t memory`

### `lspci` : Liste tous les périphériques PCI

  - Tout :
    `lspci`

  - Avec des informations supplémentaires (mode verbeux, _verbose_):
    `lspci -v`

  - Pilotes de périphériques (_drivers_) :
    `lspci -k`

### `lsusb` : Liste tous les périphériques USB

  - Tout ::
    `lsusb`

  - Sous forme d'arborescence :
    `lsusb -t`

  - Avec des informations supplémentaires (mode verbeux, _verbose_):
    `lsusb --verbose`

Voir aussi : `lsscsi`

### `smartctl` : Surveille la santé des disques

Plus d'informations : https://www.smartmontools.org.

  - Display SMART health summary:
    `sudo smartctl --health /dev/sdX`

  - Display device information:
    `sudo smartctl --info /dev/sdX`

  - Start a short self-test in the background:
    `sudo smartctl --test short /dev/sdX`

  - Display current/last self-test status and other SMART capabilities:
    `sudo smartctl --capabilities /dev/sdX`

  - Display exhaustive SMART data:
    `sudo smartctl --all /dev/sdX`

## Paquets

### `dpkg` : Gestion des paquets Debian

  - Installe un paquet :
    `dpkg -i path/to/file.deb`

  - Supprime un paquet :
    `dpkg -r package_name`

  - Liste les paquets installés :
    `dpkg -l` ou `dpkg -l pattern`

  - Liste le contenu d'un paquet installé :
    `dpkg -L package_name`

  - Liste le contenu d'un paquet :
    `dpkg -c path/to/file.deb`

  - Découvre à quel paquet appartient un fichier :
    `dpkg -S filename`

### `apt` : Utilitaire de gestion des paquets pour les distributions basées sur Debian

  - Mettre à jour la liste des paquets et des versions disponibles (il est recommandé de l'exécuter avant les autres commandes `apt`) :
    `sudo apt update`

  - Mettre à jour tous les paquets installés vers les dernières versions disponibles :
    `sudo apt upgrade`

  - Recherche d'un paquet donné :
    `apt search package`

  - Afficher les informations pour un paquet :
    `apt show package`

  - Installer un paquet, ou le mettre à jour avec la dernière version disponible :
    `sudo apt install package`

  - Supprimer un paquet (utiliser `purge` à la place supprime également ses fichiers de configuration) :
    `sudo apt remove package`

  - Lister tous les paquets :
    `apt list`

  - Lister les paquets installés :
    `apt list --installed`

## Fichiers et répertoires

### `chmod` : Modifie les droits d'accès d'un fichier ou d'un répertoire

  - Donne les droits d'e[x]écution à l'[u]tilisateur auquel le fichier appartient :
    `chmod u+x chemin/vers/fichier`

  - Donne à l'[u]tilisateur les droits de lecture [r] et d'écriture [w] sur un fichier/répertoire :
    `chmod u+rw chemin/vers/fichier_ou_répertoire`

  - Enlève les droits d'e[x]écution pour le [g]roupe :
    `chmod g-x chemin/vers/fichier`

  - Donne à tous [a] les utilisateurs les droits de lecture [r] et d'e[x]écution :
    `chmod a+rx chemin/vers/fichier`

  - Donne aux autres [o] utilisateurs (qui sont dans un autre groupe) les mêmes droits que ceux du [g]roupe propriétaire :
    `chmod o=g chemin/vers/fichier`

  - Retire tous les droits aux autres [o] utilisateurs :
    `chmod o= chemin/vers/fichier` ou `chmod 000 chemin/vers/fichier`

  - Modifie les permissions récursivement en donnant aux membres du [g]roupe et aux autres [o] utilisateurs le droit d'écriture [w] :
    `chmod -R g+w,o+w chemin/vers/répertoire`

Voir aussi : les bits Sicky bit, setuid et setgid, `lsattr` et `chattr`, `getfacl` et `setfacl`

### `chown` : Modifie l'utilisateur et le groupe propriétaire des fichiers et répertoires

  - Modifie le propriétaire d'un fichier/dossier :
    `chown utilisateur chemin/vers/fichier_ou_dossier`

  - Modifie l'utilisateur et le groupe propriétaire d'un fichier/dossier :
    `chown utilisateur:groupe chemin/vers/fichier_ou_dossier`

  - Modifie récursivement le propriétaire d'un dossier et de son contenu :
    `chown -R utilisateur chemin/vers/dossier`

### `chgrp` : Change la propriété de groupe des fichiers et des répertoires

  - Change le groupe propriétaire d'un fichier/répertoire :
    `chgrp groupe chemin/vers/fichier_ou_répertoire`

  - Change récursivement le groupe propriétaire d'un répertoire et de son contenu :
    `chgrp -R groupe chemin/vers/répertoire`

  - Change le groupe propriétaire d'un lien symbolique :
    `chgrp -h groupe chemin/vers/lien_symbolique`

### `umask` : Définit le masque de création de fichiers et répertoires

  - Affiche le masque en octal :
    `umask`

  - Affiche le masque en littéral :
    `umask -S`

  - Change le masque pour autoriser le droit de lecture pour tout le monde (les autres bits du masque sont inchangés) :
    `umask a+r`

  - Fixe le masque (tous les droits pour le propriétaire et aucun pour le reste) :
    `umask 077`

### `getfacl` et `getfacl` : Contrôle la liste de contrôle d'accès

Les [ACL](https://fr.wikipedia.org/wiki/Access_Control_List) (_Access Control List (_) permettent d'appliquer à n'importe quel utilisateur, ou groupe, un des trois droits (lecture, écriture et exécution) et cela sans être limité par le nombre d'utilisateurs que l'on veut ajouter.

  - Affiche la liste de contrôle d'accès :
    `getfacl path/to/file_or_directory` ou `getfacl -t path/to/file_or_directory`

  - Modifie l'ACL d'un utilisateur pour un fichier en lecteure/écriture :
    `setfacl -m u:username:rw file`

  - Modifie l'ACL par défaut de tous les utilisateurs pour un fichier :
    `setfacl -d -m u::rw file`

  - Retire l'ACL d'un utilisateur pour un fichier :
    `setfacl -x u:username file`

### `dd` : Copie conforme et sélective de données de fichiers

`dd` est une commande Unix permettant de copier un fichier (avec ou sans conversion) en ne sélectionnant qu'une partie de données à copier.

Les deux principales options de `dd` sont :

- `if` (_input file_) : le fichier en entrée (un fichier régulier ou un périphérique de type bloc)
- `of` (_output file_) : le fichier en sortie (un fichier régulier ou un périphérique de type bloc)

> L'option `status=progress` permet d'afficher la progression de la copie

Sinon les principales options sont les suivantes :

- `bs` (_block size_) : copie les données par blocs de n octets
- `count` : ne copie que n blocs ;
- `skip` : ignore les n premiers blocs du fichier d'entrée
- `seek` : ignore les n premiers blocs du fichier de sortie
- `conv` : pour les conversions

Exemples :

  - Crée une clé USB bootable :
    `dd if=path/to/file.iso of=/dev/usb_drive`

  - Clone un disque (ou une partition) vers un autre  :
    `dd if=/dev/source_drive of=/dev/dest_drive bs=4M conv=noerror`

  - Crée une image d'un disque (ou d'une partition) :
    `dd if=/dev/drive_device of=path/to/file.img`

  - Restore une image vers un disque (ou une partition) :
    `dd if=path/to/file.img of=/dev/drive_device`

  - Crée un fichier avec un contenu (utilisé aussi pour les benchmarks en écriture) :
    `dd if=/dev/zero of=path/to/file_1GB bs=1024 count=1000000`
    `dd if=/dev/urandom of=path/to/file_1MB bs=1k count=1000`

Voir aussi : `cpio`

### `lsof` : Liste les fichiers ouverts

Afficher les processus ayant une activité réseau :

```sh
# lsof -Pnl +M -i4
COMMAND     PID     USER   FD   TYPE   DEVICE SIZE/OFF NODE NAME
cupsd      1270        0    6u  IPv4     8867      0t0  TCP *:631 (LISTEN)
cupsd      1270        0    9u  IPv4     8871      0t0  UDP *:631
...
nmbd       2383        0   10u  IPv4    11175      0t0  UDP *:137
nmbd       2383        0   11u  IPv4    11176      0t0  UDP *:138
nmbd       2383        0   12u  IPv4    11178      0t0  UDP 192.168.52.2:137
nmbd       2383        0   13u  IPv4    11179      0t0  UDP 192.168.52.255:137
nmbd       2383        0   14u  IPv4    11180      0t0  UDP 192.168.52.2:138
nmbd       2383        0   15u  IPv4    11181      0t0  UDP 192.168.52.255:138
firefox   17822      500   25u  IPv4 14346042      0t0  TCP 192.168.52.2:60559->75.126.153.206:80 (ESTABLISHED)
```

Afficher les fichiers ouverts par un processus :

```sh
# lsof -p PID
```

Afficher les fichiers dont l'adresse Internet correspond à l'adresse spécifiée :

> Adresse sous la forme : [46][protocole][@nom_hôte|adresse_hôte][:service|port]

```sh
# lsof -i@192.168.52.2
```

### `wget` : Télécharge des fichiers

Voir aussi : `curl`

## Système de fichiers

### `fdisk` : Gère les partition d'un disque

  - Liste les partitions :
    `sudo fdisk -l`

  - Démarre le partitionnement :
    `sudo fdisk /dev/sdX`

Voir aussi : `cfdisk`, `sfdisk`, `parted`

### `mkfs` : Crée (i.e. formate) un système de fichiers

  - Système de fichier ext2 :
    `mkfs path/to/partition`

  - Système de fichier ext4 :
    `mkfs -t ext4 path/to/partition`

Voir aussi : `mke2fs`, `e2fsck`, `tune2fs`, `dumpe2fs`

### `tune2fs` : Modifie les paramètres des systèmes de fichiers ext2/ext3/ext4

  - Affiche du superbloc :
    `# tune2fs -l /dev/sdXn`

### `fsck` : Vérifie et répare les systèmes de fichiers ext2/ext3/ext4

### `dumpe2fs` : Dumpe les systèmes de fichiers ext2/ext3/ext4

  - Affiche des informations sur le superbloc et les groupes de blocs :
   `# dumpe2fs /dev/sdXn`

### `debugfs` : Débogue les systèmes de fichiers ext2/ext3/ext4

  - Affiche les informations complètes contenues dans un inode `ID` (`ls -i ...`) :
    `# echo "stat <ID>" | debugfs /dev/sdXn`

Voir aussi : `stats`, `stat`

### `mount` : Monte un système de fichiers

  - Affiche tous les systèmes de fichiers montés (`/etc/mtab`) :
    `mount`

  - Mounte un système de fichiers dans un répertoire :
    `mount -t filesystem_type path/to/device_file path/to/target_directory`

  - Mounte un système de fichiers dans un répertoire pour un utilisateur spécifique :
    `mount -o uid=user_id,gid=group_id path/to/device_file path/to/target_directory`

  - Monte tous les systèmes de fichiers définis dans `/etc/fstab`:
    `mount -a`

  - Mounte un système de fichiers défini dans `/etc/fstab` :
    `mount /my_drive`

  - Mounte un répertoire dans un autre répertoire :
    `mount --bind path/to/old_dir path/to/new_dir`

Voir aussi : `umount`

### `tar` : Archive des fichiers et répertoires

> Souvent combiné avec une méthode de compression (`gzip` ou `bzip2`) pour fournir une archive compressée

  - Crée une archive à partir de fichiers :
    `tar cf chemin/vers/cible.tar chemin/vers/fichier1 chemin/vers/fichier2 ...`

  - Crée une archive gzip à partir de fichiers :
    `tar czf chemin/vers/cible.tar.gz chemin/vers/fichier1 chemin/vers/fichier2 ...`

  - Crée une archive gzip à partir d'un répertoire en utilisant son chemin relatif :
    `tar czf chemin/vers/cible.tar.gz --directory=chemin/vers/répertoire .`

  - Extrait une archive (compressée) dans le dossier courant en affichant la liste des fichiers traités :
    `tar xvf chemin/vers/source.tar[.gz|.bz2|.xz]`

  - Extrait une archive (compressée) dans un répertoire cible :
    `tar xf chemin/vers/source.tar[.gz|.bz2|.xz] --directory=répertoire`

  - Liste les fichiers contenus dans une archive tar :
    `tar tvf chemin/vers/source.tar`

### `gzip` : Compresse et décompresse des fichiers

  - Compresse un fichier et le remplace :
    `gzip file.ext`

  - Décompresse un fichier et le remplace :
    `gzip -d file.ext.gz`

  - Compresse un fichier vers un fichier de sortie :
    `gzip -c file.ext > compressed_file.ext.gz`

  - Decompresse un fichier vers un fichier de sortie :
    `gzip -c -d file.ext.gz > uncompressed_file.ext`

  - Compresse en spécifiant un niveau de `1` (rapide mais mauvais) à `9` (rapide mais meilleur), par défaut `6` :
    `gzip -9 -c file.ext > compressed_file.ext.gz`

Voir aussi : `gunzip`, `zcat`, `bzip2`, `bzip2recover`, ...

### `ddrescue` : Copie les données d'un fichier ou d'un disque vers un autre

Plus d'informations : https://doc.ubuntu-fr.org/ddrescue

  - Crée une image d'un disque (avec un fichier de _log_) :
    `sudo ddrescue /dev/sdb path/to/image.dd path/to/log.txt`

  - Clone un disque vers un autre (avec un fichier de _log_) :
    `sudo ddrescue --force --no-scrape /dev/sdX /dev/sdY path/to/log.txt`

### `testdisk` : Répare et récupère des systèmes de fichiers

### `filefrag` : Indique la fragmentation des fichiers

### `shred` : Écrit par dessus un fichier pour en camoufler le contenu, et optionnellement l'effacer

## Processus

### `ps` : Affiche les processus en cours d'exécution

  - Affiche tous les processus du système  :
    `ps axu`

  - Affiche une arborescence des processus :
    `ps axjf`

  - Affiche des renseignements sur les processus légers (« _threads_ ») :
    `ps axms`

  - Affiche une arborescence des processus :
    `ps axjf`

Voir aussi : `pstree`, `top`, `pgrep`

### `pidof` : Trouve le PID d'un programme

```sh
$ pidof bash
10156 5907 4183
```

### `kill` : Envoie un signal à un processus

  - Termine un procesus :
    `kill -15 PID`

  - Tue un processus :
    `kill -9 PID`

```sh
$ kill -l
 1) SIGHUP	 2) SIGINT	 3) SIGQUIT	 4) SIGILL	 5) SIGTRAP
 6) SIGABRT	 7) SIGBUS	 8) SIGFPE	 9) SIGKILL	10) SIGUSR1
11) SIGSEGV	12) SIGUSR2	13) SIGPIPE	14) SIGALRM	15) SIGTERM
16) SIGSTKFLT	17) SIGCHLD	18) SIGCONT	19) SIGSTOP	20) SIGTSTP
21) SIGTTIN	22) SIGTTOU	23) SIGURG	24) SIGXCPU	25) SIGXFSZ
26) SIGVTALRM	27) SIGPROF	28) SIGWINCH	29) SIGIO	30) SIGPWR
31) SIGSYS	34) SIGRTMIN	35) SIGRTMIN+1	36) SIGRTMIN+2	37) SIGRTMIN+3
38) SIGRTMIN+4	39) SIGRTMIN+5	40) SIGRTMIN+6	41) SIGRTMIN+7	42) SIGRTMIN+8
43) SIGRTMIN+9	44) SIGRTMIN+10	45) SIGRTMIN+11	46) SIGRTMIN+12	47) SIGRTMIN+13
48) SIGRTMIN+14	49) SIGRTMIN+15	50) SIGRTMAX-14	51) SIGRTMAX-13	52) SIGRTMAX-12
53) SIGRTMAX-11	54) SIGRTMAX-10	55) SIGRTMAX-9	56) SIGRTMAX-8	57) SIGRTMAX-7
58) SIGRTMAX-6	59) SIGRTMAX-5	60) SIGRTMAX-4	61) SIGRTMAX-3	62) SIGRTMAX-2
63) SIGRTMAX-1	64) SIGRTMAX
```

Voir aussi : `killall`

### `which` : Localise un programme

`which`  utilise la variable d'environnement « PATH » de la session de l'utilisateur.

  - Affiche l'emplacement des programmes exécutables correspondants à la requête :
    `which exécutable`

  - Affiche tous les exécutables correspondants à la requête, s'il y en a plus qu'un :
    `which -a exécutable`

Voir aussi les commandes : `command -v`, `locate`, `whence`, `whereis`, `typr -p`, ...

### `fuser` : identifier les processus qui utilisent des fichiers ou des sockets

Afficher la liste des PID utilisant un service|port/protocole :

```sh
# fuser http/tcp
# fuser 80/tcp
```

Chercher des sockets IPv4 seulement (-4,--ipv4) :

> Syntaxe : noms udp/tcp: [port_local][,[hôte_distant][,[port_distant]]]

```sh
# fuser -4 -v -n tcp ,
```

### `env` : Exécute un programme dans un environnement modifié

### `chroot`  : Exécute une commande dans un shell avec un répertoire racine

  - Exécute la commande en tant que nouveau répertoire racine :
    `chroot chemin/vers/nouveau/répertoire/racine command`

### `cron`  : Planifie les tâches pour qu'elles s'exécutent sur un intervalle de temps

  - Édite le fichier `/etc/crontab` :
    `crontab -e` ou `sudo crontab -e -u user`

  - Visualise la liste des tâches planifiées :
    `crontab -l`

  - Supprime toutes les tâches planifiées :
    crontab -r

  - Exemple de tâche qui s'exécute à 10h00 tous les jours :
    `0 10 * * * command_to_execute`

Voir aussi : `man -a crontab`

### `at`  : Exécute des commandes à des temps détermintés

  - Exécute un script à un temps donné :
    `at hh:mm -f chemin/vers/le/script`

  - Affiche une notification système à 23 heures le 18 Février :
    `echo "notify-send 'Debout !'" | at 11pm Feb 18`

### `watch`  : Exécute une commande périodiquement

  - Affiche les processus toutes les 3 secondes :
    `watch -n 3 "ps aux"`

  - Liste le contenu du répertoire courant lorsqu'il y a un changement :
    `watch -d ls -l`

### `batch`  : Exécute une commande lorsque la charge du système le permet

`batch -f path/to/file`

## Utilisateurs

### `useradd` : Crée un nouvel utilisateur ou modifie les informations par défaut appliquées aux nouveaux utilisateurs

  - Crée un nouvel utilisateur :
    `sudo useradd nom_utilisateur`

  - Crée un nouvel utilisateur en spéficiant un identifiant numérique particulier :
    `sudo useradd --uid identifiant nom_utilisateur`

  - Crée un nouvel utilisateur avec le shell spécifié :
    `sudo useradd --shell chemin/vers/shell nom_utilisateur`

  - Crée un nouvel utilisateur qui appartient aux groupes supplémentaires (attention à l'omission des espaces) :
    `sudo useradd --groups groupe1,groupe2,... nom_utilisateur`

  - Crée un nouvel utilisateur avec le répertoire personnel par défaut :
    `sudo useradd --create-home nom_utilisateur`

  - Crée un nouvel utilisateur avec un répertoire personnel rempli par les fichiers et répertoires d'un répertoire squelette :
    `sudo useradd --skel chemin/vers/repertoire_squelette --create-home nom_utilisateur`

  - Crée un nouvel utilisateur système sans répertoire personnel :
    `sudo useradd --system nom_utilisateur`

Voir aussi : `newusers`, `groupadd`, `adduser`, `addgroup`

### `usermod` : Modifie un compte utilisateur

  - Change le nom d'un utilisateur :
    `sudo usermod --login nouveau_nom nom_utilisateur`

  - Modifie l'identifiant numérique d'un utilisateur :
    `sudo usermod --uid identifiant nom_utilisateur`

  - Change le shell d'un utilisateur :
    `sudo usermod --shell chemin/vers/shell nom_utilisateur`

  - Ajoute l'utilisateur à des groupes supplémentaires (attention à l'omission d'espaces) :
    `sudo usermod --append --groups groupe1,groupe2,... nom_utilisateur`

  - Change le répertoire personnel d'un utilisateur et déplace ses fichiers vers celui-ci :
    `sudo usermod --move-home --home chemin/vers/nouveau_répertoire nom_utilisateur`

Voir aussi : `groupmod`, `chfn`, `chsh`

### `userdel` : Supprime un compte utilisateur (et les fichiers associés)

  - Supprime un utilisateur :
    `sudo userdel nom_utilisateur`

  - Supprime un utilisateur, son répertoire personnel ainsi que son répertoire d'attente des courriels :
    `sudo userdel --remove nom_utilisateur`

Voir aussi : `groupdel`, `deluser`, `delgroup`

### `passwd` : Modifie le mot de passe d'un utilisateur

  - Change le mot de passe d'un utilisateur particulier :
    `passwd utilisateur`

  - Affiche l'état actuel du compte utilisateur :
    `passwd -S`

  - Supprime le mot de passe de l'utilisateur (supprime l'authentification par mot de passe pour l'utilisateur indiqué) :
    `passwd -d`

Voir aussi : `chage`, `login.defs`

### `chage` : Modifie les informations de validité d'un mot de passe

  - Affiche les informations pour un utilisateur :
    `chage --list username`

  - Active l'expiration du mot de passe dans 10 jours :
    `sudo chage --maxdays 10 username`

  - Désactive l'expiration du mot de passe :
    `sudo chage --maxdays -1 username`

  - Change la date d'expiration du compte :
    `sudo chage --expiredate YYYY-MM-DD username`

  - Force un utilisateur à changer son mot de passe à la prochaine connexion :
    `sudo chage --lastday 0 username`

Voir aussi : `passwd`, `login.defs`

### `su` : Exécute une commande avec un UID et un GID de substitution

  - Change vers le compte administrateur _root_ (nécessite le mot de passe) :
    `su`

  - Change vers le compte d'un utilisateur (nécessite le mot de passe sauf si on est _root_) :
    `su username`

  - Change vers le compte d'un utilisateur avec un _shell_
    `su - username`

  - Exécute une commande en tant qu'un autre utilisateur :
    `su - username -c "command"`

### `sudo` : Exécute une commande en tant qu'un autre utilisateur

  - Exécute une commande en tant que super-utilisateur :
    `sudo less /var/log/syslog`

  - Exécute une commande en tant qu'un autre utilisateur et/ou groupe :
    `sudo --user=utilisateur --group=groupe id -a`

  - Lance le terminal par défaut avec des privilèges de super-utilisateur sans modifier l'environnement :
    `sudo --shell`

  - Liste les commandes autorisées (et interdites) pour l'utilisateur courant :
    `sudo --list`

Voir aussi : `su`, `sudoedit`, `visudo`, `/etc/sudoers`

### `finger` : Affiche des informations sur les utilisateurs connectés

```sh
# finger
# finger username
# finger -s
```

Voir aussi : `w`, `users`, `last`

### `w` : Affiche les utilisateurs connectés et leur activité

```sh
# w
# w username
```

Voir aussi : `users`, `last`, `finger`

### `who` : Affiche qui est connecté

```sh
# who
# who am i
# who -a
```

Voir aussi : `logname`, `whoami`, `id`

### `getent` : Récupére des entrées depuis les base de données NSS

La  commande  getent  affiche les entrées des bases de données prises en charge par les bibliothèques du Name Service Switch (NSS).

```sh
$ cat /etc/nsswitch.conf
passwd:         files systemd
group:          files systemd
shadow:         files
gshadow:        files

hosts:          files mdns4_minimal [NOTFOUND=return] dns mymachines
networks:       files

protocols:      db files
services:       db files
ethers:         db files
rpc:            db files

netgroup:       nis

$ gentent passwd
```

## Environnement de travail

### `id` : Affiche les identifiants d'utilisateur et de groupe



## Utilisation du système

### `shutdown` : Arrête, éteint ou redémarre la machine

  - Éteint (arrête) immédiatement :
    `shutdown -h now` ou `halt`

  - Redémarre immédiatement :
    `shutdown -r now` ou `reboot`

  - Redémarre dans 5 minutes :
    `shutdown -r +5 &`

  - Éteint à 1:00 pm (Utilise un format 24h) :
    `shutdown -h 13:00`

  - Annule une opération d'arrêt ou de redémarrage du système en attente :
    `shutdown -c`

Voir aussi : `halt`, `reboot`

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


### `uptime` : Indique depuis quand le système a été mis en route

 - Indique depuis quand le système a été mis en route :
    `uptime` ou `uptime --pretty`

  - Depuis le dernier démarrage :
    `uptime --since`

### `top` : Affiche en temps réel les processus en cours d'exécution

Voir aussi : `ps`, `htop`

### `free` : Affiche la quantité de mémoire libre et utilisée du système

  - Afficher la quantité de mémoire libre et utilisée du système :
    `free --human` ou `free --si`

  - Affiche aussi les quantités totales des colonnes :
    `free --total`

### `vmstat` : Affiche des statistiques sur la mémoire virtuelle

### `history` : Affiche l'historique des commandes

  - Affiche l'historique des commandes avec un numérotage des lignes :
    `history`

> Les commandes peuvent être rappellées directement avec `!num` où `num` est le numéro de ligne dans l'historique. On peut tout simplement se déplacer dans l'historique avec les flèches directionnelles Haut et Bas. Il est possible de faire une recherche avec `Ctrl r`.

  - Affiche les 20 dernières commandes :
    `history 20`

  - Affiche puis efface l'historique :
    `history -c`

### `time` : Lance des programmes et résume leur utilisation des ressources du système

  - Affiche le temps d'utilisateur, du système et total :

```bash
$ time ls -R /
...
real	14m48,183s
user	0m22,758s
sys	  1m6,794s
```

---
©️ LaSalle Avignon - [thierry(dot)vaira(at)gmail(dot)com](thierry.vaira@gmail.com)
