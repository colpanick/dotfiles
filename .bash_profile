#!/bin/bash


[ -f .bashrc ] && . .bashrc

# Distro specific overides
DISTRO="$(cat /etc/os-release | grep ^ID | cut -c 4-)"
[ -f ~/.config/distros/$DISTRO/bash_profile] && . ~/.config/distros/$DISTRO/bash_profile

# Local machine overrides (Not meant to be tracked with git)
[ -f ~/.config/distros/bash_profile] && . ~/.config/distros/bash_profile
