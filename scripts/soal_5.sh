# Tambah setting network node Eru
up apt update
up apt install iptables -y
up apt install vsftpd -y
up apt install ftp
up apt install unzip
up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.234.0.0/16

# Tambah setting network node Melkor, Manwe, Verda, dan Ulmo
up apt update
up apt install vsftpd -y
up apt install ftp
up apt install unzip
up echo nameserver 192.168.122.1 > /etc/resolv.conf