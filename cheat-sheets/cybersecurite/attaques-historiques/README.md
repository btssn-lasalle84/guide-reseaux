# Attaques historiques

Présentation d'attaques historiques basées sur les protocoles de la famille "TCP/IP".

- Le « [ping de la mort](ping-of-death.md) » (_ping of death_) : attaque historique de type **déni de service** réalisé par l'envoi de paquet « ping » malformé (paquet IP de longueur supérieure à la longueur maximale autorisée) consistant à rendre inutilisable un service (routeur, serveur, imprimante, etc.).

- [ARP poisoning](arp-poisoning.md) : le protocole ARP est vulnérable à des attaques locales sur le segment reposant principalement sur l’envoi de messages ARP erronés à un ou plusieurs ordinateurs.

> Les attaques par fragments visent à passer les protections d'un pare-feu en utilisant les spécificités du protocole concernant la fragmentation des datagrammes [IP](../../reseau/ip.md).

- [Tiny Fragments](tiny-fragments.md)
- [Fragment Overlapping](fragment-overlapping.md)

- L'[empoisonnement du cache DNS](dns-spoofing.md) (_DNS cache poisoning_ et _DNS spoofing_) : technique permettant de leurrer les serveurs DNS afin de leur faire croire qu'ils reçoivent une réponse valide à une requête qu'ils effectuent, alors qu'elle est frauduleuse. Une fois que le serveur DNS a été empoisonné, l'information est mise dans un cache, rendant ainsi vulnérables tous les utilisateurs de ce serveur.

- [TCP SYN flooding](tcp-syn-flooding.md) : envoyer un très grand nombre de demandes de connexion TCP et les laisser en attente afin de saturer la machine cible pour provoquer un [déni de service](../denial-of-service.md).
- [TCP Session Hijacking](tcp-session-hijacking.md) : attaque permettant de rediriger un flux TCP et rendre possible le « vol » de session.
- L'[attaque de Mitnick](attaque-mitnick.md) : cas d'intrusion mythique réalisé par [Kevin Mitnick](https://fr.wikipedia.org/wiki/Kevin_Mitnick) le 25 décembre 1994 sur le réseau de l'expert en sécurité informatique Tsutomu Shimomura.

- [Chargen Denial of Service Attack](udp-flooding.md) : ce [déni de service](../denial-of-service.md) exploite le mode non connecté du protocole [UDP](../../cheat-sheets/reseau/udp.md) en générant une grande quantité de paquets UDP.

- [Smurfing](smurfing.md) : un [ping](../../../tldr/reseau/ping.md) en _broadcast_ (_ICMP Flood_) pour provoquer un [déni de service](../denial-of-service.md).

---
©️ LaSalle Avignon - [thierry(dot)vaira(at)gmail(dot)com](thierry.vaira@gmail.com)
