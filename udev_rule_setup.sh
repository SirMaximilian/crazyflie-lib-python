sudo groupadd plugdev
sudo usermod -a -G plugdev $USER

sudo tee -a /etc/udev/rules.d/99-crazyradio.rules > /dev/null <<EOT
# Crazyradio (normal operation)
SUBSYSTEM=="usb", ATTRS{idVendor}=="1915", ATTRS{idProduct}=="7777", MODE="0664", GROUP="plugdev"
# Bootloader
SUBSYSTEM=="usb", ATTRS{idVendor}=="1915", ATTRS{idProduct}=="0101", MODE="0664", GROUP="plugdev"
EOT

sudo tee -a /etc/udev/rules.d/99-crazyflie.rules > /dev/null <<EOT
SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5740", MODE="0664", GROUP="plugdev"
EOT

sudo udevadm control --reload-rules
sudo udevadm trigger
