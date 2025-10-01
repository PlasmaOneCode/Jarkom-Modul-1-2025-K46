# Jarkom-Modul-1-2025-K46

===========[Kelompok 46]=============

Mutiara Diva Jaladitha - 5027241083

Abiyyu Raihan Putra Wikanto - 5027241042

============[PENJELASAN SOAL]=============
## soal_1 
Untuk mempersiapkan pembuatan entitas selain mereka, Eru yang berperan sebagai Router membuat dua Switch/Gateway. Dimana Switch 1 akan menuju ke dua Ainur yaitu Melkor dan Manwe. Sedangkan Switch 2 akan menuju ke dua Ainur lainnya yaitu Varda dan Ulmo. Keempat Ainur tersebut diberi perintah oleh Eru untuk menjadi Client.
## Langkah pengerjaan
1. Buka http://10.15.43.32/ di browswe. Buat project dengan nama Modul-1-K-46
2. Klik kanan pada node, buka Configure
3. Pada menu General settings, cari tombol Edit network configuration
4.	Di situ kalian bisa setup IP sesuai dengan interface yang digunakan. Interface adalah sesuatu yang digunakan untuk menghubungkan dua device
5.	Buka menu Add a Node
6.	Tarik NAT ke area kosong
7.	Gunakan aktifkan menu Add a Link
8.	Lalu klik node, pilih interface eth0, dan klik node NAT yang ditarik tadi
9.	Lalu konfigurasi IP dari node ubuntu
•	Cari 2 line yang seperti ini
```
# auto eth0
# iface eth0 inet dhcp
```
•	Uncomment kedua line tersebut, lalu save
```
auto eth0
iface eth0 inet dhcp
```
10. Start node
11. Akses console dari node, dan coba ping ke google
12. Ganti nama node ini menjadi Eru dengan fitur Change hostname di node, dan juga ganti symbol ke simbol router dengan fitur Change symbol
13. Tambahkan beberapa node ethernet switch dan ubuntu, lalu buat hubungan antar node dan nama-nama dari node hingga seperti di gambar
2.	Gunakan fitur Change hostname untuk merubah nama-nama dari node


## soal_2
Karena menurut Eru pada saat itu Arda (Bumi) masih terisolasi dengan dunia luar, maka buat agar Eru dapat tersambung ke internet.
## Langkah pengerjaan
1. Setting network node Eru dengan fitur Edit network configuration, kita bisa menghapus semua settingnya dan mengisi dengan settingan di bawah
•	Eru
```
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
```
2. Restart semua node
3. Cek semua node ubuntu apakah sudah memiliki ip yang sesuai dengan settingan dengan command ip a.
4. Topologi yang dibuat sudah bisa berjalan secara lokal, tetapi kita belum bisa mengakses jaringan keluar. Maka kita perlu melakukan beberapa hal.
•	Ketikkan command `iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s [Prefix IP].0.0/16` pada router Eru
•	Ketikkan command `cat /etc/resolv.conf di Eru`
Semua node sekarang sudah bisa melakukan ping ke google, yang artinya adalah sudah tersambung ke internet 

## soal_3 
Sekarang pastikan agar setiap Ainur (Client) dapat terhubung satu sama lain.
### Langkah pengerjaan
1. Setting network masing-masing node dengan fitur Edit network configuration, kita bisa menghapus semua settingnya dan mengisi dengan settingan di bawah
•	Melkor
```
auto eth0
iface eth0 inet static
address [Prefix IP].1.2
netmask 255.255.255.0
gateway [Prefix IP].1.1
```

•	Manwe
```
auto eth0
iface eth0 inet static
address 192.234.1.3
netmask 255.255.255.0
gateway 192.234.1.1
```

•	Varda
```
auto eth0
iface eth0 inet static
	address 192.234.2.2
	netmask 255.255.255.0
	gateway 192.234.2.1
```

•	Ulmo
```
auto eth0
iface eth0 inet static
address 192.234.2.3
netmask 255.255.255.0
gateway 192.234.2.1
```

## soal_4
Setelah berhasil terhubung, sekarang Eru ingin agar setiap Ainur (Client) dapat mandiri. Oleh karena itu pastikan agar setiap Client dapat tersambung ke internet.
### Langkah pengerjaan
1. Cek apakah setiap client dapat tersambung ke internet
•	Melkor
```
telnet 10.15.43.32 5352
```
```
echo nameserver 192.168.122.1 > /etc/resolv.conf
```
•	Manwe
```
telnet 10.15.43.32 5353
```
```
echo nameserver 192.168.122.1 > /etc/resolv.conf
```

•	Varda
```
telnet 10.15.43.32 5354
```
```
echo nameserver 192.168.122.1 > /etc/resolv.conf
```

•	Ulmo
```
telnet 10.15.43.32 5355
```
```
echo nameserver 192.168.122.1 > /etc/resolv.conf
```

## soal_5
Ainur terkuat Melkor tetap berusaha untuk menanamkan kejahatan ke dalam Arda (Bumi). Sebelum terjadi kerusakan, Eru dan para Ainur lainnya meminta agar semua konfigurasi tidak hilang saat semua node di restart.
### Langkah pengerjaan
1. Setting network node Eru dengan fitur Edit network configuration, kita bisa menambahkan code di bawah
```
up apt update
up apt install iptables -y
up apt install vsftpd -y
up apt install ftp
up apt install unzip
up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.234.0.0/16
```
2. Setting network node Melkor, Manwe, Verda, dan Ulmo dengan fitur Edit network configuration, kita bisa menambahkan code di bawah
```
up apt update
up apt install vsftpd -y
up apt install ftp
up apt install unzip
up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

## soal_6
Setelah semua Ainur terhubung ke internet, Melkor mencoba menyusup ke dalam komunikasi antara Manwe dan Eru. Jalankan file berikut (link file) lalu lakukan packet sniffing menggunakan Wireshark pada koneksi antara Manwe dan Eru, lalu terapkan display filter untuk menampilkan semua paket yang berasal dari atau menuju ke IP Address Manwe. Simpan hasil capture tersebut sebagai bukti.
### Langkah pengerjaan
1. Jalankan command di bawah di Manwe untuk mengunduh file yang dimaksud.
```
wget --no-check-certificate "https://drive.usercontent.google.com/u/0/uc?id=1bE3kF1Nclw0VyKq4bL2VtOOt53IC7lG5&export=download" -O traffic.zip
```
2. Unzip `traffic.zip`
3. Jalankan `chmod +x traffic.sh` untuk menambah izin execute.
4. Buka project di GNS3 Client. Klik kanan pada link antara Switch1 dan Manwe
5. Klik start capture, maka akan langsung diarahkan ke wireshark.
6. Jalankan traffic.sh
```
./traffic.sh
```
8. Buka wireshark. Jika berhasil, traffic akan muncul di wireshark.
9. Jika file sudah selesai dijalankan, stop capture lalu simpan file.

## soal_7
Untuk meningkatkan keamanan, Eru memutuskan untuk membuat sebuah FTP Server di node miliknya. Lakukan konfigurasi FTP Server pada node Eru. Buat dua user baru: ainur dengan hak akses write&read dan melkor tanpa hak akses sama sekali ke direktori shared. Buktikan hasil tersebut dengan membuat file teks sederhana kemudian akses file tersebut menggunakan kedua user.
### Langkah pengerjaan
1. Karena tadi konfigurasi sudah tersimpan, skip step install vsftpd.
2. Buat dan buka file vsftpd, lalu ganti dengan code di bawah 
```
nano /etc/vsftpd.conf
```
```
listen=YES
listen_ipv6=NO
anonymous_enable=NO
local_enable=YES
write_enable=YES
chroot_local_user=YES
allow_writeable_chroot=YES
```
5. Start servis vsftpd
```
service vsftpd start
```
9. Buat direktori shared
```
mkdir -p /srv/ftp/shared
```
11. Tambahkan user ainur dan melkor. Lalu atur izinnya sesuai dengan soal.
```
adduser ainur
adduser melkor
usermod -d /srv/ftp ainur
usermod -d /srv/ftp/shared melkor
chown ainur:ainur /srv/ftp/shared
chmod 700 /srv/ftp/shared
```
8. Masuk ke ftp
```
ftp 192.234.1.1
```
11. Buat file bebas.
12. Coba akses file tersebut menggunakan user ainur dan melkor.

## soal_8
Ulmo, sebagai penjaga perairan, perlu mengirimkan data ramalan cuaca ke node Eru. Lakukan koneksi sebagai client dari node Ulmo ke FTP Server Eru menggunakan user ainur. Upload sebuah file berikut (link file). Analisis proses ini menggunakan Wireshark dan identifikasi perintah FTP yang digunakan untuk proses upload.
### Langkah pengerjaan
ULMO
1. Jalankan command di bawah di Manwe untuk mengunduh file yang dimaksud.
```
wget --no-check-certificate "https://drive.usercontent.google.com/u/0/uc?id=11ra_yTV_adsPIXeIPMSt0vrxCBZu0r33&export=download" -O cuaca.zip
```
3. Unzip `cuaca.zip`
5. Start servis vsftpd
```
service vsftpd start
```
6. Buka project di GNS3 Client. Klik kanan pada link antara Switch2 dan Ulmo
7. Klik start capture, maka akan langsung diarahkan ke wireshark.
8. Kembali ke kali, masuk ke ftp
```
ftp 192.234.1.1
```
9. Taruh isi file cuaca.zip di ftp
```
put cuaca.txt
put mendung.jpg
```
8. Buka wireshark. Jika berhasil, proses upload akan muncul di wireshark.
9. Stop capture lalu simpan file.

## soal_9
Eru ingin membagikan "Kitab Penciptaan" di (link file) kepada Manwe. Dari FTP Server Eru, download file tersebut ke node Manwe. Karena Eru merasa Kitab tersebut sangat penting maka ia mengubah akses user ainur menjadi read-only. Gunakan Wireshark untuk memonitor koneksi, identifikasi perintah FTP yang digunakan, dan uji akses user ainur.
### Langkah pengerjaan
ERU
1. wget --no-check-certificate "https://drive.usercontent.google.com/u/0/uc?id=11ua2KgBu3MnHEIjhBnzqqv2RMEiJsILY&export=download" -O kitab_penciptaan.zip
2. unzip kitab_penciptaan
3. service vsftpd start
4. ftp 192.234.1.1
5. put kitab_penciptaan.txt
MANWE
6. service vsftpd start
7. ftp 192.234.1.1
8. get kitab_penciptaan.txt
ERU
9. chmod 555 /srv/ftp/shared
10. service vsftpd start
11. nano halo.txt
12. ftp 192.234.1.1
13. put halo.txt

## soal_10
Melkor yang marah karena tidak diberi akses, mencoba melakukan serangan dengan mengirimkan banyak sekali request ke server Eru. Gunakan command ping dari node Melkor ke node Eru dengan jumlah paket yang tidak biasa (spam ping misalnya 100 paket). Amati hasilnya, apakah ada packet loss? Catat average round trip time untuk melihat apakah serangan tersebut mempengaruhi kinerja Eru.
### Langkah pengerjaan


## soal_11
Sebelum era koneksi aman, Eru sering menyelinap masuk ke wilayah Melkor. Eru perlu masuk ke node tersebut untuk memeriksa konfigurasi, namun ia tahu Melkor mungkin sedang memantau jaringan. Buktikan kelemahan protokol Telnet dengan membuat akun dan password baru di node Melkor kemudian menangkap sesi login Eru ke node Melkor menggunakan Wireshark. Tunjukkan bagaimana username dan password dapat terlihat sebagai plain text. 
### Langkah pengerjaan


## soal_12
Eru mencurigai Melkor menjalankan beberapa layanan terlarang di node-nya. Lakukan pemindaian port sederhana dari node Eru ke node Melkor menggunakan Netcat (nc) untuk memeriksa port 21, 80, dalam keadaan terbuka dan port rahasia 666 dalam keadaan tertutup.
### Langkah pengerjaan
MELKOR
1. apt install netcat-openbsd && apt install apache2 -y
2. service vsftpd start
3. vsftpd
4. nc -zv 192.234.1.2 21
5. service apache2 start
6. nc -zv 192.234.1.2 80
7. nc -zv 192.234.1.2 666

## soal_13
Setelah insiden penyadapan Telnet, Eru memerintahkan semua koneksi administratif harus menggunakan SSH (Secure Shell) untuk mengamankan jaringan. Lakukan koneksi SSH dari node Varda ke Eru. Tangkap sesi tersebut menggunakan Wireshark. Analisis dan jelaskan mengapa username dan password tidak dapat dilihat seperti pada sesi Telnet. Tunjukkan paket-paket terenkripsi dalam hasil capture sebagai bukti keamanan SSH.
### Langkah pengerjaan


## soal_14

## soal_15

## soal_16

## soal_17

## soal_18

## soal_19

## soal_20
