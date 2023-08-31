# Le « ping de la mort » (_ping of death_)

Le « ping de la mort » (_ping of death_) est une attaque historique de type **déni de service** réalisé par l'envoi de paquet « ping » malformé (paquet IP de longueur supérieure à la longueur maximale autorisée) consistant à rendre inutilisable un service (routeur, serveur, imprimante, etc.).

Un « ping » consite à émettre une demande d'écho (_echo request_) à destination d'une machine qui répondra par une réponse d'écho (_echo reply_).

Envoi d'une demande d'écho avec la commande [ping](../../tldr/reseau/ping.md) :

```bash
$ ping -c 1 192.168.0.50
PING 192.168.0.50 (192.168.0.50) 56(84) bytes of data.
64 bytes from 192.168.0.50: icmp_seq=1 ttl=64 time=0.842 ms
```

La demande d'écho (_echo request_) est transmise en utilisant le protocole [ICMP](../reseau/icmp.md) et en précisant un type de message `0x08` avec un code `0x00`. Le message ICMP est encapsulé dans un paquet [IP](../reseau/ip.md).

```
0                   1                   2                   3
0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|     Type      |     Code      |          Checksum             |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|           Identifier          |        Sequence Number        |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|     Data ...
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
```

La réponse d'écho (_echo request_) aura elle un type de message `0x00` avec un code `0x00`.

Capture d'un échange :

```bash
$ sudo tcpdump -tne -vv -i eth0 icmp
...
08:00:27:2f:f7:d1 > 00:02:05:00:00:01, ethertype IPv4 (0x0800), length 98: (tos 0x0, ttl 64, id 25060, offset 0, flags [DF], proto ICMP (1), length 84)
    192.168.0.117 > 192.168.0.50: ICMP echo request, id 55205, seq 1, length 64
00:02:05:00:00:01 > 08:00:27:2f:f7:d1, ethertype IPv4 (0x0800), length 98: (tos 0x0, ttl 64, id 11835, offset 0, flags [none], proto ICMP (1), length 84)
    192.168.0.50 > 192.168.0.117: ICMP echo reply, id 55205, seq 1, length 64
```

Un [ping](../../tldr/reseau/ping.md) a normalement une taille de 56 octets (soit 64 octets avec l'entête [ICMP](../reseau/icmp.md) de 8 octets ou 84 octets avec l'en-tête [IP](../reseau/ip.md) et [ICMP](../reseau/icmp.md)).

En effet, la taille maximale d'un paquet [IP](../reseau/ip.md) est de 65535 octets (car le champ est codé sur 16 bits). Sachant qu'un en-tête [IP](../reseau/ip.md) sans options a une longueur de 20 octets et celui d'[ICMP](../reseau/icmp.md) est de 8 octets, la commande [ping](../../tldr/reseau/ping.md) peut envoyer au maximum 65507 octets :

```bash
$ ping -c 1 192.168.0.50 -s 65507
PING 192.168.0.50 (192.168.0.50) 65507(65535) bytes of data.
65515 bytes from 192.168.0.50: icmp_seq=1 ttl=64 time=4.71 ms

--- 192.168.0.50 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 4.713/4.713/4.713/0.000 ms
```

Or certains systèmes n'étaient pas en mesure de traiter correctement les paquets plus gros que la taille maximale (65 535 octets) pouvant provoquer un crash de la machine cible.

```bash
$ ping -c 1 192.168.0.50 -s 65508
PING 192.168.0.50 (192.168.0.50) 65508(65536) bytes of data.
ping: local error: message too long, mtu=1500

--- 192.168.0.50 ping statistics ---
1 packets transmitted, 0 received, +1 errors, 100% packet loss, time 0ms
```

> Une des attaques les plus courantes consistait à envoyer un paquet ICMP de plus de 65 535 octets. Au-dessus de cette limite, les piles IP ne savaient pas gérer le paquet proprement, ce qui entraînait des erreurs de fragmentation UDP, ou encore les paquets TCP contenant des « flags » illégaux ou incompatibles. Cette faille a été exploitable sur différents systèmes d'exploitation, comme UNIX, Linux, Mac OS ou encore Microsoft Windows, jusque dans les années 1997-1998.

---
©️ LaSalle Avignon - [thierry(dot)vaira(at)gmail(dot)com](thierry.vaira@gmail.com)
