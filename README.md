# jika
Script for ubuntu to slim it down, add flatpak, and customize the DE, as well as add dev tools.

## Args
 - `--vscode`: Install VSCode and add microsoft repo for updates
 - `--dbeaver`: Download and install DBeaver 
 - `--docker`: Install DockerCE and add repo for updates
 - `--chrome`: Install Google Chrome and add repo for updates
 - `--brave`: Install Brave Browser from brave.com
 - `--ssh_keygen`: Generate simple ssh key in `~/.ssh`
 - `--git_username "John Doe"`: Set git username
 - `--git_email "john@doe.tech"`: Set git email
 - `--slack`: Install a necessary evil from flathub as flatpak
 - `--kooha`: Install Screen Recorder with mic support and set the shortcut as `Shift + Super + R`

## Ubuntu 24.04 Example:
```bash
time sudo apt install curl && curl -o- https://raw.githubusercontent.com/howzitcal/jika/refs/heads/main/24.04.sh | bash -s -- \
 --vscode \
 --dbeaver \
 --docker \
 --chrome \
 --brave \
 --ssh_keygen \
 --git_username "John Doe" \
 --git_email "john@doe.texh" \
 --slack \
 --kooha
```