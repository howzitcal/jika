#!/bin/bash

echo "Welcome"

DOWNLOAD_PATH=$HOME/Downloads/tmp
mkdir -p $DOWNLOAD_PATH

# Fetch all the named args
while [ $# -gt 0 ]; do
   if [[ $1 == *"--"* ]]; then
        v="${1/--/}"
        declare $v="$2"
   fi
  shift
done

sudo apt update
sudo apt upgrade -yq

# remove un-used extensions
gnome-extensions disable ding@rastersoft.com
gnome-extensions disable ubuntu-dock@ubuntu.com
gnome-extensions disable tiling-assistant@ubuntu.com
gnome-extensions disable tiling-assistant@ubuntu.com

# apt removes
sudo apt remove -yq gnome-shell-extension-desktop-icons-ng gnome-shell-extension-ubuntu-dock gnome-shell-extension-ubuntu-tiling-assistant yelp

dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/login-shell true

gdbus call --session --dest org.gnome.Shell.Extensions --object-path /org/gnome/Shell/Extensions --method org.gnome.Shell.Extensions.InstallRemoteExtension "AlphabeticalAppGrid@stuarthayhurst"
gdbus call --session --dest org.gnome.Shell.Extensions --object-path /org/gnome/Shell/Extensions --method org.gnome.Shell.Extensions.InstallRemoteExtension "Always-Show-Titles-In-Overview@gmail.com"
gdbus call --session --dest org.gnome.Shell.Extensions --object-path /org/gnome/Shell/Extensions --method org.gnome.Shell.Extensions.InstallRemoteExtension "batterytimepercentagecompact@sagrland.de"
gdbus call --session --dest org.gnome.Shell.Extensions --object-path /org/gnome/Shell/Extensions --method org.gnome.Shell.Extensions.InstallRemoteExtension "caffeine@patapon.info"
gdbus call --session --dest org.gnome.Shell.Extensions --object-path /org/gnome/Shell/Extensions --method org.gnome.Shell.Extensions.InstallRemoteExtension "dash-to-panel@jderose9.github.com"
gdbus call --session --dest org.gnome.Shell.Extensions --object-path /org/gnome/Shell/Extensions --method org.gnome.Shell.Extensions.InstallRemoteExtension "mediacontrols@cliffniff.github.com"
gdbus call --session --dest org.gnome.Shell.Extensions --object-path /org/gnome/Shell/Extensions --method org.gnome.Shell.Extensions.InstallRemoteExtension "mute-unmute@mcast.gnomext.com"
gdbus call --session --dest org.gnome.Shell.Extensions --object-path /org/gnome/Shell/Extensions --method org.gnome.Shell.Extensions.InstallRemoteExtension "Vitals@CoreCoding.com"
gdbus call --session --dest org.gnome.Shell.Extensions --object-path /org/gnome/Shell/Extensions --method org.gnome.Shell.Extensions.InstallRemoteExtension "just-perfection-desktop@just-perfection"
gdbus call --session --dest org.gnome.Shell.Extensions --object-path /org/gnome/Shell/Extensions --method org.gnome.Shell.Extensions.InstallRemoteExtension "tiling-assistant@leleat-on-github"

sleep 20

# extension customization: panel
dconf write /org/gnome/shell/extensions/dash-to-panel/panel-element-positions "'{\"0\":[{"element":"showAppsButton","visible":true,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}],"GSM-506TFSS0L142":[{"element":"showAppsButton","visible":true,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}]}'"
dconf write /org/gnome/shell/extensions/dash-to-panel/trans-panel-opacity 0.80000000000000004
dconf write /org/gnome/shell/extensions/dash-to-panel/trans-use-dynamic-opacity true
dconf write /org/gnome/shell/extensions/dash-to-panel/trans-dynamic-anim-target 1.0
dconf write /org/gnome/shell/extensions/dash-to-panel/appicon-padding 6
dconf write /org/gnome/shell/extensions/dash-to-panel/global-border-radius 0
dconf write /org/gnome/shell/extensions/dash-to-panel/appicon-margin 2
dconf write /org/gnome/shell/extensions/dash-to-panel/dot-style-unfocused "'SQUARES'"
dconf write /org/gnome/shell/extensions/dash-to-panel/dot-style-focused "'SQUARES'"
dconf write /org/gnome/shell/extensions/dash-to-panel/scroll-icon-action "'NOTHING'"
dconf write /org/gnome/shell/extensions/dash-to-panel/click-action "'TOGGLE-SHOWPREVIEW'"
dconf write /org/gnome/shell/extensions/dash-to-panel/scroll-panel-action "'SWITCH_WORKSPACE'"
dconf write /org/gnome/shell/extensions/dash-to-panel/overview-click-to-exit true
dconf write /org/gnome/shell/extensions/dash-to-panel/focus-highlight-dominant true

# extension customization: app indicator customizations
dconf write /org/gnome/shell/extensions/appindicator/icon-size 22
dconf write /org/gnome/shell/extensions/appindicator/tray-pos "'center'"

# extension customization: media controls
dconf write /org/gnome/shell/extensions/mediacontrols/extension-index 'uint32 0'
dconf write /org/gnome/shell/extensions/mediacontrols/show-player-icon false
dconf write /org/gnome/shell/extensions/mediacontrols/show-control-icons-seek-backward false
dconf write /org/gnome/shell/extensions/mediacontrols/show-control-icons-seek-forward false
dconf write /org/gnome/shell/extensions/mediacontrols/extension-position "'Right'"

# extension customization: vitals
dconf write /org/gnome/shell/extensions/vitals/hot-sensors "['_processor_usage_', '_memory_usage_', '__network-tx_max__', '__network-rx_max__']"
dconf write /org/gnome/shell/extensions/vitals/use-higher-precision true
sconf write /org/gnome/shell/extensions/vitals/menu-centered true

# extension customization: caffine customizations
dconf write /org/gnome/shell/extensions/caffeine/show-indicator "'always'"
dconf write /org/gnome/shell/extensions/caffeine/enable-mpris true

# adjust ubuntu tiling
dconf write /org/gnome/shell/extensions/tiling-assistant/enable-tiling-popup false
dconf write /org/gnome/shell/extensions/tiling-assistant/active-window-hint 0

# install jetbrains font
wget https://github.com/howzitcal/jika/raw/refs/heads/main/assets/jetbrains-fonts.tar -O $DOWNLOAD_PATH/jetbrains-fonts.tar
sudo tar -xf $DOWNLOAD_PATH/jetbrains-fonts.tar -C /usr/share/fonts/truetype/ --wildcards "*.ttf"
fc-cache -f

# gnome customizations
gsettings set org.gnome.desktop.interface enable-hot-corners true
gsettings set org.gnome.desktop.interface monospace-font-name 'Jetbrains Mono 13'
gsettings set org.gnome.desktop.notifications show-in-lock-screen false
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
gsettings set org.gnome.desktop.interface clock-show-seconds true

# remove all shell favorite icons
dconf write /org/gnome/shell/favorite-apps "['']"

#just perfection extension
dconf write /org/gnome/shell/extensions/just-perfection/animation 4
dconf write /org/gnome/shell/extensions/just-perfection/notification-banner-position 5

# remove un-used snaps
sudo snap remove --no-wait snap-store firefox

sudo apt-get install -yq papirus-icon-theme gnome-software-plugin-snap gnome-software-plugin-flatpak gnome-shell-extension-manager vlc tilix
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

dconf write /com/gexperts/Tilix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/background-transparency-percent 4
dconf write /com/gexperts/Tilix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/login-shell true

sudo apt-get -yq remove gnome-terminal

if [[ -v dev ]]; then
    echo "[INFO] installing dev tools"

    # dbeaver
    wget -c https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb -O $DOWNLOAD_PATH/dbeaver.deb
    sudo apt install -yq $DOWNLOAD_PATH/dbeaver.deb

    # docker
    for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
    sudo apt-get update
    sudo apt-get install -yq ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt-get -yq install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    sudo usermod -aG docker $USER

    # code
    echo "code code/add-microsoft-repo boolean true" | sudo debconf-set-selections
    sudo apt-get install wget gpg
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo install -D -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/microsoft.gpg
    rm -f microsoft.gpg
sudo tee /etc/apt/sources.list.d/vscode.sources > /dev/null <<'EOF'
Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Architectures: amd64,arm64,armhf
Signed-By: /usr/share/keyrings/microsoft.gpg
EOF
    sudo apt-get install -yq apt-transport-https
    sudo apt update
    sudo apt-get install -yq code
fi

if [[ -v chrome ]]; then
    echo "[INFO] installing chrome"

    wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O $DOWNLOAD_PATH/chrome.deb
    sudo apt install -yq $DOWNLOAD_PATH/chrome.deb
fi

ssh-keygen -f $HOME/.ssh/id_rsa -N ""

if [[ -v git_username ]]; then
    git config --global user.name "$git_username"
fi

if [[ -v git_email ]]; then
    git config --global user.email "$git_email"
fi

if [[ -v dark_theme ]]; then
    echo "[INFO] Setting up dark theme..."

    gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-blue-dark'
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
    # gsettings set org.gnome.desktop.interface accent-color 'blue'

    sudo snap refresh --no-wait

    mkdir -p $HOME/Pictures/Wallpapers
    wget https://raw.githubusercontent.com/howzitcal/jika/refs/heads/main/assets/wallpapers/simple-waves.png -O $HOME/Pictures/Wallpapers/simple-waves.png
    gsettings set org.gnome.desktop.background picture-uri-dark file://$HOME/Pictures/Wallpapers/simple-waves.png

    sudo flatpak install  --noninteractive -y org.gtk.Gtk3theme.Adwaita-dark
    sudo flatpak override --env=GTK_THEME=Adwaita-dark
fi

if [[ -v slack ]]; then
    flatpak install --noninteractive -y flathub com.slack.Slack
fi

gsettings set org.gnome.desktop.app-folders folder-children "[]"
dconf reset -f /org/gnome/desktop/app-folders/



sudo apt autoremove -yq
rm -rf $DOWNLOAD_PATH