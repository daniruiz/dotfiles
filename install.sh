#!/bin/sh

cp -rfv .config .local ~/
for i in .bashrc .zshrc .gitconfig .gitattributes
do
  ln -rsfv $i ~/$i
  sudo ln -rsfv $i /root/$i
done

echo Configure QT theme
grep -q QT_QPA_PLATFORMTHEME=qt5ct /etc/environment \
  || echo QT_QPA_PLATFORMTHEME=qt5ct | sudo tee -a /etc/environment

sudo cp -rv .local/share/qt5ct /usr/share

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
