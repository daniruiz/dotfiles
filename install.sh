#!/bin/sh

cp -rfv .config .local .gitconfig .bashrc .zshrc ~/
sudo ln -sfv ~/.bashrc /root/.bashrc
sudo ln -sfv ~/.zshrc /root/.zshrc
