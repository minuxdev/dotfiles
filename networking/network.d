#!/bin/bash

function networkd() {
  sudo cp -r ~/dotfiles/networking/network /etc/systemd/

  sudo systemctl enable --now systemd-networkd
}
