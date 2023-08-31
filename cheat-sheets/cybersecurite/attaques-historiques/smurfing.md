# Smurfing

Cette attaque utilise le protocole [ICMP](../../reseau/icmp.md).

Quand un `ping` (message ICMP `echo-request`) est envoyé à une adresse de _broadcast_ (par exemple `10.255.255.255`), celui-ci est démultiplié et envoyé à chacune des machines du réseau. Le principe de l'attaque est de spoofer les paquets ICMP `echo-reply` envoyés en mettant comme adresse IP source celle de la cible. L'attaquant envoie un flux continu de `ping` vers l'adresse de _broadcast_ d'un réseau et toutes les machines répondent alors par un message ICMP `echo-reply` en direction de la cible. Le flux est alors multiplié par le nombre d'hôte composant le réseau.

Dans ce cas tout le réseau cible subira le [déni de service](../denial-of-service.md), puisque l'énorme quantité de trafic généré par cette attaque entraîne une congestion du réseau.

> Il est difficile de se protéger de ce type d’attaque, il n’existe aucun patch mais des règles de filtrage correctes permettent de limiter son effet.

## Voir aussi

- [Le « ping de la mort » (_ping of death_)](ping-of-death.md)

---
©️ LaSalle Avignon - [thierry(dot)vaira(at)gmail(dot)com](thierry.vaira@gmail.com)
