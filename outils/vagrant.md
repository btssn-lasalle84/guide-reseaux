# Vagrant

[Vagrant](https://fr.wikipedia.org/wiki/Vagrant) est un logiciel libre et open-source pour la création et la conﬁguration des environnements de développement virtuel.

Il peut être considéré comme un wrapper autour de logiciels de virtualisation comme [Oracle VM VirtualBox](https://www.virtualbox.org/) (anciennement VirtualBox) ou [VMware Workstation](https://fr.wikipedia.org/wiki/VMware_Workstation).

[Vagrant](https://fr.wikipedia.org/wiki/Vagrant) s'utilise via une interface en ligne de commande (CLI).

Lien : https://www.vagrantup.com/

## Vagrantﬁle

`Vagrantfile` est un ﬁchier texte qui permet de décrire le type de machine requis pour un projet, et comment le conﬁgurer.

Un ﬁchier `Vagrantfile` par projet.

> La syntaxe des ﬁchiers `Vagrantfile` est [Ruby](https://fr.wikipedia.org/wiki/Ruby) (la connaissance de Ruby n'est pas vraiment nécessaire).

Documentation : https://developer.hashicorp.com/vagrant/docs/vagrantfile

## Les box

Les _box_ (boîte) sont des machines virtuelles préconfigurées (_templates_). Cela permet d’accélérer le processus de développement et la distribution de logiciels.

Le nom d’une boîte est par convention : "`développeur/box`", par exemple "`ubuntu/bionic64`".

- [Vagrant Cloud](https://app.vagrantup.com/boxes/search) sert de plateforme d'échange pour trouver des boîtes et y déposer ses propres boîtes.
- [Création de boîte](http://tvaira.free.fr/bts-sn/admin/Creation-Box-Vagrant.pdf)

_Box_ :

- Kali : https://app.vagrantup.com/kalilinux/boxes/rolling
- Ubuntu : https://app.vagrantup.com/ubuntu/

Documentation : https://developer.hashicorp.com/vagrant/docs/boxes

## Installation

Lien : https://developer.hashicorp.com/vagrant/downloads

## Quick start

- on récupère un `Vagrantfile` definissant la _box_ :

```bash
$ vagrant init "kalilinux/rolling"
```

- on parmètre sa machine (optionnel) :

```ruby
config.vm.provider "virtualbox" do |vb|
    # Affiche la GUI de VirtualBox au démarrage de la machine
    vb.gui = true
    # Quelques réglages
    vb.memory = "2048"
    vb.cpus = 2
    # ...
end
```

- on crée et démarre la machine avec VirtualBox :

```bash
$ vagrant up --provider=virtualbox
```

- on se connecte à la machine en SSH :

```bash
$ vagrant ssh
```

- on arrête la machine virtuelle :

```bash
$ vagrant halt
```

- éventuellement, on supprime la machine virtuelle :

```bash
$ vagrant destroy
```

## Voir aussi

- http://tvaira.free.fr/bts-sn/admin/Presentation-Vagrant.pdf
- http://tvaira.free.fr/bts-sn/admin/Creation-Box-Vagrant.pdf
- [quickemu](quickemu.md)
- [VirtualBox](virtualbox.md)
- [VMware Workstation](https://fr.wikipedia.org/wiki/VMware_Workstation)

---

©️ LaSalle Avignon - [thierry(dot)vaira(at)gmail(dot)com](thierry.vaira@gmail.com)
