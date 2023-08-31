# TCP SYN flooding

Une connexion [TCP](../../reseau/tcp.md) s'établie en trois phases (_TCP Three Way Handshake_).

Les trois étapes sont l'envoi d'un `SYN`, la réception d'un `SYN-ACK` et l'envoi d'un `ACK`.

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

Le _SYN Flooding_ exploite ce mécanisme d'établissement en trois phases.

Le principe est de laisser sur la machine cible un nombre important de connexions TCP en attentes.

Pour cela, l'attaquant envoie un très grand nombre de demandes de connexion (_flag_ `SYN` à `1`), la machine cible renvoie les `SYN-ACK` en réponse au `SYN` reçus. L'attaquant ne répondra jamais avec un `ACK`, et donc pour chaque `SYN` reçu la cible aura une connexion TCP en attente. Etant donné que ces connexions semi-ouvertes consomment des ressources mémoires au bout d'un certain temps la machine est saturée et ne peut plus accepter de connexion. Ce type de [déni de service](../denial-of-service.md) n'affecte que la machine cible.

> L'attaquant utilise des adresses IP sources aléatoires pour éviter toute identification de la machine de l'attaquant.

## L'attaque de Mitnick

L'[attaque de Mitnick](attaque-mitnick.md) est le nom donné à l'attaque informatique faite par [Kevin Mitnick](https://fr.wikipedia.org/wiki/Kevin_Mitnick) le 25 décembre 1994 sur le réseau de l'expert en sécurité informatique Tsutomu Shimomura. Elle fait partie des cas d'intrusion les plus connus dans la sécurité informatique. Elle était connue en théorie dans le milieu universitaire depuis le milieu des années 1980, mais elle n'avait jamais encore été mise en pratique. Son côté inédit a donc fortement contribué à sa diffusion.

Elle utilisait deux techniques distinctes : l'[inondation de requêtes SYN](tcp-syn-flooding.md) et le [vol de session TCP](tcp-session-hijacking.md).

---
©️ LaSalle Avignon - [thierry(dot)vaira(at)gmail(dot)com](thierry.vaira@gmail.com)
