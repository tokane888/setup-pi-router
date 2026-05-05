#!/bin/bash

set -euxo pipefail

setup_ip_masquerade() {
    nft add rule inet ap routethrough oifname "wwan0" masquerade
    nft add rule inet ap fward iifname "wwan0" oifname "wlan0" ct state established,related accept
    nft add rule inet ap fward iifname "wlan0" oifname "wwan0" accept
    nft list ruleset > /etc/nftables.conf
}

turn_off_red_led() {
    sudo cp ./resources/etc/systemd/system/disable-pwr-led.service /etc/systemd/system/disable-pwr-led.service 
    sudo systemctl daemon-reload
    systemctl enable --now disable-pwr-led.service 
}

main() {
    sudo apt update -y
    sudo apt install -y tree vim

    setup_ip_masquerade
    turn_off_red_led
}

main
