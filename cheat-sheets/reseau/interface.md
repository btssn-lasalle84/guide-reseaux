# Interface de communication

La carte de communication assure l'interface entre la machine et un ensemble d'autres équipements connectés sur le même réseau.

- [Interface de communication](#interface-de-communication)
  - [L'adressage](#ladressage)
  - [Adresse MAC](#adresse-mac)
  - [Adresse réseau](#adresse-réseau)
    - [IPv4](#ipv4)
    - [IPv6](#ipv6)
    - [Masque IPv4](#masque-ipv4)
  - [Gestion des adresses](#gestion-des-adresses)
  - [Mode d'adressage](#mode-dadressage)
  - [Types d'adresse](#types-dadresse)
  - [Interface _loopback_](#interface-loopback)
  - [Configuration](#configuration)
  - [Les commandes de base](#les-commandes-de-base)
  - [Manipulations](#manipulations)


## L'adressage

## Adresse MAC

Une **adresse [MAC](https://fr.wikipedia.org/wiki/Adresse_MAC)** (_Media Access Control address_) est un identifiant physique stocké dans une carte réseau ou une interface réseau et utilisé pour attribuer (mondialement) une adresse unique (généralement codé sur 48 bits). On utilise aussi les appelations suivantes : adresse physique, adresse matérielle, adresse hardware (HWaddr), ... Les adresses MAC sont utilisées dans les entêtes des **trames** afin d’identifier l’émetteur et le destinataire.

![](https://upload.wikimedia.org/wikipedia/commons/9/94/MAC-48_Address.svg?uselang=fr)

> Les adresses MAC ne donnent aucune indication sur la localisation de l’équipement et donc ne permet pas une organisation optimale du réseau. Cette faiblesse sera compensée par un adressage logique au niveau de la couche Réseau.

## Adresse réseau

Une **adresse [IP](https://fr.wikipedia.org/wiki/Internet_Protocol) (_Internet Protocol_)** est le numéro qui identifie chaque équipement connecté à un réseau IP (réseau informatique utilisant l’Internet Protocol). Il existe des adresses IP de version 4 (codées sur 32 bits) et de version 6 (codée sur 128 bits).

### IPv4

L'adresse [IPv4](https://fr.wikipedia.org/wiki/IPv4) est codée sur 32 bits (4 octets). Elle est généralement représentée en [notation décimale à point](https://fr.wikipedia.org/wiki/Notation_d%C3%A9cimale_%C3%A0_point) avec quatre nombres compris entre `0` et `255`, séparés par des points (exemple : `212.85.150.134`).

![](https://upload.wikimedia.org/wikipedia/commons/3/34/Adresse_Ipv4.svg)

> :point_right: Les adresses IPv4 sont décomposables en deux parties en utilisant un **masque** : le _netid_ qui identifie le réseau auquel appartient l’hôte et le _hostid_ qui identifie le numéro de l’hôte dans ce réseau.

On utilise aussi les appelations suivantes : adresse réseau, adresse _inet_ (_inet adr_), ...

Les adresses IP sont utilisées dans les entêtes des **paquets** afin d’identifier l’émetteur et le destinataire. Les paquets sont transmis dans des trames.

> :warning: L'adresse de version 4 est actuellement la plus utilisée mais elle devient(est) obsolète et devra être remplacée par la version 6 en raison d'une pénurie d'adresses au niveau mondial d'Internet.

### IPv6

L'adresse [IPv6](https://fr.wikipedia.org/wiki/IPv6) est codée sur 128 bits.

La notation décimale à point employée pour les adresses IPv4 est abandonnée au profit d’une écriture hexadécimale, où les 8 groupes de 2 octets (soit 16 bits par groupe) sont séparés par un signe deux-points `:`. La notation complète comprend exactement 39 caractères : `2001:0db8:0000:85a3:0000:0000:ac1f:8001`

![](https://upload.wikimedia.org/wikipedia/commons/4/4d/Ipv6_address-fr.svg?uselang=fr)

Notation abrégée :

- Il est permis d’omettre de 1 à 3 chiffres zéros non significatifs dans chaque groupe de 4 chiffres hexadécimaux : `2001:db8:0:85a3:0:0:ac1f:8001`
- De plus, une unique suite de un ou plusieurs groupes consécutifs de 16 bits tous nuls peut être omise, en conservant toutefois les signes deux-points de chaque
côté de la suite de chiffres omise, c’est-à-dire une paire de deux-points (`::`) : `2001:db8:0:85a3::ac1f:8001`

> Il n'y a plus d'adresse _broadcast_ en IPv6, celle-ci étant remplacée par des adresses _multicast_. Le [NAT](nat.md) est découragé en IPv6 pour préserver la transparence du réseau et n'est plus nécessaire vu la quantité d'adresses disponibles.

### Masque IPv4

Le [masque de sous-réseau](https://fr.wikipedia.org/wiki/Sous-r%C3%A9seau#Masque_de_sous-r%C3%A9seau) permet de déterminer quelle partie d'une adresse [IP](https://fr.wikipedia.org/wiki/Internet_Protocol) (_Internet Protocol_) correspond au numéro de réseau et laquelle correspond au numéro de l'hôte.

![](https://upload.wikimedia.org/wikipedia/commons/e/e5/Subnetting_operation.svg?uselang=fr)

On utilise une opération de **ET bit à bit** entre l'adresse IP et le masque de sous-réseau pour extraire la partie réseau ou sous-réseau de l'adresse.

> Exemple : `192.168.52.149` ET `255.255.255.0` donne `192.168.52.0` ce qui est une adresse réseau. Un équipement réseau qui aurait une adresse IP `192.168.52.254` et le même masque de sous-réseau serait donc sur le même réseau IP et peuvent communiquer directement. Lorsqu'on n'est pas sur le même réseau, il faut passer par les services d'un routeur (ou _gateway IP_) pour communiquer avec d'autres réseaux IP.

En IPv4, on doit représenter une adresse avec sa valeur du masque :

- en [notation décimale à point](https://fr.wikipedia.org/wiki/Notation_d%C3%A9cimale_%C3%A0_point) : `192.168.1.0` et `255.255.255.0`
- avec la [notation CIDR](https://fr.wikipedia.org/wiki/Adresse_IP#Agr%C3%A9gation_des_adresses) qui indique alors le nombre de bits à 1 dans le masque de la manière suivante : `172.20.0.0/16`

> C’est le masque qui définit la taille d’une réseau IP : c’est-à-dire la plage d’adresses assignables aux machines du réseau.

## Gestion des adresses

- Adresse [MAC](https://fr.wikipedia.org/wiki/Adresse_MAC) : par l'IEEE (cf. http://standards-oui.ieee.org/oui.txt)
- Adresse [IP](https://fr.wikipedia.org/wiki/Internet_Protocol) : par l'[IANA](https://fr.wikipedia.org/wiki/Internet_Assigned_Numbers_Authority) (https://www.iana.org/) puis les [RIR](https://fr.wikipedia.org/wiki/Registre_Internet_r%C3%A9gional)s (cf. [RIPE NCC](https://fr.wikipedia.org/wiki/RIPE_Network_Coordination_Centre) et [whois](..../../../../tldr/reseau/whois.md))

## Mode d'adressage

- Adressage **statique** : c'est l'affectation d'une adresse IP fixe et d'un masque de sous-réseau à une interface réseau. Cette opération est généralement réalisée manuellement (ou par DHCP à partir de l'adresse MAC).
- Adressage **dynamique** : c'est l'affectation automatique d'une adresse IP et d'un masque de sous-réseau à une interface réseau. La machine dépourvue d'adresse IP fait une demande vers un serveur DHCP pour obtenir une adresse dynamique pour une durée limitée (bail).

> [DHCP](dhcp.md) (_Dynamic Host Configuration Protocol_) est un protocole réseau dont le rôle est d'assurer la configuration automatique des paramètres IP d'une station.

## Types d'adresse

- [Unicast](https://fr.wikipedia.org/wiki/Unicast) : adresse unique
- [Broadcast](https://fr.wikipedia.org/wiki/Broadcast_(informatique)) : adresse de diffusion générale d'un émetteur (source unique) vers tous les récepteurs
- [Multicast](https://fr.wikipedia.org/wiki/Multicast) : adresse de diffusion d'un émetteur (source unique) vers un groupe de récepteurs
- [Anycast](https://fr.wikipedia.org/wiki/Anycast) : technique d'adressage (et de routage) permettant de rediriger les données au « plus proche »

> Voir aussi : [Géocast](https://fr.wikipedia.org/wiki/G%C3%A9ocasting)

## Interface _loopback_

Une interface _loopback_ est une interface virtuelle d’un matériel réseau.

Le nom _localhost_ (hôte local) est associé à l’adresse IPv4 `127.0.0.1` et à l’adresse IPv6 `::1` et fait référence à l’interface de _loopback_ de la machine locale.

Toute machine disposant d’une pile TCP/IP fonctionnelle permet de s’adresser à _localhost_, même si cette machine n’est reliée à aucun réseau physique.

> Sous Unix, l’interface de loopback est abrégée par `lo`.

## Configuration

La configuration d'un interface réseau est sauvegardée dans des **fichiers** (`/etc/` sous Unix/Linux) ou dans une **base de registre** (sous Windows par exemple `HKey_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters`) pour être rechargée automatiquement au démarrage de la machine.

## Les commandes de base

|Commande|GNU/Linux|Windows|
|---|:---:|:---:|
|Configurer une interface réseau|`ifconfig`, `ip`|`ipconfig`, `netsh`|

La commande [ifconfig](../../tldr/reseau/ifconfig.md) est utilisée pour configurer et maintenir les  interfaces réseau. Si aucun argument n'est donné, `ifconfig` affiche simplement l'état des interfaces actuellement définies.

La commande [ifconfig](../../tldr/reseau/ip.md) affiche et manipule l'adressage, le routage, les interfaces et périphériques réseau, les règles de routage et les tunnels.

La commande `ipconfig` affiche toutes les valeurs actuelles de la configuration du réseau TCP/IP et actualise les paramètres DHCP (_Dynamic Host Configuration Protocol_) et DNS (_Domain Name System_).

La commande [netsh](https://fr.wikipedia.org/wiki/Netsh) est un puissant outil ligne de commande pour Windows depuis la version 2000 (win2k). Netsh permet de changer pratiquement tout paramètre de configuration réseau.

## Manipulations

- Configuration :
  - Linux :
    - Paramétrage d'une adresse IP statique :
`ifconfig eth0 192.168.3.1 netmask 255.255.255.0 broadcast 192.168.3.255`
    - Paramétrage d'une adresse IP dynamique (DHCP) :
`dhclient eth0`

  - Windows :
    - Paramétrage d'une adresse IP statique :
`netsh interface ip set address "Connexion au réseau local" static 10.0.2.16 255.255.255.0 10.0.2.2 1`
`netsh interface ipv4 set dnsservers name="Connexion au réseau local" source=static address="10.0.2.3" validate=no`
    - Paramétrage d'une adresse IP dynamique (DHCP) :
`netsh interface ip set address name="XXX" source=dhcp
`

- Test : la commande [ping](../../tldr/reseau/ping.md)

---
©️ LaSalle Avignon - [thierry(dot)vaira(at)gmail(dot)com](thierry.vaira@gmail.com)
