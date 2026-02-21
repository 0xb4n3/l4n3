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



## Dev Packages install ##
for package in "${dev_packages[@]}"; do
  apt install -y "$package"
done


################# GNOME & Desktop env config #################

apt install gnome-shell-extensions gnome-tweaks thunar terminator -y

cp -r ./configs/terminator /home/$SUDO_USER/.config/

## gtk theme install
mkdir configs/gtk
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git configs/gtk
chmod +x ./configs/gtk/install.sh
./configs/gtk/install.sh

##  icons theme
mkdir configs/icons
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git configs/icons
chmod +x ./configs/icons/install.sh
./configs/icons/install.sh



################# offsec env config #################

## configs/offsec.sh
