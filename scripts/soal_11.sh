# Jalankan command-command berikut di Melkor
1. adduser jala
2. apt install telnetd -y
3. apt install openbsd-inetd -y
4. echo "telnet stream tcp nowait root /usr/sbin/telnetd telnetd" >> /etc/inetd.conf
5. service openbsd-inetd restart

# Jalankan command-command berikut di Eru
7. telnet 10.15.43.32 5352