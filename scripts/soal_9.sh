# Jalankan command-command berikut di Eru
1. wget --no-check-certificate "https://drive.usercontent.google.com/u/0/uc?id=11ua2KgBu3MnHEIjhBnzqqv2RMEiJsILY&export=download" -O kitab_penciptaan.zip
2. unzip kitab_penciptaan
3. service vsftpd start
4. ftp 192.234.1.1
5. put kitab_penciptaan.txt
# Jalankan command-command berikut di Manwe
6. service vsftpd start
7. ftp 192.234.1.1
8. get kitab_penciptaan.txt
# Jalankan command-command berikut di Eru
9. chmod 555 /srv/ftp/shared
10. service vsftpd start
11. nano halo.txt
12. ftp 192.234.1.1
13. put halo.txt