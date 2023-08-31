# DNS spoofing

Cette attaque consiste à faire parvenir de fausses réponses aux requêtes [DNS](../../reseau/dns.md) émisent par une victime.

> Le protocole [DNS](../../reseau/dns.md) (_Domain Name System_) a pour rôle de convertir un nom de domaine en une adresse IP et réciproquement.

Il existe deux méthodes principales pour effectuer cette attaque basée sur l'[empoisonnement du cache DNS](https://fr.wikipedia.org/wiki/Empoisonnement_du_cache_DNS) (_DNS cache poisoning_, _DNS spoofing_). C'est une technique permettant de leurrer les serveurs DNS afin de leur faire croire qu'ils reçoivent une réponse valide à une requête qu'ils effectuent, alors qu'elle est frauduleuse. Une fois que le serveur DNS a été empoisonné, l'information est mise dans un cache, rendant ainsi vulnérables tous les utilisateurs de ce serveur.

> C'est une attaque de type [homme du milieu (_Man In The Middle Attack_)](https://fr.wikipedia.org/wiki/Attaque_de_l%27homme_du_milieu) qui a pour but d'intercepter les communications entre deux parties, sans que ni l'une ni l'autre puisse se douter que le canal de communication entre elles a été compromis.

## DNS ID Spoofing

Le _DNS spoofing_ consiste à corrompre un serveur DNS de manière à rediriger l'appel à un site légitime vers un autre site (site de l'attaquant).

> L'outil `dnsspoof` inclus dans [dsniff](https://www.kali.org/tools/dsniff/) permet de réaliser une telle attaque.

Elle se base sur l'ID de la demande. L'en-tête du protocole DNS comporte un champ identification qui permet de faire correspondre les réponses aux demandes. En local, il est simple de le prédire en sniffant le réseau. Néanmoins, cela s'avère plus compliqué à distance.

Dans tous les cas, il est nécessaire de répondre avant le serveur DNS, en le faisant tomber via un [déni de service](../denial-of-service.md) par exemple.

Pour parvenir à ses fins, l'attaquant doit contrôler un serveur DNS (`ns.attaquant.com`) ayant autorité sur le domaine `attaquant.com`. Le serveur DNS cible (`ns.cible.com`) est supposé avoir des numéros de séquence prévisibles (s'incrémentant de 1 à chaque nouvelle requête).

L'attaque se décompose en quatre étapes :

- l'attaquant envoie une requête DNS pour le nom `www.attaquant.com` au serveur DNS du domaine `cible.com` ;
- le serveur DNS cible a donc relayé la demande au DNS du domaine `attaquant.com` ;
- l'attaquant est capable de sniffer la requête pour récupérer son ID (dans notre exemple l'ID a une valeur de 100) ;
- l'attaque falsifie l'adresse IP associée à un nom de machine, ici la machine victime est `www.spoofed.com` qui a normalement l'adresse IP 192.168.0.1. L'attaquant émet une requête DNS de résolution du nom `www.spoofed.com` vers `ns.cible.com`. Immédiatement après, il envoie une multitude de réponses DNS falsifiées (donnant comme adresse IP celle du site de l'attaquant 10.0.0.1) à cette même requête en ayant spoofé l'adresse IP source avec celle du serveur DNS du domaine `spoofed.com`. L'ID de chaque réponse sera incrémenté de 1 à partir de celui récupéré lors de la deuxième étape (ID = 100) pour augmenter la chance de tomber sur le bon numéro d'ID réponse, dans le cas où `ns.cible.com` aurait du répondre à d'autre requête et donc incrémenté son ID DNS.

## DNS Cache Poisoning

Les serveurs DNS possèdent un cache gardant en local, pendant un certain temps, les réponses de requêtes passées. Ceci pour éviter de perdre du temps à interroger chaque fois le serveur de nom ayant autorité sur le domaine demandé. Cette attaque consiste à corrompre ce cache avec de fausses informations.

> Les conditions de l'exemple précédent sont toujours valables.

Voici les différentes étapes de l'attaque :

- envoyer une requête DNS de résolution du nom `www.attaquant.com` au serveur DNS du domaine `cible.com` ;
- Le serveur DNS cible envoie donc une requête portant sur une résolution du nom `www.attaquant.com` au serveur DNS de l'attaquant ;
- Le serveur DNS de l'attaquant enverra une réponse avec des enregistrements falsifiés qui permettront d'assigner un nom de machine avec une adresse IP appartenant à l'attaquant. Par exemple, le site `www.cible.com` pourra avoir un enregistrement DNS falsifié renvoyant l'adresse IP de `www.attaquant.com` au lieu de la bonne adresse IP.

---
©️ LaSalle Avignon - [thierry(dot)vaira(at)gmail(dot)com](thierry.vaira@gmail.com)
