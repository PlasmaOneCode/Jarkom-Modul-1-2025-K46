# Jalankan command-command berikut di Eru
1. nano /etc/vsftpd.conf
Ganti isinya dengan code berikut
listen=YES
listen_ipv6=NO
anonymous_enable=NO
local_enable=YES
write_enable=YES
chroot_local_user=YES
allow_writeable_chroot=YES
3. service vsftpd start
4. mkdir -p /srv/ftp/shared
5. adduser ainur
adduser melkor
usermod -d /srv/ftp ainur
usermod -d /srv/ftp/shared melkor
chown ainur:ainur /srv/ftp/shared
chmod 700 /srv/ftp/shared
6. nano er.txt
6. ftp 192.234.1.1 (login sbg Ainur)
7. ascii
8. put er.txt 
9. cd shared
10. exit
11. ftp 192.234.1.1 (login sbg Melkor)