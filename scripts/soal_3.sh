# Setting network masing-masing node dengan fitur Edit network configuration, kita bisa menghapus semua settingnya dan mengisi dengan settingan di bawah

# Melkor
auto eth0
iface eth0 inet static
address 192.234.1.2
netmask 255.255.255.0
gateway 192.234.1.1

# Manwe
auto eth0
iface eth0 inet static
address 192.234.1.3
netmask 255.255.255.0
gateway 192.234.1.1

# Verda
auto eth0
iface eth0 inet static
address 192.234.2.2
netmask 255.255.255.0
gateway 192.234.2.1

# Ulmo
auto eth0
iface eth0 inet static
address 192.234.2.3
netmask 255.255.255.0
gateway 192.234.2.1