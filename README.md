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

2. Di Command Prompt, jalankan satu baris ini untuk membuat nilai registry yang melewati pemeriksaan TPM 2.0 dan Secure Boot:

```cmd
reg add HKLM\SYSTEM\Setup\LabConfig /v BypassTPMCheck /t REG_DWORD /d 1 /f && reg add HKLM\SYSTEM\Setup\LabConfig /v BypassSecureBootCheck /t REG_DWORD /d 1 /f
```

Kedua perintah akan menampilkan `The operation completed successfully` jika berhasil. Cara ini tidak memerlukan `curl` atau file tambahan di USB.

3. Tutup Command Prompt.
4. Kembali ke Windows Setup dan coba lanjutkan instalasi.

### Alternatif: Jalankan Script dari USB

Sebelum boot ke Windows Setup, salin `bypass.cmd` dari repository ini ke root USB instalasi. Jika USB dikenali sebagai `D:`, buka Command Prompt dengan `Shift + F10`, lalu jalankan:

```cmd
D:bypass.cmd
```

Ganti `D:` dengan huruf drive USB jika berbeda. Windows Setup mungkin tidak menyediakan `curl`, jadi script harus disalin ke USB terlebih dahulu.

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
