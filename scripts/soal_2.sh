# Setting network node Eru dengan fitur Edit network configuration
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
address 192.234.1.1
netmask 255.255.255.0

auto eth2
iface eth2 inet static
address 192.234.2.1
netmask 255.255.255.0