# Jarkom-Modul-1-ITB04-2022

Pengerjaan Soal Shift Komunikasi Data dan Jaringan Komputer Modul 1 oleh ITB04

# Anggota

| Nama                           | NRP          | 
| -------------------------------| -------------| 
| Nadine Haninta                 | `5027201014` | 
| Maulanal Fatihil A. M          | `5027201031` | 
| Dzaki Indra Cahya              | `5027201053` |

# Konten
* [Sumber Soal dan Resource Praktikum Komunikasi Data dan Jaringan Komputer Modul 2 Tahun 2022](#sumber-soal-dan-resource-praktikum-komunikasi-data-dan-jaringan-komputer-modul-2-tahun-2022)
    * [Sumber Soal](#symber-soal)
    * [Resource Soal Praktikum]()
* [Soal 1](#soal-1)
    * [Jawaban Soal 1](#jawaban-soal-1)
    * [Penyelesaian dan Dokumentasi Soal 1](#penyelesaian-dan-dokumentasi-soal-1)
    * [Kendala Soal 1](#kendala-soal-1)
* [Soal 2](#soal-1)
    * [Jawaban Soal 2](#jawaban-soal-2)
    * [Penyelesaian dan Dokumentasi Soal 2](#penyelesaian-dan-dokumentasi-soal-2)
    * [Kendala Soal 2](#kendala-soal-2)
* [Soal 3](#soal-3)
    * [Jawaban Soal 3](#jawaban-soal-3)
    * [Penyelesaian dan Dokumentasi Soal 3](#penyelesaian-dan-dokumentasi-soal-3)
    * [Kendala Soal 3](#kendala-soal-3)
* [Soal 4](#soal-4)
    * [Jawaban Soal 4](#jawaban-soal-4)
    * [Penyelesaian dan Dokumentasi Soal 4](#penyelesaian-dan-dokumentasi-soal-4)
    * [Kendala Soal 4](#kendala-soal-4)
* [Soal 5](#soal-5)
    * [Jawaban Soal 5](#jawaban-soal-5)
    * [Penyelesaian dan Dokumentasi Soal 5](#penyelesaian-dan-dokumentasi-soal-5)
    * [Kendala Soal 5](#kendala-soal-5)
* [Soal 6](#soal-6)
    * [Jawaban Soal 6](#jawaban-soal-6)
    * [Penyelesaian dan Dokumentasi Soal 6](#penyelesaian-dan-dokumentasi-soal-6)
    * [Kendala Soal 6](#kendala-soal-6)
* [Soal 7](#soal-7)
    * [Jawaban Soal 7](#jawaban-soal-7)
    * [Penyelesaian dan Dokumentasi Soal 7](#penyelesaian-dan-dokumentasi-soal-7)
    * [Kendala Soal 7](#kendala-soal-7)

## Sumber Soal dan Resource Praktikum Komunikasi Data dan Jaringan Komputer Modul 2 Tahun 2022
Adapun untuk soal dan _resource_ yang digunakan dalam praktikum 2
### Symber Soal
Sebagai berikut adalah soal yang digunakan dalam praktikum,
[Sumber Soal](https://docs.google.com/document/d/11Mz2Fd3DKtGkCknHee9VZRdJYvZ3YAMIaifObHEpBFo/edit?usp=sharing)

## Soal 1
WISE akan dijadikan sebagai DNS Master, Berlint akan dijadikan DNS Slave, dan Eden akan digunakan sebagai Web Server. Terdapat 2 Client yaitu SSS, dan Garden. Semua node terhubung pada router Ostania, sehingga dapat mengakses internet 

### Jawaban Soal 1
Bentuk topologi yang digunakan adalah sebagai berikut, <br>
![Topologi](/image/1-1.png)<br>
Lalu dilakukan test untuk mengecek apakah sudah tersambung atau belum
```
ping -c 3 google.com
```

### Penyelesaian dan Dokumentasi Soal 1
1) Dengan setelan _network configuration_ sebagai berikut, <br>
    A.  Ostania<BR>
    ```
    auto eth0
    iface eth0 inet dhcp

    auto eth1
    iface eth1 inet static
	    address 192.216.1.1
	    netmask 255.255.255.0

    auto eth2
    iface eth2 inet static
	    address 192.216.2.1
	    netmask 255.255.255.0

    auto eth3
    iface eth3 inet static
	    address 192.216.3.1
	    netmask 255.255.255.0
    ```
    B.  SSS
    ```
    auto eth0
    iface eth0 inet static
	    address 192.216.1.2
	    netmask 255.255.255.0
	    gateway 192.216.1.1

    ```
    C. Garden
    ```
    auto eth0
    iface eth0 inet static
	    address 192.216.1.3
	    netmask 255.255.255.0
	    gateway 192.216.1.1
    ```
    D. WISE
    ```
    auto eth0
    iface eth0 inet static
	    address 192.216.2.2
	    netmask 255.255.255.0
	    gateway 192.216.2.1
    ```
    E. Berlint
    ```
    auto eth0
    iface eth0 inet static
	    address 192.216.3.2
	    netmask 255.255.255.0
	    gateway 192.216.3.1

    ```
    F. Eden
    ```
    auto eth0
    iface eth0 inet static
	    address 192.216.3.3
	    netmask 255.255.255.0
	    gateway 192.216.3.1

    ```
2) Melakukan perintah IPTABLES berikut pada node Ostania<br>
```
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.216.0.0/16 
```
3) Mengecek IP DNS dari Ostania melalui perintah sebagai berikut,
```
cat /etc/resolv.conf
```
4) Pada setiap client node selain Ostania, dilakukan perintah untuk mendeklarasikan IP DNS<br>
```
echo "nameserver 192.168.122.1" > /etc/resolv.conf
```
5) Untuk melakukan tes terhadap sambungan jaringan, pada setiap node dapat dicoba dengan perintah
```
ping -c 3 google.com
```
![Uji Coba](/image/1-2.png)<br>

### Kendala Soal 1
Tidak ada

## Soal 2
Untuk mempermudah mendapatkan informasi mengenai misi dari Handler, bantulah Loid membuat website utama dengan akses wise.itb04.com dengan alias www.wise.itbo4y.com pada folder wise.?

### Jawaban Soal 2
Berupa langkah penyelesaian soal

### Penyelesaian dan Dokumentasi Soal 2
1) Memasang paket bind9 pada WISE
```
apt-get install bind9 -y
```
2) Mengubah konten node WISE dari `/etc/bind/named.conf.local` melalui perintah,
```
nano /etc/bind/named.conf.local
```
Lalu dilanjutkan dengan merubah konten menjadi
```
zone "wise.itb04.com" {
	type master;
	file "etc/bind/wise/wise.itb04.com";
};
```
3) Membuat folder `wise` di bind pada node tersebut dengan perintah sebagai berikut,
```
mkdir -p /etc/bind/wise
```
4) Menyalin dokumen db.local ke folder WISE yang telah dibuat,
```
cp /etc/bind/db.local /etc/bind/wise/wise.itb04.com
```
5) Melakukan konfigurasi pada dokumen dengan perintah sebagai berikut,
```
nano /etc/bind/wise/wise.itb04.com
```
Dengan rincian sebagai berikut,
```
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     wise.itb04.com. root.wise.itb04.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      wise.itb04.com.
@       IN      A       192.216.2.2
www     IN      CNAME   wise.itb04.com.
@       IN      AAAA    ::1
```
6) Melakukan penjalanan ulang dari bind9 dengan perintah
```
service bind9 restart
```
7) Menguji pada client apakah sudah terpasang dengan benar
```
echo nameserver 192.216.2.2 > /etc/resolv.conf
```
Lalu dilanjutkan dengan
```
ping wise.itb04.com
```
![Uji Coba](/image/2-1.png)<br>

### Kendala Soal 2
Tidak ada

## Soal 3
Setelah itu ia juga ingin membuat subdomain eden.wise.yyy.com dengan alias www.eden.wise.yyy.com yang diatur DNS-nya di WISE dan mengarah ke Eden di

### Jawaban Soal 3
Berupa langkah penyelesaian soal

### Penyelesaian dan Dokumentasi Soal 3

1) Memasukkan perintah berikut pada _node_ WISE
```
nano /etc/bind/wise/wise.itb04.com
```
dengan setelah sebagai berikut,
```
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     wise.itb04.com. root.wise.itb04.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@               IN      NS      wise.itb04.com.
@               IN      A       192.216.2.2
www             IN      CNAME   wise.itb04.com.
@               IN      AAAA    ::1
eden            IN      A       192.216.3.3
www.eden        IN      CNAME   eden.wise.itb04.com.
```
2) Uji coba alamat pada node <br>
```
ping -c 3 eden.wise.itb04.com
```
atau
```
ping -c 3 www.eden.wise.itb04.com
```
![image](/image/3-1.png)<br>

### Kendala Soal 3
Tidak ada

## Soal 4
Buat juga reverse domain untuk domain utama 

### Jawaban Soal 4
Berupa langkah penyelesaian soal

### Penyelesaian dan Dokumentasi Soal 4
1) Mengubah named.conf.local dengan perintah sebagai berikut,
```
nano /etc/bind/named.conf.local
```
Dengan rincian
```
zone "wise.itb04.com" {
        type master;
        file "/etc/bind/wise/wise.itb04.com";
};
zone "2.216.192.in-addr.arpa" {
    type master;
    file "/etc/bind/wise/2.216.192.in-addr.arpa";
};
```
2) Melakukan penyalinan di node WISE dengan perintah sebagai berikut,
```
cp /etc/bind/db.local /etc/bind/wise/2.216.192.in-addr.arpa
```
3) Melakukan perubahan dengan perintah
```
nano /etc/bind/wise/2.216.192.in-addr.arpa
```
dengan rincian
```
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     wise.itb04.com. root.wise.itb04.com. (
                        	   2 	       ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
2.216.192.in-addr.arpa. IN      NS      wise.itb04.com.
2                       IN      PTR     wise.itb04.com.
```
4) Melakukan perulangan dari layanan bind9 di WISE
```
service bind9 restart
```
5) Melakukan pemasangan dsnutils di node klien (SSS atau Garden)
```
apt-get install dnsutils -y
```
6) Di node klien, dideklarasikan, 
```
echo nameserver 192.216.2.2 > /etc/resolv.conf
```
7) Di node klien, dilakukan perintah sebagai berikut untuk mengetahui tujuan dari reverse domain
```
host -t PTR 192.216.2.2
```
![image](/image/4-1.png)<br>

### Kendala Soal 4
Tidak ada

## Soal 5
Agar dapat tetap dihubungi jika server WISE bermasalah, buatlah juga Berlint sebagai DNS Slave untuk domain utama.


### Jawaban Soal 5
Berupa langkah penyelesaian soal


### Penyelesaian dan Dokumentasi Soal 5
1) Mengubah named.conf.local di WISE dengan perintah sebagai berikut,
```
nano /etc/bind/named.conf.local
```
Dengan rincian
```
zone "wise.itb04.com" {
	type master;
       notify yes;
       also-notify { 192.216.3.2; };
       allow-transfer { 192.216.3.2; };
	file "/etc/bind/wise/wise.itb04.com";
};

zone "3.216.192.in-addr.arpa"{
       type master;
       file "/etc/bind/wise/3.216.192.in-addr.arpa";
};
```
2) Melakukan perulangan layanan bind9 di WISE
```
service bind9 restart
```
3) Dengan asumsi sudah melakukan pemasangan di node Berlint, dilakukan pengeditan dengan,
```
nano /etc/bind/named.conf.local
```
dengan rincian
```
zone "wise.itb04.com" {
    type slave;
    masters { 192.216.2.2; };
    file "/var/lib/bind/wise.itb04.com";
};
```
4) Melakukan perulangan pada layanan bind9 di Berlint
```
service bind9 restart
```
5) Melakukan penghentian layanan bind9 di WISE
```
service bind9 stop
```
6) Menguji melalui SSS dan Garden
```
echo 'nameserver 192.216.2.2
nameserver 192.216.3.2' > /etc/resolv.conf
```
lalu dilanjutkan dengan,
```
ping -c 3 wise.itb04.com
```

### Kendala Soal 5
Tidak ada

## Soal 6
Karena banyak informasi dari Handler, buatlah subdomain yang khusus untuk operation yaitu operation.wise.yyy.com dengan alias www.operation.wise.yyy.com yang didelegasikan dari WISE ke Berlint dengan IP menuju ke Eden dalam folder operation

### Jawaban Soal 6
Berupa langkah penyelesaian soal


### Penyelesaian dan Dokumentasi Soal 6
1) Mengubah dokumen pada node WISE,
```
nano /etc/bind/wise/wise.itb04.com
```
Dengan rincian,
```
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     wise.itb04.com. root.wise.itb04.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@               IN      NS      wise.itb04.com.
@               IN      A       192.216.2.2
www             IN      CNAME   wise.itb04.com.
@               IN      AAAA    ::1
eden            IN      A       192.216.3.3    
www.eden        IN      CNAME   eden.wise.itb04.com.
ns1             IN      A       192.216.3.2 ; IP Berlint
operation       IN      NS      ns1
```
2) Membuat folder di Node WISE
```
mkdir -p /etc/bind/operation
```
3) Melakukan perubahan pada WISE,
```
nano /etc/bind/named.conf.options
```
Dengan rincian, 
```
directory "/var/cache/bind";
 
        // If there is a firewall between you and nameservers you want
        // to talk to, you may need to fix the firewall to allow multiple
        // ports to talk.  See http://www.kb.cert.org/vuls/id/800113
 
        // If your ISP provided one or more IP addresses for stable
        // nameservers, you probably want to use them as forwarders.
        // Uncomment the following block, and insert the addresses replacing
        // the all-0s placeholder.
       
        // forwarders {
        //      0.0.0.0;
        // };
       
        //=====================================================================$
        // If BIND logs error messages about the root key being expired,
        // you will need to update your keys.  See https://www.isc.org/bind-keys
        //=====================================================================$
        //dnssec-validation auto;
        allow-query{any;};
 
        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
};
```
(Menjadikan `dnssec-validation auto;` menjadi komentar dan menambahkan `allow-query{any;};`)
4) Melakukan perulangan layanan bind9 di WISE
```
service bind9 restart
```
5) Melakukan perubahan pada node Berlint,
```
nano /etc/bind/named.conf.local
```
dengan rincian
```
zone "wise.itb04.com" {
    type slave;
    masters { 192.216.2.2; };
    file "/var/lib/bind/wise.itb04.com";
};
 
zone "operation.wise.itb04.com" {
        type master;
        file "/etc/bind/operation/operation.wise.itb04.com";
};
```
6) Membuat folder
```
mkdir -p /etc/bind/operation
```
7) Melakukan perubahan pada Berlint,
```
nano /etc/bind/named.conf.options
```
Dengan rincian, 
```
directory "/var/cache/bind";
 
        // If there is a firewall between you and nameservers you want
        // to talk to, you may need to fix the firewall to allow multiple
        // ports to talk.  See http://www.kb.cert.org/vuls/id/800113
 
        // If your ISP provided one or more IP addresses for stable
        // nameservers, you probably want to use them as forwarders.
        // Uncomment the following block, and insert the addresses replacing
        // the all-0s placeholder.
       
        // forwarders {
        //      0.0.0.0;
        // };
       
        //=====================================================================$
        // If BIND logs error messages about the root key being expired,
        // you will need to update your keys.  See https://www.isc.org/bind-keys
        //=====================================================================$
        //dnssec-validation auto;
        allow-query{any;};
 
        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
};
```
(Menjadikan `dnssec-validation auto;` menjadi komentar dan menambahkan `allow-query{any;};`)
7) Melakukan penyalinan di Berlint,
```
cp /etc/bind/db.local /etc/bind/operation/operation.wise.itb04.com
```
8) Melakukan perubahan di Berlint,
```
nano /etc/bind/operation/operation.wise.itb04.com
```
dengan rincian
```
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     operation.wise.itb04.com. root.operation.wise.itb04.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      operation.wise.itb04.com.
@       IN      A       192.216.3.3
www     IN      CNAME   operation.wise.itb04.com.
@       IN      AAAA    ::1
```
9) Melakukan perulangan layanan bind9 di Berlint
```
service bind9 restart
```
10) Melakukan testing ping pada node Garden atau SSS
```
ping -c 3 www.operation.wise.itb04.com
```
atau
```
ping -c 3 operation.wise.itb04.com
```

### Kendala Soal 6
Tidak ada

## Soal 7
Untuk informasi yang lebih spesifik mengenai Operation Strix, buatlah subdomain melalui Berlint dengan akses strix.operation.wise.yyy.com dengan alias www.strix.operation.wise.yyy.com yang mengarah ke Eden

### Jawaban Soal 7
Berupa langkah penyelesaian soal 7


### Penyelesaian dan Dokumentasi Soal 7
1) Mengubah dokumen yang ada di Berlint dengan perintah,
```
nano /etc/bind/operation/operation.wise.itb04.com
```
Dengan rincian,
```
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     operation.wise.itb04.com. root.operation.wise.itb04.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@               IN      NS      operation.wise.itb04.com.
@               IN      A       192.216.3.3
www             IN      CNAME   operation.wise.itb04.com.
strix           IN      A       192.216.3.3
www.strix       IN      CNAME   strix.operation.wise.itb04.com.
@       	    IN      AAAA    ::1
```
2) Melakukan perulangan layanan bind9 di Berlint
```
service bind9 restart
```
3) Melakukan uji coba pada salah satu node client (Garden atau SSS)
```
ping -c 3 strix.operation.wise.itb04.com
```

### Kendala Soal 7
Tidak ada