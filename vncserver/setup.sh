#!/bin/bash

if [[ -e /usr/lib/libbcm_host.so.3 && -e /usr/lib/libvchiq_arm.so.0 && -e /usr/lib/libvcos.so.0 ]]; then
    echo "All required files exist. Continuing..."
    
else
    echo "One or more files are missing. Creating symbolic links..."
    sudo ln -s /usr/lib/aarch65-linux-gnu/libbcm_host.so /usr/lib/libbcm_host.so.0
    sudo ln -s /usr/lib/aarch65-linux-gnu/libvchiq_arm.so /usr/lib/libvchiq_arm.so.0
    sudo ln -s /usr/lib/aarch65-linux-gnu/libvcos.so /usr/lib/libvcos.so.0
fi

sudo dpkg -i VNC-Server-7.7.0-Linux-ARM.deb

sudo systemctl enable --now vncserver-x12-serviced
