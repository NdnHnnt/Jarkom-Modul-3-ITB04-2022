# Jarkom-Modul-3-ITB04-2022

Pengerjaan Soal Shift Komunikasi Data dan Jaringan Komputer Modul 3 oleh ITB04

# Anggota

| Nama                           | NRP          | 
| -------------------------------| -------------| 
| Nadine Haninta                 | `5027201014` | 
| Maulanal Fatihil A. M          | `5027201031` | 
| Dzaki Indra Cahya              | `5027201053` |

# Konten
* [Sumber Soal dan Resource Praktikum Komunikasi Data dan Jaringan Komputer Modul 3 Tahun 2022](#sumber-soal-dan-resource-praktikum-komunikasi-data-dan-jaringan-komputer-modul-3-tahun-2022)
    * [Sumber Soal](#sumber-soal)
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
* [Soal Proxy ](#soal-Proxy)
    * [Jawaban Soal Proxy](#jawaban-soal-Proxy)
    * [Penyelesaian dan Dokumentasi Soal Proxy](#penyelesaian-dan-dokumentasi-soal-Proxy)
    * [Kendala Soal Proxy](#kendala-soal-Proxy)

## Sumber Soal dan Resource Praktikum Komunikasi Data dan Jaringan Komputer Modul 3 Tahun 2022
Adapun untuk soal dan _resource_ yang digunakan dalam praktikum 3
### Sumber Soal
Sebagai berikut adalah soal yang digunakan dalam praktikum,
[Sumber Soal](https://docs.google.com/document/d/1asm7lgnTJxr17DxsE_McdUimPsRjesi6ZrHRpmXPZ4s/edit)

## Soal 1
Loid bersama Franky berencana membuat peta tersebut dengan kriteria WISE sebagai DNS Server, Westalis sebagai DHCP Server, Berlint sebagai Proxy Server.
### Jawaban Soal 1
Membuat topologi sesuai gambar pada soal shift

<img width="664" alt="image" src="https://user-images.githubusercontent.com/80145586/201475924-fa784b73-1778-480b-9b9c-d3ba6f299efb.png">

IP Address dari masing-masing node adalah:

    - Ostania   : 10.20.1.1	| DHCP Relay | Router 
    - WISE      : 10.20.2.2	| DNS Server
    - Berlint   : 10.20.3.2	| Proxy Server
    - Westalia  : 10.20.3.3	| DHCP Server
    - SSS           : DHCP	| Client Subnet 1
    - Garden        : DHCP	| Client Subnet 1
    - Eden          : DHCP	| Client Subnet 3
    - NewstonCastle : DHCP	| Client Subnet 3
    - KemonoPark    : DHCP	| Client Subnet 3

### Penyelesaian dan Dokumentasi Soal 1
### Isi File konfigurasi `no1.sh`

### Pada node Ostania
```bash
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.20.0.0/16
cat /etc/resolv.conf
```

### Pada semua node kecuali Ostania
```
echo nameserver 192.168.122.1 > /etc/resolv.conf
```

### Pada node WISE sebagai DNS server
Menginstall bind
```
apt-get update
apt-get install bind9 -y
```
### Pada node Berlint sebagai Proxy server
Menginstall squid
```
apt-get update
apt-get install squid -y
```
### Pada node Westalis sebagai DHCP server
Menginstall isc-dhcp-server
```
apt-get update
apt-get install isc-dhcp-server -y
```

### Kendala Soal 1
Tidak ada

## Soal 2
Mengatur Ostania sebagai DHCP relay

### Jawaban Soal 2
Berupa langkah penyelesaian soal

### Penyelesaian dan Dokumentasi Soal 2
## Isi file `no2.sh` pada ostania
```
apt-get update

apt-get install isc-dhcp-relay 

echo 'net.ipv4.ip_forward=1'>/etc/sysctl.conf

service isc-dhcp-relay restart
```
## Isi file `/etc/default/isc-dhcp-relay`
Menambahkan Ip Westalis sebagai dhcp server tujuan relay dan `eth1 eth2 eth3` sebagai interface yang dilayani
```
# What servers should the DHCP relay forward requests to?
SERVERS="10.20.2.4"

# On what interfaces should the DHCP relay (dhrelay) serve DHCP requests?
INTERFACES="eth1 eth2 eth3"
```

### Kendala Soal 2
Tidak ada

## Soal 3

### Jawaban Soal 3
Berupa langkah penyelesaian soal

### Penyelesaian dan Dokumentasi Soal 3
Client yang melalui Switch1 mendapatkan range IP dari `10.20.1.50` - `10.20.1.88` dan `10.20.1.120` - `10.20.1.155`

Mengedit file `/etc/dhcp/dhcpd.conf`pada node Westalis
```
subnet 10.20.2.0 netmask 255.255.255.0 {
}

subnet 10.20.1.0 netmask 255.255.255.0 {
    range 10.20.1.50 10.20.1.88;
    range 10.20.1.120 10.20.1.155;
    option routers 10.20.1.1;
    option broadcast-address 10.20.1.255;
    option domain-name-servers 10.20.2.2;
    default-lease-time 600;
    max-lease-time 6900;
}
```
Mengedit line berikut pada file `/etc/default/isc-dhcp-server`
```
INTERFACES=`eth0`
```
Mengedit file `/etc/network/interfaces` pada semua node client
```
auto eth0
iface eth0 inet dhcp
```
## Hasil testing
### node SSS
<img width="500" alt="image" src="https://user-images.githubusercontent.com/80145586/201476012-136e71ab-531b-487e-bf0c-06ce9fe8205b.png">

### Node Garden
<img width="500" alt="image" src="https://user-images.githubusercontent.com/80145586/201476029-f890ea51-2ad8-42d9-8660-10b3afb80ab1.png">

### Kendala Soal 3
Tidak ada

## Soal 4

### Jawaban Soal 4
Berupa langkah penyelesaian soal

### Penyelesaian dan Dokumentasi Soal 4
Client yang melalui Switch3 mendapatkan range IP dari `10.20.3.10` - `10.20.3.30` dan `10.20.3.60` - `10.20.3.85`

Pada file `/etc/dhcp/dhcpd.conf` di node Westalis ditambahkan
```
subnet 10.20.3.0 netmask 255.255.255.0 {
    range 10.20.3.10 10.20.3.30;
    range 10.20.3.60 10.20.3.85;
    option routers 10.20.3.1;
    option broadcast-address 10.20.3.255;
    option domain-name-servers 10.20.2.2;
}
```
## Hasil testing
### node Eden
<img width="500" alt="image" src="https://user-images.githubusercontent.com/80145586/201476089-dc557f9c-7e7c-41af-a879-e2051ef604fe.png">

### node NewstonCastle
<img width="500" alt="image" src="https://user-images.githubusercontent.com/80145586/201476045-381ea187-2cd2-4253-9e1a-2053a523845b.png">

### node KemonoPark
<img width="500" alt="image" src="https://user-images.githubusercontent.com/80145586/201476060-8fbcfb18-b8de-41f9-b6c7-095ceb1c78e1.png">

### Kendala Soal 4
Tidak ada

## Soal 5
Client mendapatkan DNS dari WISE dan client dapat terhubung dengan internet melalui DNS tersebut


### Jawaban Soal 5
Berupa langkah penyelesaian soal


### Penyelesaian dan Dokumentasi Soal 5
## Pada node WISE
Mengedit line berikut pada file ‘/etc/bind/named.conf.options`
```
forwarders {
                192.168.122.1;
};

//dnssec-validation auto;
allow-query{any;};
```
## hasil testing
### sebelum
<img width="300" alt="image" src="https://user-images.githubusercontent.com/80145586/201476147-47a9a3f9-03dd-4f0a-9aa2-f06035c6b084.png">

### setelah
<img width="500" alt="image" src="https://user-images.githubusercontent.com/80145586/201476160-d6698957-8725-42e1-8a29-49b0fa5b3c4e.png">

### Kendala Soal 5
Tidak ada

## Soal 6
Lama waktu DHCP server meminjamkan alamat IP kepada Client yang melalui Switch1 selama 5 menit (300s) sedangkan pada client yang melalui Switch3 selama 10 menit (600s). Dengan waktu maksimal yang dialokasikan untuk peminjaman alamat IP selama 115 menit (6900s).

### Jawaban Soal 6
Berupa langkah penyelesaian soal


### Penyelesaian dan Dokumentasi Soal 6
Menambahkan waktu peminjaman ip pada tiap subnet sesuai soal.
```
subnet 10.20.2.0 netmask 255.255.255.0 {
}

subnet 10.20.1.0 netmask 255.255.255.0 {
    ...
    default-lease-time 300;
    max-lease-time 6900;
}

subnet 10.20.3.0 netmask 255.255.255.0 {
    ...
    default-lease-time 600;
    max-lease-time 6900;
}
```

## Hasil testing
### Node Garden (Switch 1)
<img width="510" alt="image" src="https://user-images.githubusercontent.com/80145586/201476170-479de0d1-7586-48a5-84ef-458767fca38b.png">

### Node KemonoPark (Switch 3)
<img width="510" alt="image" src="https://user-images.githubusercontent.com/80145586/201476187-c50aeb51-c827-41d1-85a3-702c93d2f38d.png">

### Kendala Soal 6
Tidak ada

## Soal 7
Node Eden mendapatkan alamat IP tetap yaitu `10.20.3.13`

### Jawaban Soal 7
Berupa langkah penyelesaian soal 7


### Penyelesaian dan Dokumentasi Soal 7
## Pada node Westalis
Mengedit file `/etc/dhcp/dhcpd.conf`
```

...

host Eden {
    hardware ethernet 5a:b7:3a:2b:e8:be;
    fixed-address 10.20.3.13;
}
```
## Pada node Eden
Mengedit file `/etc/network/interfaces`
```
auto eth0
iface eth0 inet dhcp

hwaddress ether 5a:b7:3a:2b:e8:be
```
## Hasil testing
### Pada node Eden
<img width="500" alt="image" src="https://user-images.githubusercontent.com/80145586/201476225-73cc973e-9232-45ba-9955-833d0046c07e.png">

### Kendala Soal 7
Tidak ada


---
## Soal Proxy

### Ketentuan Proxy
1. Client hanya dapat mengakses internet diluar (selain) hari & jam kerja (senin-jumat 08.00 - 17.00) dan hari libur (dapat mengakses 24 jam penuh)

2. Adapun pada hari dan jam kerja sesuai nomor (1), client hanya dapat mengakses domain loid-work.com dan franky-work.com (IP tujuan domain dibebaskan)

3. Saat akses internet dibuka, client dilarang untuk mengakses web tanpa HTTPS. (Contoh web HTTP: http://example.com)

4. Agar menghemat penggunaan, akses internet dibatasi dengan kecepatan maksimum 128 Kbps pada setiap host (Kbps = kilobit per second; lakukan pengecekan pada tiap host, ketika 2 host akses internet pada saat bersamaan, keduanya mendapatkan speed maksimal yaitu 128 Kbps)

5. Setelah diterapkan, ternyata peraturan nomor (4) mengganggu produktifitas saat hari kerja, dengan demikian pembatasan kecepatan hanya diberlakukan untuk pengaksesan internet pada hari libur


Setelah proxy Berlint diatur oleh Loid, dia melakukan pengujian dan mendapatkan hasil sesuai tabel berikut.


|                   Aksi                  |   Senin (10.00)  |       Senin (20.00)      | Sabtu (10.00) |
|:---------------------------------------:|:----------------:|:------------------------:|:-------------:|
| Akses internet (HTTP)                   |         x        |             x            |       x       |
| Akses internet (HTTPS)                  |         x        |             v            |       v       |
| Akses loid-work.com dan franky-work.com |         v        |             x            |       x       |
| Speed limit (128Kbps)                   | Tidak bisa akses | x (Speed Tidak Dibatasi) |       x       |

# Proxy nomor 1
Client hanya dapat mengakses internet diluar (selain) hari & jam kerja (senin-jumat 08.00 - 17.00) dan hari libur (dapat mengakses 24 jam penuh)
## Pada node Berlint
Mengedit file `/etc/squid/squid.conf`
```
acl HARI_KERJA time MTWHF 08:00-17:00

http_port 8080
http_access deny HARI_KERJA
http_access allow all
visible_hostname Berlint
```
## Pada node client
Menginstall lynx
```
apt-get update
apt-get install lynx -y
```
Menjalankan command
```
export http_proxy="http://10.20.2.3:8080"
```

## Hasil testing
### Pada hari kerja

<img width="250" alt="image" src="https://user-images.githubusercontent.com/80145586/201478953-0cb8adfd-2c4e-4936-9cb9-018f0e428588.png">

<img width="500" alt="image" src="https://user-images.githubusercontent.com/80145586/201478945-3b139a50-3d05-4dc4-b6c9-bbb639abe37b.png">

### Selain hari kerja

<img width="250" alt="image" src="https://user-images.githubusercontent.com/80145586/201479010-acf12a9e-e9ee-4d3d-af3c-36e8615aa4c3.png">

<img width="500" alt="image" src="https://user-images.githubusercontent.com/80145586/201479002-1e687221-f962-4a74-860f-bdbc046360f5.png">


# Proxy nomor 2
Adapun pada hari dan jam kerja sesuai nomor (1), client hanya dapat mengakses domain loid-work.com dan franky-work.com (IP tujuan domain dibebaskan)
## Pada node Berlint
Mengedit file `/etc/squid/squid.conf`
```
acl HARI_KERJA time MTWHF 08:00-17:00
acl AVAILABLE_WORKING time MTWHF 00:00-07:59
acl AVAILABLE_WORKING2 time MTWHF 17:01-24:00
acl HARI_LIBUR time AS 00:00-24:00
acl LOID dstdomain loid-work.com
acl FRANKY dstdomain franky-work.com

http_port 8080
http_access allow HARI_KERJA LOID
http_access allow HARI_KERJA FRANKY
http_access deny HARI_KERJA
http_access allow AVAILABLE_WORKING !LOID
http_access allow AVAILABLE_WORKING !FRANKY
http_access allow AVAILABLE_WORKING2 !LOID
http_access allow AVAILABLE_WORKING2 !FRANKY
http_access allow HARI_LIBUR !LOID
http_access allow HARI_LIBUR !FRANKY
http_access deny all
```
##Pada node WISE
Mengaktifkan domain `loid-work.com’ dan `franky-work.com`

Instalasi
```
apt-get update
apt-get install apache2 -y
apt-get install php -y
apt-get install libapache2-mod-php7.0
```
Mengedit file `/etc/bind/named.conf.local`
```
zone "loid-work.com" {
        type master;
        file "/etc/bind/loid-work/loid-work.com";
};
zone "franky-work.com" {
        type master;
        file "/etc/bind/franky-work/franky-work.com";
};
```
Membuat directory
```
mkdir /etc/bind/loid-work
mkdir /etc/bind/franky-work
```
Mengedit file `/etc/bind/loid-work/loid-work.com`
```
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     loid-work.com. root.loid-work.com. (
                              20221110          ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      loid-work.com.
@       IN      A       10.20.2.2
@       IN      AAAA    ::1
```
Mengedit file `/etc/bind/franky-work/franky-work.com`
```
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     franky-work.com. root.franky-work.com. (
                              20221110          ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      franky-work.com.
@       IN      A       10.20.2.2
@       IN      AAAA    ::1
```
Menambahkan line berikut pada file `/etc/apache2/sites-available/loid-work.com.conf`
```
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/loid-work.com
        ServerName loid-work.com
```
Menambahkan line berikut pada file `/etc/apache2/sites-available/franky-work.com.conf`
```
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/franky-work.com
        ServerName franky-work.com
```
Mengaktifkan domain
```
a2ensite loid-work.com
a2ensite franky-work.com
```
Membuat directory
```
mkdir /var/www/loid-work.com
mkdir /var/www/franky-work.com
```
Kemudian membuat file index.php pada masing-masing directory tersebut.

Isi file index.php
```
<?php
        phpinfo();
?>
```
## Hasil testing
### Hari kerja

<img width="250" alt="image" src="https://user-images.githubusercontent.com/80145586/201480657-94f0f612-098e-46ef-bcf7-537bb091a9f4.png">

<img width="500" alt="image" src="https://user-images.githubusercontent.com/80145586/201480669-e5110b19-0c48-48da-ba89-91e9d3b3b638.png">

### Selain hari kerja

<img width="250" alt="image" src="https://user-images.githubusercontent.com/80145586/201480923-b4b0cd75-f450-4907-81be-79ccf9df85fc.png">

<img width="500" alt="image" src="https://user-images.githubusercontent.com/80145586/201480933-3b7e31d6-73f5-4bfa-9455-c35544ed1668.png">


# Proxy nomor 3
Saat akses internet dibuka, client dilarang untuk mengakses web tanpa HTTPS. (Contoh web HTTP: http://example.com)
## Pada node Berlint
Menambahkan line berikut dalam `/etc/squid/squid.conf`
```
...
acl HTTPS port 443

...
http_access deny HARI_KERJA HTTPS
http_access deny AVAILABLE_WORKING !HTTPS
http_access deny AVAILABLE_WORKING2 !HTTPS
http_access deny HARI_LIBUR !HTTPS

```
## Pada node Client
Menjalankan command
```
export https_proxy="https://10.20.2.3:8080"
```

# Proxy nomor 4
Agar menghemat penggunaan, akses internet dibatasi dengan kecepatan maksimum 128 Kbps pada setiap host
## Pada node Berlint
Membuat file `/etc/squid/acl-bandwidth.conf`dan tambahkan
```
delay_pools 2
delay_class 1 1
delay_class 1 2
delay_access 1 allow all
delay_access 2 allow all
delay_parameters 2 128000/128000 128000/128000
```
Menambahkan line berikut dalam `/etc/squid/acl-bandwidth.conf`
```
include /etc/squid/acl-bandwidth.conf
```
## Pada node Client
Menginstal speedtest-cli
```
apt-get update
apt install speedtest-cli
```
Non-aktifkan verifikasi sertifikat python dengan command `export PYTHONHTTPSVERIFY=0`.

## Hasil testing
Testing alternatif dapat dilakukan dengan mengambil header paket menggunakan `curl -I`. Untuk testing website https, `curl -k` juga digunakan untuk membypass pengecekan sertifikat SSL pada website HTTPS. Speedtest menggunakan versi secure dengan command `speedtest-cli --secure`

### Pada Jam Kerja 
Akses HTTP Gagal (Jam Kerja)

<img width="400" alt="image" src="https://user-images.githubusercontent.com/80145586/201479049-03ab767c-2f3d-4d8c-92a7-d4b4a64a20bc.png">

Akses HTTPS Gagal (Jam Kerja)

<img width="400" alt="image" src="https://user-images.githubusercontent.com/80145586/201479061-ca603d5c-f8c7-4484-8aa8-4c847d1ee719.png">

Akses Loid-Work.com Berhasil (Jam Kerja)

<img width="400" alt="image" src="https://user-images.githubusercontent.com/80145586/201479092-a40cdc43-88e7-4cb8-9888-aaddcb5c98e7.png">

Tidak bisa test kecepatan (HTTPS diblokir) 

<img width="500" alt="image" src="https://user-images.githubusercontent.com/80145586/201480790-770ab9ad-a1ed-497b-99e0-233a7d0e370c.png">

### Pada hari biasa bukan jam kerja
Akses HTTP Gagal (bukan jam kerja)

<img width="400" alt="image" src="https://user-images.githubusercontent.com/80145586/201479099-87b9e5db-8d50-4717-9f31-bb510ea99800.png">

Akses HTTPS Berhasil (bukan jam kerja)

<img width="450" alt="image" src="https://user-images.githubusercontent.com/80145586/201479112-218099c4-1507-4665-8198-643f4c1a798e.png">

Akses Loid-Work.com Gagal (bukan jam kerja)

<img width="400" alt="image" src="https://user-images.githubusercontent.com/80145586/201479125-ffca1a6d-d099-4713-b5b6-7391a82f250b.png">

Kecepatan terbatas (bukan jam kerja)

<img width="500" alt="image" src="https://user-images.githubusercontent.com/80145586/201480731-ec611225-1019-4c9b-add0-8298f6b11ede.png">


### Pada hari libur
Akses HTTP Gagal (libur)

<img width="400" alt="image" src="https://user-images.githubusercontent.com/80145586/201479134-2abfc8aa-1962-447c-b8e1-d15e641ac19d.png">

Akses HTTPS Berhasil (libur)

<img width="450" alt="image" src="https://user-images.githubusercontent.com/80145586/201479152-e8d079fd-1652-4c60-821d-0a663bbf7aa6.png">

Akses Loid-work.com Gagal (libur)

<img width="400" alt="image" src="https://user-images.githubusercontent.com/80145586/201479162-53717c0d-e1bf-412a-bb6d-c192b5d04402.png">

Kecepatan Terbatas (libur)

<img width="500" alt="image" src="https://user-images.githubusercontent.com/80145586/201480742-65204390-8555-49c0-b1e8-4ec3b73da203.png">