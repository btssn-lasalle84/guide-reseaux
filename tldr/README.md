# tl;dr

> _too long; didn't read_ (« trop long, [je n'ai] pas lu »), utilisé ici en référence à [tldr-pages](https://github.com/tldr-pages/tldr) qui est une collection de pages d'aide gérées par la communauté pour les outils de ligne de commande et qui vise à être un complément plus simple et plus accessible aux pages de manuel traditionnelles ([man](https://fr.wikipedia.org/wiki/Man_(Unix))).

Cette partie regroupe les principales commandes réseau et leurs usages habituels.

- [tl;dr](#tldr)
  - [tldr - bash client for tldr](#tldr---bash-client-for-tldr)
  - [Boîte à outils réseau](#boîte-à-outils-réseau)
  - [Boîte à outils en cybersécurité](#boîte-à-outils-en-cybersécurité)
  - [Boîte à outils de chiffrement](#boîte-à-outils-de-chiffrement)
  - [Commandes GNU/Linux](#commandes-gnulinux)

## tldr - bash client for tldr

> _A fully-functional bash client for tldr, simplified and community-driven man pages_

Un client en ligne de commande : [tldr](https://github.com/raylee/tldr-sh-client)

Exemple :

```bash
$ tldr ping

  ping

  Send ICMP ECHO_REQUEST packets to network hosts.
  More information: https://manned.org/ping.

  - Ping host:
    ping host

  - Ping a host only a specific number of times:
    ping -c count host
...
```

## Boîte à outils réseau

- [ifconfig](reseau/ifconfig.md) : configuration des interfaces réseau
- [ip](reseau/ip.md) : gestion de l'adressage, le routage, les interfaces et périphériques réseau, les règles de routage et les tunnels.
- [ping](reseau/ping.md) : teste l'accessibilité d'une machine sur un réseau
- [arp](reseau/arp.md) : gestion du cache ARP
- [route](reseau/route.md) : gestion des tables de routage
- [traceroute](reseau/traceroute.md) : affichage d'une route
- [whois](reseau/whois.md) : obtenir des informations sur une adresse IP ou un nom de domaine
- [nmap](reseau/nmap.md) : outil d'exploration de réseau et scanneur de port
- [netstat](reseau/netstat.md) : affichage d'informations et statistiques réseau
- [netcat](reseau/netcat.md) : utilitaire permettant d'ouvrir des connexions réseau
- [iptables](reseau/iptables.md) : configuration des règles pare-feu
- [tcpdump](reseau/tcpdump.md) : capture et analyse le trafic réseau

## Boîte à outils en cybersécurité

- [john](cyber/john.md) : [John the Ripper](https://fr.wikipedia.org/wiki/John_the_Ripper)

## Boîte à outils de chiffrement

- [openssl](divers/openssl.md) : interface en ligne de commande pour le chiffrement

## Commandes GNU/Linux

- [Commandes de base](gnu-linux/commandes-basiques.md)
- [Commandes système](gnu-linux/commandes-systeme.md)

---
©️ LaSalle Avignon - [thierry(dot)vaira(at)gmail(dot)com](thierry.vaira@gmail.com)
