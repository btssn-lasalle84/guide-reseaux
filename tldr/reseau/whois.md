# tldr whois

`whois` est un service de recherche fourni par les registres Internet permettant d'obtenir des informations sur une adresse IP ou un nom de domaine.

> Les données stockées dans la base de données du registre le sont selon son propre schéma de données. Il n'existe pas de norme. L'accès au serveur whois est public.

```bash
$ tldr whois

  whois

  Command-line client for the WHOIS (RFC 3912) protocol.
  More information: https://github.com/rfc1036/whois.

  - Get information about a domain name:
    whois example.com

  - Get information about an IP address:
    whois 8.8.8.8

  - Get abuse contact for an IP address:
    whois -b 8.8.8.8
```

Les registres régionaux d'adresses IP (RIR) sont les suivants :

- RIPE NCC pour l'Europe,
- ARIN pour l'Amérique du Nord,
- APNIC pour l'Asie,
- LACNIC pour l'Amérique du Sud,
- AfriNIC pour l'Afrique.

Les RIR reçoivent eux-mêmes les ressources de l'[IANA](https://fr.wikipedia.org/wiki/IANA).

Voir aussi :

- `man whois`
- `host` et `dig` : résolveur DNS

Liens :

- https://www.afnic.fr/noms-de-domaine/tout-savoir/whois-trouver-un-nom-de-domaine/
- [RIPE NCC](https://fr.wikipedia.org/wiki/RIPE_Network_Coordination_Centre) et https://www.ripe.net/

---
©️ LaSalle Avignon - [thierry(dot)vaira(at)gmail(dot)com](thierry.vaira@gmail.com)
