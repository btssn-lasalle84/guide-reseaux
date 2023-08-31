# ARP (_Address Resolution Protocol_)

ARP est un protocole effectuant la traduction d’une adresse de couche réseau (une adresse IPv4 par exemple) en
une adresse MAC (une adresse Ethernet par exemple). Il a été défini dans la [RFC 826](https://tools.ietf.org/html/rfc826).

> :exclamation: Le protocole ARP est indispensable au fonctionnement d’IPv4 utilisé au-dessus d’un réseau de type Ethernet.

## Le problème

On désire envoyer un paquet IP à un poste appartenant au même réseau physique. L'émission de la trame contenant le paquet IP nécessite de connaître l'adresse physique (MAC) du destinataire. Or, on ne connait que son adresse IP !

![](../images/arp-probleme.png)

## La solution

Le protocole ARP va permettre de trouver l'adresse physique du poste destinataire. Ce mécanisme est transparent pour l'utilisateur.

Une table de conversion est générée dynamiquement sur chaque hôte dans ce qu'on appelle l'"**ARP Cache**". Quand ARP reçoit une demande de résolution, il consulte sa table et retourne l’adresse physique si elle s’y trouve sinon il envoie un paquet spécial ARP _Request Packet_ à tous les hôtes du même réseau physique incluant l’adresse IP à rechercher et en utilisant l'adresse _broadcast_ MAC `FF:FF:FF:FF:FF:FF`.

La machine possédant l'adresse réseau IP demandée répond en lui renvoyant son adresse physique qui est alors placée dans la table ARP (cache ARP).

Le contenu de l'ARP Cache est généralement conservé pendant un certain temps ou jusqu'à l'extinction de la machine hôte (cf. _timeout_).

> Par contre, il est généralement vide au démarrage de l'interface. Voir aussi le fichier `/etc/ethers`.

## Exemple

On vient de démarrer le poste d'adresse IPv4 `192.168.1.1` et le cache ARP est vide :

```bash
# arp ­v
Entrées: 0 Ignorées: 0 Trouvées: 0

# cat /proc/net/arp
IP address HW type Flags HW address Mask Device
```

On fait un `ping` vers le poste d'adresse IP `192.168.1.3`. ARP reçoit une demande de conversion et il consulte sa table qui est vide. Il envoie donc un paquet ARP _Request Packet_ à tous les hôtes du même réseau physique :

![](../images/arp-solution.png)

La machine possédant l'adresse réseau IP demandée répond en lui renvoyant un paquet ARP _Reply Packet_ qui contient son adresse physique qui est alors placée dans la table ARP :

```bash
# arp ­v
Address         HWtype  HWaddress           Flags Mask Iface
192.168.52.1    ether   00:18:39:21:2f:fc   C          eth0
Entrées: 1 Ignorées: 0 Trouvées: 1

# cat /proc/net/arp
IP address  HW type Flags HW address        Mask Device
192.168.1.3 0x1     0x2   00:18:39:21:2e:bc *    eth0
```

## En-tête ARP

Les paquets ARP sont transportés sur la couche liaison de données. Dans le cas d'un transport Ethernet, on utilise l'EtherType `0x0806` (cf. `/etc/ethertypes`).

![](http://www.frameip.com/wp-content/uploads/entete-arp-entete-arp-partie-1.gif)

![](http://www.frameip.com/wp-content/uploads/entete-arp-entete-arp-partie-2.gif)

:eyes: Détail du paquet ARP : https://www.frameip.com/entete-arp/

## RARP

Le protocole RARP (_Reverse ARP_) permet à partir d'une adresse matérielle (adresse MAC) de déterminer l'adresse IP d'une machine. En résumé, RARP fait l'inverse de ARP. Il est beaucoup moins utilisé.

> Ce protocole était utilisé avant l'adoption du protocole DHCP. RARP permettait alors à des stations diskless (sans disque) ou des terminaux de connaître leur adresse IP à partir de leur adresse MAC. Un serveur hébergeait cette table de correspondance.

## Vulnérabilités

Le protocole ARP a été conçu sans souci particulier de sécurité. Il est vulnérable à des attaques locales sur le segment reposant principalement sur l’envoi de messages ARP erronés à un ou plusieurs ordinateurs. Elles sont regroupées sous l’appellation [ARP poisoning](https://fr.wikipedia.org/wiki/ARP_poisoning) (pollution de cache ARP).

Principe :

Soit une machine Charlie qui souhaite intercepter les messages d’Alice vers Bob, toutes appartenant au même sous-réseau. L’attaque consiste pour Charlie à envoyer un paquet « arp who-has » à la machine d’Alice. Ce paquet spécialement construit contiendra comme IP source, l’adresse IP de la machine de Bob dont nous voulons usurper l’identité (**ARP _spoofing_**) et l’adresse MAC de la carte réseau de Charlie. La machine d’Alice va ainsi créer une entrée associant notre adresse MAC à l’adresse IP de la machine de Bob. Alice, destinataire de l’« arp who-has », utilise le paquet pour créer une entrée dans sa table MAC. Si Alice veut communiquer avec Bob au niveau IP, c’est Charlie qui recevra les trames d’Alice puisque notre adresse MAC est enregistrée dans le cache empoisonné de Alice comme équivalence pour l’IP du poste Bob. Ceci est une faiblesse connue de la mise en œuvre d’ARP et permet de corrompre facilement un cache ARP distant.

Ces attaques peuvent permettre une écoute des communications entre deux machines (attaque de l’**homme du milieu**), le vol de connexion, une surcharge des commutateurs servant de structure au réseau informatique ou un **déni de service** (en effectuant une attaque de l’homme du milieu puis en refusant les paquets).

Pour lutter contre ce type d’attaque, il est possible :

- de mettre en place des entrées statiques dans le cache ARP de chaque machine du réseau (commande `arp -s` et fichier `/etc/ethers`).
- de limiter les adresses MAC sur chaque port des commutateurs (_switch_) s’ils le permettent (fonction Port Security).
- de surveiller les messages ARP circulant sur le réseau, à l’aide d’outils de surveillance (ARPwatch ou arpalert) ou de systèmes de détection d’intrusion (IDS).

## Voir aussi

- [Jouer avec le protocole ARP](https://doc.lagout.org/network/arp.pdf)
- [ARP poisoning](../cybersecurite/attaques-historiques/arp-poisoning.md)

---
©️ LaSalle Avignon - [thierry(dot)vaira(at)gmail(dot)com](thierry.vaira@gmail.com)
