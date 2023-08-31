# La couche transport

Dans les [modèles de référence](modeles-couches.md) ([OSI](https://fr.wikipedia.org/wiki/Mod%C3%A8le_OSI) ou [DoD](https://fr.wikipedia.org/wiki/Suite_des_protocoles_Internet)), la couche transport est responsable du transport des données de
bout en bout au travers du réseau.

> Dans la suite de protocoles TCP/IP, les protocoles de transport déterminent à quelle application (i.e. processus) chaque paquet de données doit être délivré. Ce sont les **numéros de port** qui assurent ce mécanisme d'adressage des bouts d'une communication.

On distingue :

- [TCP](tcp.md) est un protocole de transport « fiable », orienté connexion, qui fournit un flux d'octets fiable assurant l'arrivée des données sans altérations et dans l'ordre, avec retransmission en cas de perte, et élimination des données dupliquées.

> Le mode connecté ne permet pas au protocole TCP d’être utilisé pour des communications un-vers-tous (_broadcast_) ou un-vers-plusieurs (_multicast_). Seules les communications de type un-vers-un (_unicast_) peuvent être réalisées.

- [UDP](udp.md) est un protocole simple, sans connexion, « non fiable », ce qui signifie qu'il ne vérifie pas que les paquets sont arrivés à destination, et ne garantit pas leur arrivée dans l'ordre.

> Le mode non connecté permet au protocole UDP d’être utilisé pour des communications un-vers-un (_unicast_), un-vers-tous (_broadcast_) et un-vers-plusieurs (_multicast_).

## Attribution connue des numéros de ports

Localement sur une machine Unix :

```bash
$ more /etc/services
```

Lien : https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml

---
©️ LaSalle Avignon - [thierry(dot)vaira(at)gmail(dot)com](thierry.vaira@gmail.com)
