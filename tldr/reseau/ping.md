# tldr ping

```bash
$ tldr ping

  ping

  Send ICMP ECHO_REQUEST packets to network hosts.
  More information: https://manned.org/ping.

  - Ping host:
    ping host

  - Ping a host only a specific number of times:
    ping -c count host

  - Ping host, specifying the interval in seconds between requests (default is 1 second):
    ping -i seconds host

  - Ping host without trying to lookup symbolic names for addresses:
    ping -n host

  - Ping host and ring the bell when a packet is received (if your terminal supports it):
    ping -a host

  - Also display a message if no response was received:
    ping -O host
```

Voir aussi : `fping`, `oping`, `hping`, `arping`

`hping3` est un outil réseau capable d'envoyer des paquets [ICMP](../../cheat-sheets/reseau/icmp.md)/[UDP](../../cheat-sheets/reseau/udp.md)/[TCP](../../cheat-sheets/reseau/tcp.md) personnalisés et d'afficher les réponses. `hping3` permet de tester les règles de pare-feu, d'effectuer une analyse de port, de tester les performances du réseau à l'aide de différents protocoles, d'identifier des systèmes d'exploitation distants, d'auditer des piles TCP/IP, etc.

Exemples :

  - Traceroute (`--traceroute`) en utilisant ICMP (`-1`) :
    `hping3 --traceroute -V -1 www.example.com`

  - Inondation (`--flood`) ICMP (`-1`) :
    `hping3 --flood -1 --rand-source <target>`

  - Inondation (`--flood`) TCP :
    `hping3 --flood -SARFU -L 0 -M 0 -p 80 www.cible.com`

Quelques options :

```
...
  -V  --verbose   verbose mode
  -1  --icmp       ICMP mode
  -T  --traceroute traceroute mode
  --flood	         sent packets as fast as possible. Don't show replies.
  -S  --syn        set SYN flag
  -A  --ack        set ACK flag
  -R  --rst        set RST flag
  -F  --fin        set FIN flag
  -L  --setack     set TCP ack
  -M  --setseq     set TCP sequence number
  -p  --destport   [+][+]<port> destination port(default 0)
...
```

---
©️ LaSalle Avignon - [thierry(dot)vaira(at)gmail(dot)com](thierry.vaira@gmail.com)
