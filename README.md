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

_Setelah gagal mengakses FTP, Melkor melancarkan serangan brute force terhadap  Manwe. Analisis file capture yang disediakan dan identifikasi upaya brute force Melkor. (link file) nc 10.15.43.32 3401_

1. Untuk mendapatkan jawaban dari soal yang berada di nc, perlu masuk ke wireshark. Jawaban soal pertama bisa dilihat di bawah wireshark jika sudah membuka file pcapng. Ditemukan hasilnya adalah 500358 paket yang direkam di file pcapng.
2. Untuk mencari dari banyaknya paket upaya masuk yang berhasil, dapat dengan mengurutkan paket mulai dari yang terakhir lalu melakukan follow stream ke paket tersebut untuk melihat username dan password. Ditemukan hasilnya adalah n1enna:y4v4nn4_k3m3nt4r1 (user:pass).
3. Soal berikutnya diminta untuk mencari stream mana yang kredensial itu ditemukan berada. Hal itu bisa dilihat dari follow stream tadi dan berada di bagian kanan bawah windows yang terbuka. Hasilnya adalah 41824.
4. Setelah itu ada juga jawaban untuk soal selanjutnya yaitu mencari tahu tools apa yang digunakan untuk brute force login. Di bagian atas teks follow stream akan ada tulisan tools, jawaban dari soalnya adalah Fuzz Faster U Fool v2.1.0-dev. Setelah menjawab semua soal di nc soal tersebut, maka anda akan mendapatkan flag yaitu KOMJAR25{Brut3_F0rc3_yIQuNLV6DD872kb2LeNKiD4b7}

		===== Question 14 =====
		Difficulty: Easy
		Note: You can exit anytime by typing 'exit'
		
		How many packets are recorded in the pcapng file?
		Format: int
		> 500358
		
		What are the user that successfully logged in?
		Format: user:pass
		> nienna:y4v4nn4_k3m3nt4r1
		
		In which stream were the credentials found?
		Format: int
		> 41824
		
		What tools are used for brute force?
		Format: Hydra v1.8.0-dev
		> Fuzz Faster U Fool v2.1.0-dev
		Congratulations! Here is your flag: KOMJAR25{Brut3_F0rc3_yI0uNLV6DD872kb2LeNKiD4b7}

<img width="513" height="455" alt="image" src="https://github.com/user-attachments/assets/4378227a-8403-4655-9172-103361a7b85b" />
<img width="795" height="685" alt="image" src="https://github.com/user-attachments/assets/ea206710-d58c-4a52-8206-b73dbeb2d3a4" />


## soal_15

_Melkor menyusup ke ruang server dan memasang keyboard USB berbahaya pada node Manwe. Buka file capture dan identifikasi pesan atau ketikan (keystrokes) yang berhasil dicuri oleh Melkor untuk menemukan password rahasia.
(link file) nc 10.15.43.32 3402_

Soal nc dari soal ini dimulai dengan meminta device apa yang digunakan oleh Melkor. Jawabannya bisa dilihat di salah satu paket awal yang terekam di pcap, yaitu Keyboard.

## soal_16

_Melkor semakin murka ia meletakkan file berbahaya di server milik Manwe. Dari file capture yang ada, identifikasi file apa yang diletakkan oleh Melkor.
	(link file) nc 10.15.43.32 3403_

1. Pertama gunakan display filter ftp. Anda akan menemukan seperti berikut :
>229	2019-06-14 06:22:15.930789	216.55.163.106	10.6.13.102	FTP	101	1	Response: 331 User ind@psg420.com OK. Password required
227	2019-06-14 06:22:15.870695	10.6.13.102	216.55.163.106	FTP	75	1	Request: USER ind@psg420.com

2. Selanjutnya gunakan filter menggunakan ctrl+f lalu ketik RETR dengan yang dicari berupa Packet details dan String. Anda akan menemukan 5 paket yang memiliki RETR *.exe.
3. Klik kanan pada salah satu paket tersebut lalu follow stream. Pastikan anda show as UTF-8. Cari yang mirip seperti berikut untuk setiap .exe :
> 227 Entering Passive Mode (216,55,163,106,233,137)

Dari 227 Entering Passive Mode (a,b,c,d,p1,p2) → data port = p1*256 + p2. Contoh: (216,55,163,106,199,145) → port = 199*256 + 145 = 51009.
4. Gunakan display filter berikut :
ip.addr == 216.55.163.106 && tcp.port == 51009

Ganti port sesuai rumus tadi lalu anda akan menemukan beberapa paket. Urutkan dari yang length terpanjang/terbesar lalu follow stream paket tersebut. Lalu save itu sebagai raw dan diberi nama sesuai dengan .exe paket tersebut.
5. Gunakan sha256sum pada .exe tersebut.

		What credential did the attacker use to log in?
		Format: user:pass
		> ind@psg420.com:{6r_6e#TfT1p    
		
		How many files are suspected of containing malware?
		Format: int
		> 5
		
		What is the hash of the first file (q.exe)?
		Format: sha256
		> ca34b0926cdc3242bbfad1c4a0b42cc2750d90db9a272d92cfb6cb7034d2a3bd
		
		What is the hash of the second file (w.exe)?
		Format: sha256
		> 08eb941447078ef2c6ad8d91bb2f52256c09657ecd3d5344023edccf7291e9fc
		
		What is the hash of the third file (e.exe)?
		Format: sha256
		> 32e1b3732cd779af1bf7730d0ec8a7a87a084319f6a0870dc7362a15ddbd3199
		
		What is the hash of the fourth file (r.exe)?
		Format: sha256
		> 4ebd58007ee933a0a8348aee2922904a7110b7fb6a316b1c7fb2c6677e613884
		
		What is the hash of the fifth file (t.exe)?
		Format: sha256
		> 10ce4b79180a2ddd924fdc95951d968191af2ee3b7dfc96dd6a5714dbeae613a
		Congratulations! Here is your flag: KOMJAR25{Y0u_4r3_4_g00d_4nalyz3r_lGL02w13ZVroUTlNcEPmL4mWj}

<img width="612" height="748" alt="image" src="https://github.com/user-attachments/assets/862447f8-6caf-45df-9ac6-c04db398b7b0" />
<img width="615" height="747" alt="image" src="https://github.com/user-attachments/assets/f59e121c-44b7-4b90-b5c8-6280f7ac3362" />


## soal_17

 _Manwe membuat halaman web di node-nya yang menampilkan gambar cincin agung. Melkor yang melihat web tersebut merasa iri sehingga ia meletakkan file berbahaya agar web tersebut dapat dianggap menyebarkan malware oleh Eru. Analisis file capture untuk menggagalkan rencana Melkor dan menyelamatkan web Manwe.
(link file) nc 10.15.43.32 3404_

1. Jawaban dari soal di nc soal ini bisa dilihat dengan membuka file -> export object -> http dimana anda akan mendapatkan 3 file. Dari ketiga file tersebut, yang tidak sesuai dengan tempatnya adalah Invoice&MSO-Request.doc dan knr.exe.
2. Lalu, untuk mendapatkan hash sha256 dari knr.exe tersebut bisa dengan menyimpan file tersebut dan menggunakan command berikut di terminal yang sudah masuk directories dimana file tersebut berada :
   > sha256sum knr.exe.

Jika file tersebut berasa tidak aman, bisa menambahkan .bin di belakang .exe.

		What is the name of the first suspicious file?
		Format: file.exe
		> Invoice&MSO-Request.doc
		
		What is the name of the second suspicious file?
		Format: file.exe
		> knr.exe
		
		What is the hash of the second suspicious file (knr.exe)?
		Format: sha256
		> 749e161661290e8a2d190b1a66469744127bc25bf46e5d0c6f2e835f4b92db18
		Congratulations! Here is your flag: KOMJAR25{M4ster_4n4lyzer_1b0hGihMX9sAujYOAO60yQbXx}

<img width="607" height="456" alt="image" src="https://github.com/user-attachments/assets/5149efe7-b675-434c-88e0-8d12d9bb6ca5" />


## soal_18

_Karena rencana Melkor yang terus gagal, ia akhirnya berhenti sejenak untuk berpikir. Pada saat berpikir ia akhirnya memutuskan untuk membuat rencana jahat lainnya dengan meletakkan file berbahaya lagi tetapi dengan metode yang berbeda. Gagalkan lagi rencana Melkor dengan mengidentifikasi file capture yang disediakan agar dunia tetap aman.
(link file) nc 10.15.43.32 3405_

1. Seperti soal 17, untuk mengerjakan soal ini anda bisa buka file -> export object -> smb. Anda akan menemukan 2 file yang memiliki .exe di belakangnya meski dengan nama panjang yaitu d0p2nc6ka3f_fixhohlycj40vqfcy_smchzo_ub83urjpphrwahjwhv_o5c0fvf6.exe dan oiku9bu68cxqenfmcsos2aek6t07_guuisgxhllixv8dx2eemqddnhyh4618n_di.exe.
2. Simpan kedua file tersebut lalu menggunakan command berikut di terminal yang sudah masuk directories dimana file tersebut berada :
   > sha256sum "Nama File".exe

Jika file tersebut berasa tidak aman, bisa menambahkan .bin di belakang .exe.


		===== Question 18 =====
		Difficulty: Hard
		Note: You can exit anytime by typing 'exit'
		
		How many files are suspected of containing malware?
		Format: int
		> 2
		
		What is the name of the first malicious file?
		Format: file.exe
		> d0p2nc6ka3f_fixhohlycj40vqfcy_smchzo_ub83urjpphrwahjwhv_o5c0fvf6.exe
		
		What is the name of the second malicious file?
		Format: file.exe
		> oiku9bu68cxqenfmcsos2aek6t07_guuisgxhllixv8dx2eemqddnhyh4618n_di.exe
		
		What is the hash of the first malicious file?
		Format: sha256
		> 59896ae5f3edcb999243c7bfdc0b17eb7fe28f3a66259d797386ea470c010040
		
		What is the hash of the second malicious file?
		Format: sha256
		> cf99990bee6c378cbf56239b3cc88276eec348d82740f84e9d5c343751f82560
		
		Congratulations! Here is your flag: KOMJAR25{Y0u_4re_g0dl1ke_prDBq47H4CzutINNICpVXPpj5}

<img width="607" height="456" alt="image" src="https://github.com/user-attachments/assets/d0f4f394-54fb-4714-98b3-d84a6340482d" />


## soal_19

_Manwe mengirimkan email berisi surat cinta kepada Varda melalui koneksi yang tidak terenkripsi. Melihat hal itu Melkor sipaling jahat langsung melancarkan aksinya yaitu meneror Varda dengan email yang disamarkan. Analisis file capture jaringan dan gagalkan lagi rencana busuk Melkor.
	(link file) nc 10.15.43.32 3406_

1. Buka file PCAP dengan wireshark. Paket di file itu akan muncul.
2. Urutkan berdasarkan Info (di bagian pojok kanan wireshark) lalu cari hingga ketemu yang berisi
   > from: Your Life<YourLife**@****.com>, subject: ******
3. Setelah menemukan paket seperti itu, klik kanan dan pencet follow stream -> Stream. Setelah itu anda akan menemukan data dari email seperti siapa pengirim email, berapa banyak ransom yang diminta, dan apa bitcoin wallet milik penyerang.

		===== Soal 19 =====
		Difficulty: Hard
		Note: You can exit anytime by typing 'exit'
		
		Who sent the threatening message?
		Format: string (name)
		> Your Life
		
		How much ransom did the attacker demand ($)?
		Format: int
		> 1600
		
		What is the attacker's bitcoin wallet?
		Format: string
		> 1CWHmuF8dHt7HBGx5RKKLgg9QA2GmE3UyL
		Congratulations! Here is your flag: KOMJAR25{Y0u_4re_J4rk0m_G0d_COUlhthkBi45vnuwvKnEosqkG}

<img width="599" height="457" alt="image" src="https://github.com/user-attachments/assets/c77799a8-41f7-4618-8111-abed2455d89a" />
<img width="615" height="747" alt="image" src="https://github.com/user-attachments/assets/967b2688-f7e3-4b12-b1bb-2544e852743c" />


## soal_20

_Untuk yang terakhir kalinya, rencana besar Melkor yaitu menanamkan sebuah file berbahaya kemudian menyembunyikannya agar tidak terlihat oleh Eru. Tetapi Manwe yang sudah merasakan adanya niat jahat dari Melkor, ia menyisipkan bantuan untuk mengungkapkan rencana Melkor. Analisis file capture dan identifikasi kegunaan bantuan yang diberikan oleh Manwe untuk menggagalkan rencana jahat Melkor selamanya.
(link file) nc 10.15.43.32 3407_

1. Lakukan display filter menggunakan berikut :
   > http
2. Setelah itu pencet ctrl+f dan cari GET. Gunakan pencarian pada packet details, string. Anda akan menemukan 3 file dimana salah satunya adalah invest_20.dll.
3. Gunakan file -> http -> Lalu cari invest_20.dll untuk disimpan.
4. Setelah disimpan gunakan command berikut di terminal yang sudah masuk directories dimana file tersebut berada :
   > sha256sum "Nama File".exe
Jika file tersebut berasa tidak aman, bisa menambahkan .bin di belakang .exe.
5. Metode enkripsi bisa dicari dengan display filter berikut :
> tls.handshake.type == 2

Setelah itu cari di packet details -> Transport Layer Security -> lalu cek Cypher Suite. Yang saya dapatkan adalah Cipher Suite: TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (0xc02f). Hal itu menunjukkan bahwa metode enkripsinya adalah TLS.

		===== Soal 20 =====
		Difficulty: Hard
		Note: You can exit anytime by typing 'exit'
		
		What encryption method is used?
		Format: string
		> TLS
		
		What is the name of the malicious file placed by the attacker?
		Format: file.exe
		> invest_20.dll
		
		What is the hash of the file containing the malware?
		Format: sha256
		> 31cf42b2a7c5c558f44cfc67684cc344c17d4946d3a1e0b2cecb8eb58173cb2f
		Congratulations! Here is your flag: KOMJAR25{B3ware_0f_M4lw4re_s7ZkVxA3xx06IaiEtA5t4ZiEj}

