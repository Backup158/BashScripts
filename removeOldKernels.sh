#!/bin/bash
# Lists which Linux kernels are current installed, the current one in use, then uses the apt auto purge to remove the old ones
# dpkg and apt need sudo
dpkg --list | egrep 'linux-image|linux-headers'
uname -r
apt autoremove --purge
