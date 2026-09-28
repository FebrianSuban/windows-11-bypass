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

2. Ketik perintah berikut satu per satu di Command Prompt:

```cmd
reg add "HKLM\SYSTEM\Setup\LabConfig" /v BypassTPMCheck /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\Setup\LabConfig" /v BypassSecureBootCheck /t REG_DWORD /d 1 /f
```

Perintah tersebut tidak memerlukan `curl` atau koneksi internet. Untuk memastikan kedua nilai sudah dibuat, jalankan:

```cmd
reg query "HKLM\SYSTEM\Setup\LabConfig"
```

Pastikan hasilnya menampilkan `BypassTPMCheck` dan `BypassSecureBootCheck`, keduanya bernilai `0x1`.

3. Tutup Command Prompt.
4. Kembali ke Windows Setup dan coba lanjutkan instalasi.

Jika ingin menjalankan file `win11-bypass.cmd`, salin file tersebut ke USB sebelum memulai instalasi, lalu jalankan dari Command Prompt dengan path drive USB yang sesuai. Cara ini juga tidak memerlukan `curl`.

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
