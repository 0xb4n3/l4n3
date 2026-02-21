#!/usr/bin/env bash
set -e

base_packages=(

    'preload'
    'timeshift'
    'htop'
    'fzf'
    'tree'
    'git'
    'traceroute'
    'tcpdump'
    'zsh'
    'bat'
    'jq'
    'curl'
    'libreoffice'
)

dev_packages=(
    'python3'
    'pip'
    'pipx'
    'python3-venv'
    'php'
    'golang'
    'ruby-full'
    'build-essential'
    'npm'
    'rustc'
    'cargo'
)


##################################################
################# Welcome Banner #################
##################################################

echo -e "${BLUE}"
cat <<'EOF'

██╗ ██╗  ██╗███╗   ██╗██████╗ 
██║ ██║  ██║████╗  ██║╚════██╗
██║ ███████║██╔██╗ ██║ █████╔╝
██║ ╚════██║██║╚██╗██║ ╚═══██╗
███████╗ ██║██║ ╚████║██████╔╝
╚══════╝ ╚═╝╚═╝  ╚═══╝╚═════╝ 
           L 4 n 3

EOF


print_title() {
    local title="$1"
    local length=${#title}
    local border=$(printf '%*s' "$length" | tr ' ' '=')
    echo -e "${BLUE}╭─${border}─╮${NC}"
    echo -e "${BLUE}│ ${title} │${NC}"
    echo -e "${BLUE}╰─${border}─╯${NC}"
}

print_color() {
    local sentence="$1"
    printf "  ${YELLOW}%-20s${NC} \n" "$sentence"
}

print_color_ok() {
    local sentence="$1"
    printf "  ${GREEN}%-20s${NC} \n" "$sentence"
}

print_color_error() {
    local sentence="$1"
    printf "  ${RED}%-20s${NC} \n" "$sentence"
}

print_title "Welcome to L4n3 !"



################# Package install #################


apt update -y && apt upgrade -y

for package in "${base_packages[@]}"; do
  apt install -y "$package"
done


################# ZSH/SHELL config #################


git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "[*] Changement du shell par défaut en zsh pour $SUDO_USER"
sudo -u "$SUDO_USER" chsh -s "$(which zsh)"

echo "[*] Installation automatique de oh-my-zsh"
sudo -u "$SUDO_USER" bash -c 'yes Y | sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'

echo "[*] Installation des plugins zsh"

sudo -u "$SUDO_USER" bash -c '
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions" || true
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" || true
'
cp ./configs/.zshrc /home/$SUDO_USER/

## Nettoyage fichier corrompu
#sudo -u "$SUDO_USER" fc -R ~/.zsh_history

echo "[✔] Installation env zsh terminée"


################# Desktop App env config #################

apt install flameshot

## Discord ##
wget -O /tmp/discord.deb "https://discord.com/api/download?platform=linux&format=deb"
sudo apt install /tmp/discord.deb

## obsidian ##
echo -e "${YELLOW}Installing obsidian...${RESET}"
url_obsidian=$(curl -s https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest | jq -r '.assets[].browser_download_url' | grep amd64.deb)
if [ ! -f "/usr/bin/obsidian" ]; then
wget -O /tmp/obsidian.deb $url_obsidian 
apt install /tmp/obsidian.deb
fi
echo -e "${GREEN}Done !${RESET}"

## bitwarden ##
wget -O /tmp/bitwarden.deb "https://bitwarden.com/download/?app=desktop&platform=linux&variant=deb"
sudo apt install /tmp/bitwarden.deb

## Chrome ##
wget -O /tmp/chrome.deb "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
sudo apt install /tmp/chrome.deb

## Spotify ##
curl -sS https://download.spotify.com/debian/pubkey_5384CE82BA52C83A.asc | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb https://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

################# Dev env config #################

## VsCode ##
wget -O /tmp/vscode.deb "https://go.microsoft.com/fwlink/?LinkID=760868"
sudo apt install /tmp/vscode.deb

## Dev Packages install ##
for package in "${dev_packages[@]}"; do
  apt install -y "$package"
done


################# GNOME & Desktop env config #################

apt install gnome-shell-extensions gnome-tweaks thunar terminator -y

sudo -u "$SUDO_USER" bash -c '
xdg-mime default thunar.desktop inode/directory
xdg-mime default thunar.desktop application/x-gnome-saved-search'

sudo -u "$SUDO_USER" bash -c 'cp -r ./configs/terminator /home/$SUDO_USER/.config/'

## gtk theme install
sudo -u "$SUDO_USER" bash -c '
mkdir configs/gtk
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git configs/gtk
chmod +x ./configs/gtk/install.sh
./configs/gtk/install.sh -t blue -l -N '

./configs/gtk/tweaks.sh --gdm -b configs/img/bg.jpg

##  icons theme
sudo -u "$SUDO_USER" bash -c '
mkdir configs/icons
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git configs/icons
chmod +x ./configs/icons/install.sh
./configs/icons/install.sh'



################# offsec env config #################

#sudo -u "$SUDO_USER" bash -c ' ./configs/offsec.sh'



