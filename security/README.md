# Security Checklist - Pertemuan 14

Folder ini ditambahkan untuk memenuhi tugas Pertemuan 14. Isinya merangkum security checklist dan contoh implementasi secure storage pada Flutter.

## 1. Penyimpanan Data

- [ ] Jangan simpan password, access token, atau refresh token di `SharedPreferences`.
- [ ] Gunakan `flutter_secure_storage` untuk token dan data sensitif.
- [ ] Jangan tampilkan token atau data sensitif di log.
- [ ] Hapus token dari secure storage saat logout.
- [ ] Enkripsi database lokal jika menyimpan data sensitif.

## 2. Komunikasi API

- [ ] Semua endpoint wajib menggunakan HTTPS.
- [ ] Jangan gunakan HTTP untuk data pengguna.
- [ ] Jangan hardcode API key rahasia di source code.
- [ ] Gunakan certificate pinning untuk endpoint kritis.
- [ ] Tangani error API tanpa membocorkan detail teknis.

## 3. Autentikasi dan Token

- [ ] Access token harus memiliki expiry.
- [ ] Refresh token disimpan dengan aman.
- [ ] Implementasikan token refresh ketika mendapat HTTP 401.
- [ ] Logout harus menghapus token di client dan menginvalidasi token di server.
- [ ] Jangan menyimpan credential pengguna dalam plaintext.

## 4. Validasi Input

- [ ] Validasi input kosong.
- [ ] Validasi format email, nomor, atau field khusus.
- [ ] Batasi panjang input.
- [ ] Gunakan whitelist validation.
- [ ] Validasi ulang di sisi server.

## 5. Permission dan Privasi

- [ ] Minta permission hanya saat fitur digunakan.
- [ ] Jangan meminta permission yang tidak diperlukan.
- [ ] Jelaskan alasan penggunaan permission kepada pengguna.
- [ ] Hindari pengumpulan data berlebihan.

## 6. Build dan Release

- [ ] Pastikan debug mode tidak aktif di production.
- [ ] Aktifkan obfuscation saat build release.
- [ ] Jangan commit file debug-info ke GitHub.
- [ ] Periksa dependency sebelum release.
- [ ] Gunakan versi package stabil.

## 7. Contoh Kode

Contoh kode secure storage terdapat pada file:

```text
secure_storage_example.dart
```

Tambahkan package berikut ke `pubspec.yaml`:

```yaml
dependencies:
  flutter_secure_storage: ^9.2.2
```
