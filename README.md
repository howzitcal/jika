# jika
Script for ubuntu to slim it down, add flatpak, and customize the DE, as well as add dev tools.

## Ubuntu 24.04 Example:
```bash
time sudo apt install curl && curl -o- https://raw.githubusercontent.com/howzitcal/jika/refs/heads/main/24.04.sh | bash -s -- \
    --dev \
    --dark_theme \
    --chrome \
    --slack \
    --git_username "XX" \
    --git_email "xx@yy.com"
```