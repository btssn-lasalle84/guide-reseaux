# TCP Session Hijacking

Cette attaque permet de rediriger un flux [TCP](../../reseau/tcp.md) et rend donc possible le « vol » de session.

> Le vol d'une session telnet ou ftp par exemple, se fera après la phase d'authentification.

Cette technique, basée sur le protocole [TCP](../../reseau/tcp.md), crée un état de désynchronisation entre les deux machines d'une session. L'état de désynchronisation s'obtient lorsque les numéros de séquence envoyés ne correspondent plus à ceux attendus.

```
 0                   1                   2                   3
 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|          Source Port          |       Destination Port        |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                        Sequence Number                        |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                    Acknowledgment Number                      |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|  Data |           |U|A|P|R|S|F|                               |
| Offset| Reserved  |R|C|S|S|Y|I|            Window             |
|       |           |G|K|H|T|N|N|                               |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|           Checksum            |         Urgent Pointer        |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                    Options                    |    Padding    |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                             Data                              |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
```

Cette attaque nécessite l'écoute passive (_sniffing_) du réseau pour récupérer les numéros de séquence échangés. Les numéros de séquence vont évoluer en fonction du nombre d'octets de données envoyées.

- _TCP Hijacking_ :

L'attaquant va lancer un segment TCP avec le bon numéro de séquence attendu par le serveur. L'envoi est réalisé avec l'adresse IP source « spoofée » du client. L'attaquant envoie aussi des données ce qui lui permet d'injecter une commande. En effet, ce paquet peut transporter des données (_flag_ `PSH` égal à `1`).

Le serveur accepte et traite les données reçues. Il renvoie un `ACK` pour acquitter les octets reçus.

Le client est désynchronisé car le numéro d'acquittement envoyé ne correspondent plus à celui attendu. Le client va renvoyer un `ACK` avec le bon numéro de sequence.

Un problème apparaît côté serveur : les numéros de séquence ne sont plus valides.

- _Ack Storm_ :

Cette désynchronisation va déclencher une « tempête » de ACK. Le problème du _ACK Storm_ peut être réglé en utilisant l'[ARP Spoofing](arp-poisoning.md). Pour cela, il faut  « empoisonner » le cache ARP (_ARP Cache Poisoning_) du serveur en lui indiquant que l'adresse IP du client est maintenant associé à l'adresse MAC de l'attaquant.

> Le programme [hunt](https://packetstormsecurity.com/sniffers/hunt/) implémentait cette technique.

## L'attaque de Mitnick

L'[attaque de Mitnick](attaque-mitnick.md) est le nom donné à l'attaque informatique faite par [Kevin Mitnick](https://fr.wikipedia.org/wiki/Kevin_Mitnick) le 25 décembre 1994 sur le réseau de l'expert en sécurité informatique Tsutomu Shimomura. Elle fait partie des cas d'intrusion les plus connus dans la sécurité informatique. Elle était connue en théorie dans le milieu universitaire depuis le milieu des années 1980, mais elle n'avait jamais encore été mise en pratique. Son côté inédit a donc fortement contribué à sa diffusion.

Elle utilisait deux techniques distinctes : l'[inondation de requêtes SYN](tcp-syn-flooding.md) et le [vol de session TCP](tcp-session-hijacking.md).

---
©️ LaSalle Avignon - [thierry(dot)vaira(at)gmail(dot)com](thierry.vaira@gmail.com)
