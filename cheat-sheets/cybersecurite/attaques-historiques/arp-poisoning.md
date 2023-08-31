# ARP Poisoning

Le protocole ARP a été conçu sans souci particulier de sécurité. Il est vulnérable à des attaques locales sur le segment reposant principalement sur l’envoi de messages ARP erronés à un ou plusieurs ordinateurs. Elles sont regroupées sous l’appellation **ARP _poisoning_** (pollution de cache ARP).

## Le protocole ARP  (_Address Resolution Protocol_)

ARP est un protocole effectuant la traduction d’une adresse de couche réseau (une adresse IPv4 par exemple) en
une adresse MAC (une adresse Ethernet par exemple). Il a été défini dans la [RFC 826](https://tools.ietf.org/html/rfc826).

Les équipements réseaux communiquent en échangeant des **trames** (Ethernet par exemple) dans lesquelles il faut préciser les adresses MAC Destination et Source.

## Cache ARP

Une table de conversion est générée dynamiquement sur chaque hôte dans ce qu'on appelle l'"**ARP Cache**". Quand ARP reçoit une demande de résolution, il consulte sa table et retourne l’adresse physique si elle s’y trouve sinon il envoie un paquet spécial ARP _Request Packet_ à tous les hôtes du même réseau physique incluant l’adresse IP à rechercher et en utilisant l'adresse _broadcast_ MAC `FF:FF:FF:FF:FF:FF`.

La machine possédant l'adresse réseau IP demandée répond en lui renvoyant son adresse physique qui est alors placée dans la table ARP (cache ARP).

Le contenu de l'ARP Cache est généralement conservé pendant un certain temps ou jusqu'à l'extinction de la machine hôte (cf. _timeout_).

> Par contre, il est généralement vide au démarrage de l'interface. Voir aussi le fichier `/etc/ethers`.

## Principe

Cette attaque corrompt le cache de la machine victime.

Soit une machine Charlie qui souhaite intercepter les messages d’Alice vers Bob, toutes appartenant au même sous-réseau. L’attaque consiste pour Charlie à envoyer un paquet « arp who-has » à la machine d’Alice. Ce paquet spécialement construit contiendra comme IP source, l’adresse IP de la machine de Bob dont nous voulons usurper l’identité (**ARP _spoofing_**) et l’adresse MAC de la carte réseau de Charlie. La machine d’Alice va ainsi créer une entrée associant notre adresse MAC à l’adresse IP de la machine de Bob. Alice, destinataire de l’« arp who-has », utilise le paquet pour créer une entrée dans sa table MAC. Si Alice veut communiquer avec Bob au niveau IP, c’est Charlie qui recevra les trames d’Alice puisque notre adresse MAC est enregistrée dans le cache empoisonné de Alice comme équivalence pour l’IP du poste Bob. Ceci est une faiblesse connue de la mise en œuvre d’ARP et permet de corrompre facilement un cache ARP distant.

Exemple : on cherche à rediriger le trafic destiné à la passerelle par défaut vers la machine de l'attaquant. Ce genre d'attaque s’appuie sur une attaque par [ARP poisoning](https://fr.wikipedia.org/wiki/ARP_poisoning) (pollution ou empoisenement de cache ARP).

> C'est une attaque de type [homme du milieu (_Man In The Middle Attack_)](https://fr.wikipedia.org/wiki/Attaque_de_l%27homme_du_milieu) qui a pour but d'intercepter les communications entre deux parties, sans que ni l'une ni l'autre puisse se douter que le canal de communication entre elles a été compromis.

Soit la machine de la victime Alice `10.0.0.1`, sa passerelle par défaut est la machine de Bob `10.0.0.254` et la machine de l'attaquant Charlie `10.0.0.66`.

Avant l'attaque, sur la machine d'Alice :

```bash
$ traceroute 10.0.0.254
traceroute to 10.0.0.254 (10.0.0.254), 30 hops max, 40 byte packets
 1  10.0.0.254  (10.0.0.254)  1.218 ms  1.061 ms  0.849 ms

$ arp
Address         HWtype  HWAddress               Flags Mask      Iface
10.0.0.254      ether   00:b0:c2:88:de:65       C               eth0
```

L'attaquant utilise [arpspoof](https://linuxcommandlibrary.com/man/arpspoof) ([dsniff](https://en.wikipedia.org/wiki/DSniff)) pour empoisonner le cache ARP de la machine `10.0.0.1` avec des _ARP Reply_ indiquant que l'adresse MAC associée à `10.0.0.254` est désormais `00:00:86:35:c9:3f` :

```bash
// arpspoof -i <Iface> -t <IPtarget> <IPdest>
$ arpspoof -t 10.0.0.1 10.0.0.254
0:0:86:35:c9:3f 0:60:8:de:64:f0 0806 42: arp reply 10.0.0.254 is-at 0:0:86:35:c9:3f
0:0:86:35:c9:3f 0:60:8:de:64:f0 0806 42: arp reply 10.0.0.254 is-at 0:0:86:35:c9:3f
0:0:86:35:c9:3f 0:60:8:de:64:f0 0806 42: arp reply 10.0.0.254 is-at 0:0:86:35:c9:3f
...
```

![](./images/dsniff.png)

Après l'attaque, sur la machine d'Alice :

```bash
$ traceroute 10.0.0.254
traceroute to 10.0.0.254 (10.0.0.254), 30 hops max, 40 byte packets
 1  10.0.0.66  (10.0.0.66)  1.712 ms  1.465 ms  1.501 ms
 2  10.0.0.254  (10.0.0.1)  2.238 ms  2.121 ms  2.169 ms

$ arp
Address         HWtype  HWAddress               Flags Mask      Iface
10.0.0.254      ether   00:00:86:35:c9:3f       C               eth0
```

Pour finir, il faut autoriser la redirection du trafic en activant l'_IP Forwarding_ :

- temporairement : `# echo "1" > /proc/sys/net/ipv4/ip_forward` ou `# sysctl -n -w net.ipv4.ip_forward=1`

- de manière permanente (prise en compte au démarrage du service réseau) :
  - dans le fichier `/etc/sysconfig/network` : `FORWARD_IPV4=yes`
  - dans le fichier `/etc/sysctl.conf` : `net.ipv4.ip_forward = 1`

---
©️ LaSalle Avignon - [thierry(dot)vaira(at)gmail(dot)com](thierry.vaira@gmail.com)
