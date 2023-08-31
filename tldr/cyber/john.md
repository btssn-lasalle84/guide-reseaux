# tldr john

[John the Ripper](https://fr.wikipedia.org/wiki/John_the_Ripper) est un logiciel libre de cassage de mot de passe, utilisé notamment pour tester la sécurité d'un mot de passe (audit, crack).

Plus d'informations : https://www.openwall.com/john/

```bash
  - Craquer le mot de passe :
    john path/to/hashes.txt

  - Voir les mots de passe craqués :
    john --show path/to/hashes.txt

  - Craquer le mot de passe à partir d'un dictionnaire :
    john --wordlist=path/to/wordlist.txt path/to/hashes.txt

  - Lister les formats de hachage :
    john --list=formats

  - Craquer le mot de passe avec un format de hachage :
    john --format=md5crypt path/to/hashes.txt

  - Restaurer une session interrompue à partir d'un fichier d'état, par ex. `mycrack.rec` :
    john --restore=path/to/mycrack.rec
```

Voir aussi :

- `man john`
- https://www.openwall.com/john/doc/EXAMPLES.shtml
- https://www.kali.org/tools/john/

## Manipulations

À l'origine, les mots de passe des les utilisateurs qui peuvent se connecter au système Unix étaient stockés dans le fichier `/etc/passwd`. Sur les systèmes Unix modernes, les mots de passe sont enregistrés dans un autre fichier (généralement `etc/shadow`) et ils y sont enregistrés dans une forme [hashée](https://fr.wikipedia.org/wiki/Fonction_de_hachage_cryptographique).

> https://fr.wikipedia.org/wiki/Passwd

Pour illustrer le fonctionnement de base de `john`, on démarre avec une distribution [Kali linux](../../outils/kali-linux.md) à partir de [](../../outils/vagrant.md) :

```zsh
┌──(vagrant㉿kali)-[~]
└─$ cat /etc/os-release
PRETTY_NAME="Kali GNU/Linux Rolling"
NAME="Kali GNU/Linux"
VERSION="2023.1"
VERSION_ID="2023.1"
VERSION_CODENAME="kali-rolling"
...

┌──(vagrant㉿kali)-[~]
└─$ id
uid=1000(vagrant) gid=1000(vagrant) ...
```

- Préparation :

```zsh
┌──(vagrant㉿kali)-[~]
└─$ ls -l /etc/passwd
-rw-r--r-- 1 root root 3136 Mar 10 16:43 /etc/passwd

┌──(vagrant㉿kali)-[~]
└─$ ls -l /etc/shadow
-rw-r----- 1 root shadow 1392 Nov 29 19:24 /etc/shadow

┌──(vagrant㉿kali)-[~]
└─$ tail -1 /etc/passwd
vagrant:x:1000:1000:vagrant,,,:/home/vagrant:/usr/bin/zsh

┌──(vagrant㉿kali)-[~]
└─$ sudo tail -1 /etc/shadow
vagrant:$y$j9T$VUvPD7/muEzcpmIeZ7XQn/$tbeNw0JozYyvP4.qvQMQaEPs9CxXcMPxu45b2pMhDz/:19326:0:99999:7:::

┌──(vagrant㉿kali)-[~]
└─$ sudo unshadow /etc/passwd /etc/shadow > mypasswd

┌──(vagrant㉿kali)-[~]
└─$ tail -1 mypasswd
vagrant:$y$j9T$VUvPD7/muEzcpmIeZ7XQn/$tbeNw0JozYyvP4.qvQMQaEPs9CxXcMPxu45b2pMhDz/:1000:1000:vagrant,,,:/home/vagrant:/usr/bin/zsh
```

- Liste des formats de _hash_ :

```zsh
┌──(vagrant㉿kali)-[~]
└─$ john --list=formats | more
416 formats (149 dynamic formats shown as just "dynamic_n" here)
descrypt, bsdicrypt, md5crypt, md5crypt-long, bcrypt, scrypt, LM, AFS,
tripcode, AndroidBackup, adxcrypt, agilekeychain, aix-ssha1, aix-ssha256,
aix-ssha512, andOTP, ansible, argon2, as400-des, as400-ssha1, asa-md5,
AxCrypt, AzureAD, BestCrypt, BestCryptVE4, bfegg, Bitcoin, BitLocker,
bitshares, Bitwarden, BKS, Blackberry-ES10, WoWSRP, Blockchain, chap,
Clipperz, cloudkeychain, dynamic_n, cq, CRC32, cryptoSafe, sha1crypt,
sha256crypt, sha512crypt, Citrix_NS10, dahua, dashlane, diskcryptor, Django,
django-scrypt, dmd5, dmg, dominosec, dominosec8, DPAPImk, dragonfly3-32,
dragonfly3-64, dragonfly4-32, dragonfly4-64, Drupal7, eCryptfs, eigrp,
electrum, EncFS, enpass, EPI, EPiServer, ethereum, fde, Fortigate256,
Fortigate, FormSpring, FVDE, geli, gost, gpg, HAVAL-128-4, HAVAL-256-3, hdaa,
hMailServer, hsrp, IKE, ipb2, itunes-backup, iwork, KeePass, keychain,
keyring, keystore, known_hosts, krb4, krb5, krb5asrep, krb5pa-sha1, krb5tgs,
krb5-17, krb5-18, krb5-3, kwallet, lp, lpcli, leet, lotus5, lotus85, LUKS,
MD2, mdc2, MediaWiki, monero, money, MongoDB, scram, Mozilla, mscash,
mscash2, MSCHAPv2, mschapv2-naive, krb5pa-md5, mssql, mssql05, mssql12,
multibit, mysqlna, mysql-sha1, mysql, net-ah, nethalflm, netlm, netlmv2,
net-md5, netntlmv2, netntlm, netntlm-naive, net-sha1, nk, notes, md5ns,
nsec3, NT, o10glogon, o3logon, o5logon, ODF, Office, oldoffice,
OpenBSD-SoftRAID, openssl-enc, oracle, oracle11, Oracle12C, osc, ospf,
Padlock, Palshop, Panama, PBKDF2-HMAC-MD4, PBKDF2-HMAC-MD5, PBKDF2-HMAC-SHA1,
PBKDF2-HMAC-SHA256, PBKDF2-HMAC-SHA512, PDF, PEM, pfx, pgpdisk, pgpsda,
pgpwde, phpass, PHPS, PHPS2, pix-md5, PKZIP, po, postgres, PST, PuTTY,
pwsafe, qnx, RACF, RACF-KDFAES, radius, RAdmin, RAKP, rar, RAR5, Raw-SHA512,
Raw-Blake2, Raw-Keccak, Raw-Keccak-256, Raw-MD4, Raw-MD5, Raw-MD5u, Raw-SHA1,
Raw-SHA1-AxCrypt, Raw-SHA1-Linkedin, Raw-SHA224, Raw-SHA256, Raw-SHA3,
Raw-SHA384, restic, ripemd-128, ripemd-160, rsvp, RVARY, Siemens-S7,
Salted-SHA1, SSHA512, sapb, sapg, saph, sappse, securezip, 7z, Signal, SIP,
skein-256, skein-512, skey, SL3, Snefru-128, Snefru-256, LastPass, SNMP,
solarwinds, SSH, sspr, Stribog-256, Stribog-512, STRIP, SunMD5, SybaseASE,
Sybase-PROP, tacacs-plus, tcp-md5, telegram, tezos, Tiger, tc_aes_xts,
tc_ripemd160, tc_ripemd160boot, tc_sha512, tc_whirlpool, vdi, OpenVMS, vmx,
VNC, vtp, wbb3, whirlpool, whirlpool0, whirlpool1, wpapsk, wpapsk-pmk,
xmpp-scram, xsha, xsha512, zed, ZIP, ZipMonster, plaintext, has-160,
HMAC-MD5, HMAC-SHA1, HMAC-SHA224, HMAC-SHA256, HMAC-SHA384, HMAC-SHA512,
dummy, crypt
```

### Démarrage rapide

- Craque le mot de passe de l'utilisateur `vagrant` :

```zsh
┌──(vagrant㉿kali)-[~]
└─$ john --format=crypt mypasswd
Using default input encoding: UTF-8
Loaded 1 password hash (crypt, generic crypt(3) [?/64])
Cost 1 (algorithm [1:descrypt 2:md5crypt 3:sunmd5 4:bcrypt 5:sha256crypt 6:sha512crypt]) is 0 for all loaded hashes
Cost 2 (algorithm specific iterations) is 1 for all loaded hashes
Will run 2 OpenMP threads
Proceeding with single, rules:Single
Press 'q' or Ctrl-C to abort, almost any other key for status
vagrant          (vagrant)
1g 0:00:00:00 DONE 1/3 (2023-03-11 02:40) 1.851g/s 177.7p/s 177.7c/s 177.7C/s vagrant..vagrant}
Use the "--show" option to display all of the cracked passwords reliably
Session completed.

┌──(vagrant㉿kali)-[~]
└─$ john --show mypasswd
vagrant:vagrant:1000:1000:vagrant,,,:/home/vagrant:/usr/bin/zsh

1 password hash cracked, 0 left
```

### Modes d'action

John dispose de plusieurs modes d'actions, le mode simple, l'attaque par dictionnaire, le mode incrémental, .... Par défaut, ces trois premiers modes sont exécutés dans cet ordre l'un après l'autre, bien qu'il soit possible de lancer `john` directement dans un des modes.

#### Mode simple (_single_)

Dans le mode simple, `john` effectue quelques transformations sur le nom d'utilisateur, pour casser les mots de passe les plus faibles. Pour l'utilisateur toto, il essayerait "ToTo, toto123, ToTo123, etc.". Ce mode est le plus rapide à effectuer, un mot de passe qui serait cassé par cette méthode serait un (très) mauvais mot de passe.

```zsh
┌──(vagrant㉿kali)-[~]
└─$ john --single mypasswd
Using default input encoding: UTF-8
No password hashes loaded (see FAQ)

┌──(vagrant㉿kali)-[~]
└─$ john --single --format=crypt mypasswd
Using default input encoding: UTF-8
Loaded 1 password hash (crypt, generic crypt(3) [?/64])
Cost 1 (algorithm [1:descrypt 2:md5crypt 3:sunmd5 4:bcrypt 5:sha256crypt 6:sha512crypt]) is 0 for all loaded hashes
Cost 2 (algorithm specific iterations) is 1 for all loaded hashes
Will run 2 OpenMP threads
Press 'q' or Ctrl-C to abort, almost any other key for status
vagrant          (vagrant)
1g 0:00:00:00 DONE (2023-03-11 02:42) 1.851g/s 177.7p/s 177.7c/s 177.7C/s vagrant..vagrant}
Use the "--show" option to display all of the cracked passwords reliably
Session completed.
```

#### Par dictionnaire

> [Attaque par dictionnaire](https://fr.wikipedia.org/wiki/Attaque_par_dictionnaire)

Dans ce mode, `john` essaye un à un tous les mots d'une liste (par défaut, `password.lst` fournie contenant plus de 3000 mots) de mots de passe potentiels, en leur appliquant les mêmes transformations que dans le mode précédent.

Il est possible de spécifier sa propre liste de mots avec l'option `--wordlist=chemin/vers/le/fichier` :

```zsh
┌──(vagrant㉿kali)-[~]
└─$ ls -l /usr/share/john/password.lst
-rw-r--r-- 1 root root 26326 Nov  2  2021 /usr/share/john/password.lst

┌──(vagrant㉿kali)-[~]
└─$ wc -l /usr/share/john/password.lst
3559 /usr/share/john/password.lst

┌──(vagrant㉿kali)-[~]
└─$ echo -e "123456\npassword\nazerty\nqwerty" > wordlist.lst

┌──(vagrant㉿kali)-[~]
└─$ cat wordlist.lst
123456
password
azerty
qwerty

┌──(vagrant㉿kali)-[~]
└─$ john --wordlist=wordlist.lst --rules --format=crypt mypasswd

Using default input encoding: UTF-8
Loaded 1 password hash (crypt, generic crypt(3) [?/64])
Cost 1 (algorithm [1:descrypt 2:md5crypt 3:sunmd5 4:bcrypt 5:sha256crypt 6:sha512crypt]) is 0 for all loaded hashes
Cost 2 (algorithm specific iterations) is 1 for all loaded hashes
Will run 2 OpenMP threads
Press 'q' or Ctrl-C to abort, almost any other key for status
0g 0:00:00:01 DONE (2023-03-11 02:49) 0g/s 113.2p/s 113.2c/s 113.2C/s Qwerty9..Qwertying
Session completed.

┌──(vagrant㉿kali)-[~]
└─$ john --show mypasswd
0 password hashes cracked, 0 left

┌──(vagrant㉿kali)-[~]
└─$ echo -e "vagrant" >> wordlist.lst

┌──(vagrant㉿kali)-[~]
└─$ john --wordlist=wordlist.lst --rules --format=crypt mypasswd

Using default input encoding: UTF-8
Loaded 1 password hash (crypt, generic crypt(3) [?/64])
Cost 1 (algorithm [1:descrypt 2:md5crypt 3:sunmd5 4:bcrypt 5:sha256crypt 6:sha512crypt]) is 0 for all loaded hashes
Cost 2 (algorithm specific iterations) is 1 for all loaded hashes
Will run 2 OpenMP threads
Press 'q' or Ctrl-C to abort, almost any other key for status
vagrant          (vagrant)
1g 0:00:00:00 DONE (2023-03-11 03:25) 1.694g/s 162.7p/s 162.7c/s 162.7C/s 123456..Ytrewq
Use the "--show" option to display all of the cracked passwords reliably
Session completed.

┌──(vagrant㉿kali)-[~]
└─$ john --show mypasswd
vagrant:vagrant:1000:1000:vagrant,,,:/home/vagrant:/usr/bin/zsh

1 password hash cracked, 0 left
```

#### Mode incrémental

> [Attaque par force brute](https://fr.wikipedia.org/wiki/Attaque_par_force_brute)

Dans ce mode, `john` va essayer toutes les combinaisons de caractères possibles, jusqu'à trouver le mot de passe. Tous les caractères étant testés, ce mode est techniquement infaillible, bien que la robustesse du mot de passe influe grandement sur le temps de calcul nécessaire à le trouver.

Afin d'augmenter la pertinence de l'algorithme, `john` implémente la recherche des caractères par fréquence d'utilisation, pour rechercher d'abord les caractères les plus utilisés statistiquement.

> Le coût d'une attaque par force brute est proportionnel aux nombres de combinaisons : cela dépend de la longueur (`lg`) du mot de passe et du nomnbre de caractères acceptées (lalphabet, `n`) soit n^lg

```zsh
┌──(vagrant㉿kali)-[~]
└─$ john --list=inc-modes
digits
upper
lower
lowerspace
uppernum
lowernum
alpha
alnum
alnumspace
lanman
lm_ascii
ascii
latin1
utf8
custom
```

L'option `--incremental` (ou `-i`) utilisera les paramètres de mode "incrémental" par défaut. Les paramètres `[Incremental:ASCII]` sont définis pour utiliser le jeu de caractères ASCII imprimable complet (95 caractères) et pour essayer toutes les longueurs de mot de passe possibles de 0 à 13.

C'est parti ! ...

```zsh
┌──(vagrant㉿kali)-[~]
└─$ john --incremental --format=crypt mypasswd
Using default input encoding: UTF-8
Loaded 1 password hash (crypt, generic crypt(3) [?/64])
Cost 1 (algorithm [1:descrypt 2:md5crypt 3:sunmd5 4:bcrypt 5:sha256crypt 6:sha512crypt]) is 0 for all loaded hashes
Cost 2 (algorithm specific iterations) is 1 for all loaded hashes
Will run 2 OpenMP threads
Press 'q' or Ctrl-C to abort, almost any other key for status
Session aborted

┌──(vagrant㉿kali)-[~]
└─$ ls -l .john
total 40
-rw------- 1 vagrant vagrant 30467 Mar 11 04:41 john.log
-rw------- 1 vagrant vagrant     0 Mar 11 03:48 john.pot
-rw------- 1 vagrant vagrant   169 Mar 11 04:41 john.rec
```

Toujours rien ! `Ctrl-C`

On peut restaurer la session :

```zsh
┌──(vagrant㉿kali)-[~]
└─$ john --restore=./.john/john
Loaded 1 password hash (crypt, generic crypt(3) [?/64])
Cost 1 (algorithm [1:descrypt 2:md5crypt 3:sunmd5 4:bcrypt 5:sha256crypt 6:sha512crypt]) is 0 for all loaded hashes
Cost 2 (algorithm specific iterations) is 1 for all loaded hashes
Will run 2 OpenMP threads
Proceeding with incremental:ASCII
Press 'q' or Ctrl-C to abort, almost any other key for status
...
```

### MD5

```zsh
┌──(vagrant㉿kali)-[~]
└─$ echo -n "123456" | md5sum | awk '{print $1}' > myhash

┌──(vagrant㉿kali)-[~]
└─$ cat myhash
e10adc3949ba59abbe56e057f20f883e

┌──(vagrant㉿kali)-[~]
└─$ john --list=formats | grep -i 'md5'
descrypt, bsdicrypt, md5crypt, md5crypt-long, bcrypt, scrypt, LM, AFS, 
416 formats (149 dynamic formats shown as just "dynamic_n" here)
aix-ssha512, andOTP, ansible, argon2, as400-des, as400-ssha1, asa-md5, 
django-scrypt, dmd5, dmg, dominosec, dominosec8, DPAPImk, dragonfly3-32, 
mscash2, MSCHAPv2, mschapv2-naive, krb5pa-md5, mssql, mssql05, mssql12, 
net-md5, netntlmv2, netntlm, netntlm-naive, net-sha1, nk, notes, md5ns, 
Padlock, Palshop, Panama, PBKDF2-HMAC-MD4, PBKDF2-HMAC-MD5, PBKDF2-HMAC-SHA1, 
pgpwde, phpass, PHPS, PHPS2, pix-md5, PKZIP, po, postgres, PST, PuTTY, 
Raw-Blake2, Raw-Keccak, Raw-Keccak-256, Raw-MD4, Raw-MD5, Raw-MD5u, Raw-SHA1, 
solarwinds, SSH, sspr, Stribog-256, Stribog-512, STRIP, SunMD5, SybaseASE, 
Sybase-PROP, tacacs-plus, tcp-md5, telegram, tezos, Tiger, tc_aes_xts, 
HMAC-MD5, HMAC-SHA1, HMAC-SHA224, HMAC-SHA256, HMAC-SHA384, HMAC-SHA512,

┌──(vagrant㉿kali)-[~]
└─$ john --format=raw-md5 myhash
Using default input encoding: UTF-8
Loaded 1 password hash (Raw-MD5 [MD5 256/256 AVX2 8x3])
Warning: no OpenMP support for this hash type, consider --fork=2
Proceeding with single, rules:Single
Press 'q' or Ctrl-C to abort, almost any other key for status
Almost done: Processing the remaining buffered candidate passwords, if any.
Proceeding with wordlist:/usr/share/john/password.lst
123456           (?)
1g 0:00:00:00 DONE 2/3 (2023-03-11 05:02) 100.0g/s 38400p/s 38400c/s 38400C/s 123456..larry
Use the "--show --format=Raw-MD5" options to display all of the cracked passwords reliably
Session completed.

┌──(vagrant㉿kali)-[~]
└─$ john --show --format=raw-md5 myhash
?:123456

1 password hash cracked, 0 left
```

## Missions

[John the Ripper](https://fr.wikipedia.org/wiki/John_the_Ripper) est utilisé dans les missions suivantes :

- [Admin - Mission n°1](../../missions/README.md) : Contrôler la robustesse des mots de passe des utilisateurs
- [Webcam - Mission n°1](../../missions/securite/webcam/telnet.md) : Obtenir le mot de passe de root de l'accès telnet

## Voir aussi

- [Cassage de mot de passe](https://fr.wikipedia.org/wiki/Cassage_de_mot_de_passe) : processus de récupération de mots de passe
- [Fonction de hachage cryptographique](https://fr.wikipedia.org/wiki/Fonction_de_hachage_cryptographique)

> Il existe de nombreux logiciels de cassage de mots de passe, les plus populaires sont Aircrack, Cain & Abel, John the Ripper, Ophcrack, Konboot, [hashcat](https://hashcat.net/hashcat/), Hydra, DaveGrohl et ElcomSoft.

- [Hydra](https://github.com/vanhauser-thc/thc-hydra) : logiciel de sécurité informatique permettant de tester les mots de passe sur les services en ligne

Voir aussi : [Outils Hacking](../../outils/hacking.md)

---
©️ LaSalle Avignon - [thierry(dot)vaira(at)gmail(dot)com](thierry.vaira@gmail.com)
