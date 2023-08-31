# UDP Flooding

L'exemple le plus connu d'_UDP Flooding_ est le _Chargen Denial of Service Attack_.

La mise en pratique de cette attaque est simple, il suffit de faire communiquer le service `chargen` d'une machine avec le service `echo` d'une autre.

Le service `chargen` génère des caractères tandis que `echo` se contente de réémettre les données qu'il reçoit. Il suffit alors au pirate d'envoyer des paquets UDP sur le port `19` (`chargen`) à une des victimes en spoofant l'adresse IP et le port source de l'autre. Dans ce cas le port source est le port UDP `7` (`echo`).

L'_UDP Flooding_ entraîne une saturation de la bande passante entre les deux machines et influe sur le réseau.

La congestion est plus importante du fait que le trafic UDP est "prioritaire" sur le trafic TCP.

> Le protocole TCP possède un mécanisme de contrôle de congestion, dans le cas où l'acquittement d'un paquet arrive après un long délai. Ce mécanisme adapte alors le débit d'émission des paquets TCP. Le protocole UDP ne possède pas ce mécanisme, au bout d'un certain temps le trafic UDP occupera donc toute la bande passante ne laissant qu'une infime partie au trafic TCP.

---
©️ LaSalle Avignon - [thierry(dot)vaira(at)gmail(dot)com](thierry.vaira@gmail.com)
