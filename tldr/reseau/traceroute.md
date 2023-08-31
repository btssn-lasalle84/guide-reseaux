# tldr traceroute / tracepath

```bash
$ tldr traceroute

  traceroute

  Print the route packets trace to network host.
  More information: https://manned.org/traceroute.

  - Traceroute to a host:
    traceroute host

  - Disable IP address and host name mapping:
    traceroute -n host

  - Specify wait time for response:
    traceroute -w 0.5 host

  - Specify number of queries per hop:
    traceroute -q 5 host

  - Specify size in bytes of probing packet:
    traceroute host 42
```

```bash
tldr tracepath

  tracepath

  Trace the path to a network host discovering MTU along this path.
  More information: https://manned.org/tracepath.

  - A preferred way to trace the path to a host:
    tracepath -p 33434 host

  - Specify the initial destination port, useful with non-standard firewall settings:
    tracepath -p destination_port host 

  - Print both hostnames and numerical IP addresses:
    tracepath -b host

  - Specify a maximum TTL (number of hops):
    tracepath -m max_hops host

  - Specify the initial packet length (defaults to 65535 for IPv4 and 128000 for IPv6):
    tracepath -l packet_length host

  - Use only IPv6 addresses:
    tracepath -6 host
```

---
©️ LaSalle Avignon - [thierry(dot)vaira(at)gmail(dot)com](thierry.vaira@gmail.com)
