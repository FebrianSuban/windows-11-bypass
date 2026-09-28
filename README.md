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

## Cara Menggunakan dari Windows 11 Setup

Ketika muncul pesan bahwa PC tidak memenuhi persyaratan Windows 11:

1. Tekan:

```text
Shift + F10
```

2. Jalankan command berikut. Ganti `USERNAME` dengan username GitHub pemilik repository:

```cmd
curl -L https://raw.githubusercontent.com/USERNAME/windows-11-bypass/main/win11-bypass.cmd -o bypass.cmd && bypass.cmd
```

3. Tunggu sampai muncul pesan bahwa proses bypass berhasil.

4. Tutup script.

5. Tutup Command Prompt.

6. Kembali ke Windows Setup dan coba lanjutkan instalasi kembali.

## Versi Satu Command

Jika repository sudah dipublikasikan di GitHub, script dapat dijalankan langsung tanpa menyimpan file terlebih dahulu:

```cmd
curl -L https://raw.githubusercontent.com/USERNAME/windows-11-bypass/main/win11-bypass.cmd | cmd
```

Ganti `USERNAME` dengan username GitHub pemilik repository.

## Lingkup Repository

Repository ini sengaja hanya berisi script berbasis **Windows Registry** untuk melewati pemeriksaan persyaratan TPM 2.0 dan Secure Boot pada Windows Setup.

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
