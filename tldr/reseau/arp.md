# tldr arp

```bash
$ tldr arp

  arp

  Affiche et manipule votre cache système ARP.
  Plus d'informations : https://manned.org/arp.

  - Affiche la table ARP courante :
    arp -a

  - Nettoie le cache :
    sudo arp -a -d

  - Supprime une entrée spécifique :
    arp -d adresse

  - Crée une entré dans la table ARP:
    arp -s adresse adresse_mac
```

Voir aussi :

```bash
$ man rarp

NOM
       rarp - manipule la table système RARP

SYNOPSIS
       rarp [-V] [--version] [-h] [--help]
       rarp -a
       rarp [-v] -d nom_d_hote ...
       rarp [-v] [-t type] -s nom_d_hote adr_materiel

DESCRIPTION
       Rarp manipule la table RARP du noyau de différentes façons. Les options de base permettent d'effacer une entrée de correspondance d'adresses et d'en redéfi‐
       nir une manuellement. Pour des besoins de débogage, le programme rarp permet aussi de vider complètement la table RARP.

OPTIONS
       -V     Affiche la version de RARP utilisé.

       -v     Dit à l'utilisateur ce qui se passe, en étant verbeux.

       -t type
              En définissant ou lisant la table RARP, ce paramètre optionnel dit à rarp quelles classes d'entrées il doit contrôler. La valeur par défaut de ce pa‐
              ramètre  est ether (i.e. code matériel 0x01 pour IEEE 802.3 10Mbps Ethernet . D'autres valeurs doivent correspondre à des technologies réseaux telles
              que AX.25 (ax25). et NET/ROM (netrom).

       -a

       --list Liste les entrées de la table RARP.

       -d nom_d_hote

       --delete nom_d_hote
              Supprime toutes les entrées RARP relatives à l'hôte spécifié.

       -s nom_d_hote adr_materielle

       --set nom_d_hote adr_materielle
              Crée manuellement une correspondance d'adresses RARP pour l'hôte nom_d_hôte avec l'adresse matérielle adr_materielle. Le format  de  l'adresse  maté‐
              rielle  est dépendant du matériel, mais pour la plupart on peut considérer que la présentation classique peut être utilisée. Pour la classe Ethernet,
              c'est 6 octets en hexadécimal, séparés par des double-points.
```

---
©️ LaSalle Avignon - [thierry(dot)vaira(at)gmail(dot)com](thierry.vaira@gmail.com)
