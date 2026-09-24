# L4n3

B4n3 bash scripts to setup my beautifullycrousti Linux OS

## Setup

```sh
visudo
b4n3 ALL=(ALL:ALL) ALL
```

```sh
chmod +x install.sh
chmod +x configs/offsec.sh
sudo ./install.Sh
```

## Manual things to do

After install, need to do following things manually 

### 1. Gnome

- Installer Gnome extensions : Dash to Dock, Clipboard Indicator, Switcher, User themes, blur-my-shell
- Extensions --> User theme --> whiteSur-Dark-Blue
- Extensions --> Switcher --> config :
    - raccourcis : `super+d`
- extension --> Dash to Dock
- Extensions système :
- config flameshot raccourcis : paramètres --> clavier -- raccourcis --> raccourcis personnalisés --> commande `flameshot gui`
- icons : tweaks --> apparence --> whitesur-Dark-blue
- Configs raccourcis workspace
- cp `.obsidian` à la racine du vault

- terminator : --> profil --> couleurs --> utiliser un background transparent
- paramètre --> système --> utilisateurs --> changer img profile

```sh
dconf reset -f /org/gnome/
```

#### 2. System
- config timeshift backup
- import wordlists dir
- install docker

#### 3. Offsec

- Install Burp and extensions

## Tools - env - config
---

### Linux tools

- zsh
- wget
- preload
- timeshift
- htop
- tcpdump
- traceroute
- tree
- git
- bat
- fzf
- jq



### zsh

- Oh my Zsh
- Oh my zsh Plugins : Sudo, Web Search, copypath, Copyfile
- zsh puglins - Zsh-autosuggestions, Zsh-syntax-highlighting :
    - https://github.com/zsh-users/zsh-autosuggestions
    - https://github.com/zsh-users/zsh-syntax-highlighting
- Custom theme
- Custom .zshrc dans ./configs

### Desktop Tools

- Chrome
- Discord
- Bitwarden
- Obsidian
- Spotify
- libreoffice



### Dev tools

- vscode
- python :
    - pip
    - venv
- php
- golang
- ruby
- gcc
- npm
- node
- rust
- db browser for sqlite


### GNOME & Desktop ENV

- packages
- Gnome extensions : Dash to Dock, Clipboard Indicator, Switcher, User themes, blur-my-shell
- terminator :
    - `terminator/config`
- gtk theme : whitesur


### Offsec tools

#### ad-windows

- nxc
- bloodhound docker
- bloodhound python
- bloodyAD
- certipy
- coercer
- enum4linux-ng
- Ghostpack-CompiledBinaries
- Impacket
- kerbrute
- krbrelayx
- ldeep
- PetitPotam
- PowerSharpPack
- PowerUpSQL/
- pywhisker
- Responder
- RunasCSs
- RustHound
- SharpHound
- targetedKerberoast
- mimikatz
- winPeas
- Lazagne

#### cracking

- john
- hashcat
- username anarchy

#### pivot

- chisel
- ligolo-ng

#### linux

- linpeas.sh
- PwnKit
- traitor

#### Web

- Burpsuite
    - Extensions: PwnFox, hackvektor, auth analyze, json web token, jwt editor, param miner
- ffuf
- subfinder
- paramspider
- jwt_tool
- sqlmap
- wpscan
- git-dumper


#### Misc

- nmap
- seclist
- wordlists
- wireshark



## To do

- definir thunar et terminator default








