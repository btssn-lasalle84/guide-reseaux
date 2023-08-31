## tcpdump

`tcpdump` est un analyseur de paquets en ligne de commande. Il permet d'obtenir le détail du trafic visible depuis une interface réseau.

Lien : www.tcpdump.org

> L'outil sous GNU/Linux, *BSD et Mac OS X dépend de la bibliothèque logicielle `libpcap`. La bibliothèque logicielle libpcap est à l'origine développée pour l'outil tcpdump mais peut être utilisée par tous les analyseurs de paquets. Le portage sous Windows est connu sous les appellations WinPCAP/WinDUMP.

Lister les interfaces disponibles :

```bash
$ tcpdump -D
1.enp4s0 [Up, Running]
2.any (Pseudo-device that captures on all interfaces) [Up, Running]
3.lo [Up, Running, Loopback]
...
```

> https://www.tcpdump.org/manpages/tcpdump.1.html

Les options principales :

- `-i nom_interface` : permet de choisir l'interface d'écoute
- `-v` : permet d'afficher encore plus d'informations sur les paquets. Il y a trois niveaux de verbosité : `-v`, `-vv`, `-vvv`
- `-e` : affiche l'en-tête de niveau Liaison (par exemple Ethernet_II et IEEE 802.11)
- `-n` : ne pas convertir les adresses (hôte, les numéros de port, etc.) en noms
- `-t` : n’affiche pas l'horodatage sur chaque ligne
- `-XX` : affiche en hexadécimal et ASCII

Commandes de base :

```bash
$ sudo tcpdump -tne -XX -i interface
$ sudo tcpdump -tne -XX -vvv -i interface
```

`tcpdump` dispose d'un **filtre** puissant des paquets nommés BPF (BSD packet filter). Il est possible de combiner les règles avec : `and` (ET), `or` (OU) et `not` (NON).

> https://www.tcpdump.org/manpages/pcap-filter.7.html

On utilisera principalement `host`, `port`, les protocoles (`ip`, `icmp`, `arp`, `tcp` etc.) et les adresses `src`/`dst`.

```bash
$ sudo tcpdump src 192.168.1.100 and dst 192.168.1.2 and port ftp
```

Exemples :

  - Capture le trafic d'un réseau :
    `tcpdump net 192.168.1.0/24`

  - Capture le trafic (sauf le port 22) et le sauvegarde dans un fichier :
    `tcpdump -w dumpfile.pcap port not 22`

  - Lit un fichier de captures :
    `tcpdump -r dumpfile.pcap`

---
©️ LaSalle Avignon - [thierry(dot)vaira(at)gmail(dot)com](thierry.vaira@gmail.com)
