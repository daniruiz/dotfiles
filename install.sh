#!/bin/sh

cp -rfv .config .local .gitconfig .bashrc .zshrc ~/
sudo ln -rsfv ~/.bashrc /root/.bashrc
sudo ln -rsfv ~/.zshrc /root/.zshrc
