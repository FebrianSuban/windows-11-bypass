# Bypass TPM 2.0 dan Secure Boot Windows 11

Script sederhana untuk Windows Setup yang digunakan untuk melewati pemeriksaan persyaratan **TPM 2.0** dan **Secure Boot** pada instalasi Windows 11.

## Apa yang Diubah?

Script membuat registry key berikut:

`HKLM\SYSTEM\Setup\LabConfig`

Kemudian menambahkan:

* `BypassTPMCheck` = `1`
* `BypassSecureBootCheck` = `1`

Script ini **tidak mengubah**:

* Partisi disk
* Bootloader
* File pribadi
* File instalasi Windows
* Hardware TPM
* Pengaturan Secure Boot pada firmware/BIOS

## Cara Menggunakan

Ketika muncul pesan bahwa PC tidak memenuhi persyaratan Windows 11:

1. Tekan:

```text
Shift + F10
```

2. Sebelum memulai instalasi, simpan `bypass.cmd` di root USB instalasi Windows. Di Command Prompt Windows Setup, jalankan perintah ini untuk mencari dan menjalankan file di drive USB:

```cmd
for %D in (D E F G H I J K L M N O P Q R S T U V W Y Z) do @if exist %D:/bypass.cmd call %D:/bypass.cmd
```

Perintah ini tidak memerlukan `curl` atau koneksi internet. Jika tidak berjalan, pastikan file berada langsung di root USB dan huruf drive USB termasuk dalam daftar di atas. Script akan menampilkan `SUCCESS` jika berhasil.

3. Tutup Command Prompt.
4. Kembali ke Windows Setup dan coba lanjutkan instalasi.

Pastikan file `bypass.cmd` berada di root USB sebelum memulai instalasi.

## Lingkup Repository

Repository ini hanya berisi script berbasis **Windows Registry** untuk melewati pemeriksaan persyaratan TPM 2.0 dan Secure Boot pada Windows Setup.

Script ini **tidak mencoba** untuk:

* Menonaktifkan Secure Boot pada firmware/BIOS
* Memodifikasi hardware TPM
* Mengubah partisi disk
* Mengubah bootloader
* Menghapus atau mengubah file pribadi pengguna

Penggunaan bypass ini dapat membuat konfigurasi Windows 11 tidak memenuhi persyaratan hardware resmi Microsoft. Gunakan dengan memahami konsekuensinya, terutama pada dukungan dan kompatibilitas sistem.

## Catatan

Script ini dibuat untuk penggunaan pada sistem atau virtual machine yang pengguna memiliki izin untuk mengelolanya.

Selalu periksa isi script sebelum menjalankannya dari sumber yang tidak dikenal.
