#!/bin/sh

cp -rfv .config .local .gitconfig .bashrc .zshrc ~/
sudo ln -sfv ~/.bashrc /root/.bashrc
sudo ln -sfv ~/.zshrc /root/.zshrc
[ -f /bin/dash ] && sudo ln -sfv /bin/sh /bin/dash

echo Configure QT theme
echo QT_QPA_PLATFORMTHEME=qt5ct | sudo tee -a /etc/environment
