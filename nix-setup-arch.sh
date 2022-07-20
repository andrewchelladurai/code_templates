#
# For Arch Based Distros
# Preferred Distro : Endeavour OS (BSPWM Community Edition)
# https://github.com/EndeavourOS-Community-Editions/bspwm
#

# Convenient aliases for frequent commands are now a part of the .bash_aliases file.
# Download and source the .bash_aliases file from the repo before proceeding. 
# Some steps below require custom aliases to be present for execution.

# Move bash files to config dir and link to it from the home dir
mkdir -p ~/.config/bash/
mv -v ~/.bashrc ~/.config/bash/
ln -s ~/.bashrc ~/.config/bash/.bashrc
ln -s ~/..bash_aliases ~/.config/bash/..bash_aliases
ln -s ~/..bash_profile ~/.config/bash/..bash_profile

# Now reload the modifications
source ~/.bashrc

# Remove all the unnecesary packages from the fresh-install
sudo pacman -R firewalld firefox vi

# Now do a dist-upgrade
upgradesys

# Install necessary apps
TO-DO
sudo paman ktorrent kdiff3 kubuntu-restricted-extras git vlc virtualbox virtualbox-guest-additions-iso kget sqlite filelight gimp google-chrome-stable enpass inkscape digikam xserver-xorg-input-synaptics nordvpn wireguard neovim default-jdk bashtop kate
sudo apt-get install -y --no-install-recommends libreoffice

# Install Nvidia Drivers, this will replace the open-source nouveau drivers.
# A reboot is needed after the reinstall
sudo pacman -S nvidia-installer-dkms && sudo systemctl reboot

# This is for a Wifi Card Bug on HP Pavilion Notebook AB219TX (N8L68PA#ACJ)
# have'nt observred WiFi drops for quite some time
# Do not think this is required any more, however keeping it for records sake.
# sudo sh -c 'echo "options rtl8723be fwlps=0 swlps=0 ips=0 ant_sel=1" >> /etc/modprobe.d/rtl8723be.conf'

# For Android AVD emulation performance
# Installl KVM packages for Linux
# https://developer.android.com/studio/run/emulator-acceleration?utm_source=android-studio#vm-linux
sudo apt-get install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils
sudo adduser $(whoami) kvm

# For bug that shows the extra user on the login screen
# sudo usermod -u 999 libvirt-qemu

# For manually mounting HDD's by label - Use this in the user profile if needed
# Was required for ElementaryOs Luna because of a bug
# Not sure if still needed, keeping for recod's sake
# udisksctl mount -b /dev/disk/by-label/Data