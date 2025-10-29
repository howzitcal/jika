# jika
Script for ubuntu to slim it down, add flatpak, and customize the DE, as well as add dev tools.

## Args
 - `--vscode`: **(Optional)** Install VSCode and add microsoft repo for updates
 - `--dbeaver`: **(Optional)** Download and install DBeaver 
 - `--docker`: **(Optional)** Install DockerCE and add repo for updates
 - `--chrome`: **(Optional)** Install Google Chrome and add repo for updates
 - `--brave`: **(Optional)** Install Brave Browser from brave.com
 - `--ssh_keygen`: **(Optional)** Generate simple ssh key in `~/.ssh`
 - `--git_username "John Doe"`: **(Optional)** Set git username
 - `--git_email "john@doe.tech"`: **(Optional)** Set git email
 - `--slack`: **(Optional)** Install a necessary evil from flathub as flatpak
 - `--kooha`: **(Optional)** Install Screen Recorder with mic support and set the shortcut as `Shift + Super + R`

## Ubuntu 24.04 Example:
```bash
time curl -o- https://raw.githubusercontent.com/howzitcal/jika/refs/heads/main/24.04.sh | bash -s -- \
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