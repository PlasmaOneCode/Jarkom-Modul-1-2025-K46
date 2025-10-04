# Cek apakah setiap client dapat tersambung ke internet
telnet 10.15.43.32 5352 (Melkor)
telnet 10.15.43.32 5353 (Manwe)
telnet 10.15.43.32 5354 (Verda)
telnet 10.15.43.32 5355 (Ulmo)
echo nameserver 192.168.122.1 > /etc/resolv.conf