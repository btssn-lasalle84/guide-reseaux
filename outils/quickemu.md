# quickemu

[quickemu](https://github.com/quickemu-project/quickemu) permet de créer et exécuter rapidement (avec seulement deux commandes) des machines virtuelles de bureau Windows, macOS et Linux optimisées.

Lien : https://github.com/quickemu-project/quickemu

## Installation

```bash
$ sudo apt-add-repository ppa:flexiondotorg/quickemu
$ sudo apt update
$ sudo apt install quickemu
```

Pré-requis pour l'utiliser sous Ubuntu :

```bash
$ sudo apt install qemu bash coreutils ovmf grep jq lsb-base procps python3 genisoimage usbutils util-linux sed spice-client-gtk libtss2-tcti-swtpm0 wget xdg-user-dirs zsync unzip
```

## Exemples

quickgetpeut peut télécharger une image automatiquement et créer une configuration de machine virtuelle optimisée :

- Windows10 et Windows 11 :

```bash
quickget windows 11
quickemu --vm windows-11-22H2.conf
```

- une version d'Ubuntu :

```bash
quickget ubuntu 22.04
quickemu --vm ubuntu-22.04.conf
```

- une autre distribution GNU/Linux :

```bash
quickget zorin 16
quickemu --vm zorin-16-core64.conf --screen 0 --fullscreen
```

- une image de récupération macOS :

```bash
quickget macos monterey
quickemu --vm macos-monterey.conf --screen 0 --fullscreen
```

## GUI

Une interface utilisateur graphique est également disponible : https://github.com/quickemu-project/quickgui

```bash
$ sudo add-apt-repository ppa:yannick-mauray/quickgui
$ sudo apt update
$ sudo apt install quickgui
```

## Voir aussi

- [VirtualBox](virtualbox.md)
- [Vagrant](vagrant.md)
- [VMware Workstation](https://fr.wikipedia.org/wiki/VMware_Workstation)

---

©️ LaSalle Avignon - [thierry(dot)vaira(at)gmail(dot)com](thierry.vaira@gmail.com)
