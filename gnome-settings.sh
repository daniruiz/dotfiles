#!/bin/sh

gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ use-theme-colors true
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ scrollback-unlimited true
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ palette "['#1F2229', '#D41919', '#5EBDAB', '#FEA44C', '#367bf0', '#9755b3', '#49AEE6', '#E6E6E6', '#198388', '#EC0101', '#47D4B9', '#FF8A18', '#277FFF', '#962ac3', '#05A1F7', '#FFFFFF']"
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ bold-is-bright true

gsettings set org.gnome.shell.extensions.user-theme name 'Flat-Remix-Blue'

gsettings set org.gnome.desktop.interface icon-theme 'Flat-Remix-Blue'
gsettings set org.gnome.desktop.interface gtk-theme 'Flat-Remix-GTK-Blue'
gsettings set org.gnome.desktop.interface monospace-font-name 'FiraCode Nerd Font Medium 10'

gsettings set org.gnome.gedit.preferences.editor scheme Flat-Remix

gsettings set org.gnome.gnome-system-monitor cpu-stacked-area-chart true
gsettings set org.gnome.gnome-system-monitor cpu-colors "[(0, '#fd3535'), (1, '#fd7d00'), (2, '#ffc730'), (3, '#0ca15e'), (4, '#14816c'), (5, '#4aaee6'), (6, '#367bf0'), (7, '#265ab1'), (8, '#153873'), (9, '#8c42ab'), (10, '#b8174c'), (11, '#d41919')]"
gsettings set org.gnome.gnome-system-monitor mem-color '#B8174C'
gsettings set org.gnome.gnome-system-monitor swap-color '#19a187'
gsettings set org.gnome.gnome-system-monitor net-in-color '#367BF0'
gsettings set org.gnome.gnome-system-monitor net-out-color '#D41919'
