# VirtualBox

[Oracle VM VirtualBox](https://www.virtualbox.org/) (anciennement VirtualBox) est un logiciel libre de virtualisation publié par [Oracle](https://fr.wikipedia.org/wiki/Oracle_Corporation).

> VirtualBox est un hyperviseur de type 2, c'est-à-dire qu'il doit être installé sur un système d'exploitation, et non directement sur un ordinateur en tant que système d'exploitation.

## Définitions

- Hôte (_Host_) :

  - machine hôte : représente la machine physique qui va « héberger » une ou plusieurs machines virtuelles. VirtualBox est installé sur la machine hôte.
  - système hôte : représente le système d'exploitation (OS) Windows, MacOS ou GNU/Linux qui est installé sur la machine hôte.

- Invité (_Guest_) :

  - machine invitée : représente la machine virtuelle qui sera allouée et gérée par l'hyperviseur VirtualBox
  - système invité : représente le système d'exploitation (OS) qui est installé sur la machine virtuelle. N'importe quel système d'exploitation peut être utilisé comme système invité sur VirtualBox.

> Les suppléments invité (_Guest Additions_) sont une sorte de _pack_ logiciel à installer sur la machine virtuelle pour optimiser son fonctionnement et ajouter de nouvelles fonctionnalités (dossiers partagés, glisser-déposer, ajustement automatique de la résolution de l'écran, etc.).

Disque VDI : VDI est le format d'enregistrement par défaut des disques durs virtuels pour VirtualBox. Selon les choix de l'utilisateur lors de la création de ce disque, il peut avoir une taille fixe ou variable.

VBoxManage : interface en ligne de commandes de VirtualBox. Cette interface intègre toutes les fonctions disponibles à partir de l'interface graphique (GUI) mais dispose également de commandes supplémentaires pour la gestion, le contrôle et la configuration des machines virtuelles. On peut par exemple démarrer et arrêter une machine virtuelle en ligne de commande.

> Il est possible de faire fonctionner plusieurs machines virtuelles en même temps, la limite correspondant aux performances de l'ordinateur hôte.

## Réseau virtuel

VirtualBox fournit jusqu’à huit cartes Ethernet PCI virtuelles pour chaque machine virtuelle.

Pour chaque carte sélectionnée, il est possible de choisir le mode de virtualisation effectué par la carte virtuelle
par rapport à votre matériel réseau physique sur l’hôte.

> https://download.virtualbox.org/virtualbox/UserManual_fr_FR.pdf

## Principaux modes

Les principaux modes sont :

- **Réseau interne** : On peut l’utiliser pour créer un type différent de réseau sur une base logicielle, visible pour les machines sélectionnées, mais pas pour les applications de l’hôte ou du monde extérieur.
- **Réseau privé hôte** (_Host-only_) : On peut l’utiliser pour créer un réseau contenant l’hôte et un ensemble de machines virtuelles, sans avoir besoin de l’interface réseau physique de l’hôte. À la place, une interface réseau virtuelle (identique à une interface loopback) est créée sur l’hôte, offrant une connectivité entre les machines virtuelles et l’hôte.
- **Réseau avec pont** (_bridged_) : Lorsque vous l’activez, VirtualBox se connecte à une de vos cartes réseaux installées et il échange des paquets réseaux directement, dépassant la pile réseau du système d’exploitation de votre hôte. En résumé votre système invité est accessible “directement” à partir de votre réseau physique comme si il était connecté physiquement à l’interface réseau en utilisant un câble réseau : l’hôte peut envoyer des données à l’invité via cette interface et en recevoir. Cela veut dire que vous pouvez régler du routage ou des ponts entre l’invité et le reste de votre réseau.
- **NAT** (_Network Address Translation_) : Une machine virtuelle dont NAT est activé agit exactement comme un vrai ordinateur qui se connecte à Internet par un routeur. Le “routeur”, dans ce cas, est le moteur réseau de VirtualBox, qui dirige le trafic depuis et vers la machine virtuelle de façon transparente. Dans VirtualBox, ce routeur se place entre chaque machine virtuelle et l’hôte. Cette séparation maximise la sécurité puisque, par défaut, les machines virtuelles ne peuvent pas se parler.

> L'inconvénient du mode NAT est que, comme dans un réseau privé, derrière un routeur, la machine virtuelle est invisible et injoignable depuis le réseau extérieur ; vous ne pouvez pas lancer de serveur de cette façon, sauf si vous réglez une redirection de ports.

Lire : http://tvaira.free.fr/bts-sn/reseaux/fiches/fiche-reseau-virtualbox.pdf

## Voir aussi

- [Vagrant](https://www.vagrantup.com/) : considéré comme un _wrapper_ (création et la configuration des environnements virtuels) autour de logiciels de virtualisation comme VirtualBox. (http://tvaira.free.fr/bts-sn/admin/Presentation-Vagrant.pdf et http://tvaira.free.fr/bts-sn/admin/Creation-Box-Vagrant.pdf)
- [VMware Workstation](https://fr.wikipedia.org/wiki/VMware_Workstation)

---
©️ LaSalle Avignon - [thierry(dot)vaira(at)gmail(dot)com](thierry.vaira@gmail.com)
