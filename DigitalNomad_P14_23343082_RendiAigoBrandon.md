# DigitalNomad_P14_23343082_RendiAigoBrandon

## Aktivitas Digital Nomad Pertemuan 14
### Security Code Review, Ringkasan Analitis, dan Implementasi Secure Storage di Flutter

**Nama:** Rendi Aigo Brandon  
**NIM:** 23343082  
**Mata Kuliah:** Mobile Programming Lanjutan  
**Pertemuan:** 14  
**Topik:** Keamanan Aplikasi Mobile: Ancaman, Strategi, dan Implementasi  
**Repositori yang diperbarui:** repo-p13-23343082  

---

## 1. Konteks Tugas

Pertemuan 14 membahas keamanan aplikasi mobile, khususnya OWASP Mobile Top 10, OAuth2 dan JWT, secure storage di Flutter, HTTPS, certificate pinning, secure coding, dan prinsip least privilege. Aktivitas Digital Nomad pada pertemuan ini menekankan praktik security code review, analisis sumber keamanan, pembaruan repository GitHub, serta komentar konstruktif kepada teman.

Dokumen ini berisi:
1. Template komentar security code review untuk GitHub Pull Request.
2. Ringkasan analitis dari dua sumber keamanan mobile.
3. Relevansi temuan terhadap pengembangan Flutter.
4. Rekomendasi implementasi.
5. Deskripsi folder `security/` yang perlu ditambahkan ke repository sebelumnya.

---

## 2. Security Code Review pada Repository Teman

### 2.1 Komentar tentang Penyimpanan Data

> Pada bagian penyimpanan data, sebaiknya token autentikasi, session ID, atau data sensitif tidak disimpan menggunakan `SharedPreferences` karena penyimpanannya tidak dirancang untuk data rahasia. Untuk aplikasi Flutter, lebih aman menggunakan `flutter_secure_storage` karena memanfaatkan Android Keystore dan iOS Keychain. Jika nanti fitur login ditambahkan, access token dan refresh token perlu disimpan di secure storage, bukan di local preference biasa.

### 2.2 Komentar tentang Komunikasi API

> Pada bagian service API, endpoint sudah menggunakan HTTP client, tetapi perlu dipastikan bahwa semua request menggunakan HTTPS, bukan HTTP. Selain itu, jika aplikasi digunakan untuk data sensitif, sebaiknya ditambahkan lapisan keamanan seperti certificate pinning atau minimal validasi domain API agar risiko Man-in-the-Middle dapat dikurangi. Error response juga sebaiknya tidak menampilkan detail teknis langsung ke UI.

### 2.3 Komentar tentang Validasi Input

> Pada bagian input pengguna, sebaiknya ditambahkan validasi sebelum data diproses oleh ViewModel atau dikirim ke service. Validasi dapat mencakup pengecekan input kosong, panjang minimal/maksimal, format email, dan karakter yang diizinkan. Validasi di sisi client penting untuk UX, tetapi tetap perlu divalidasi ulang di sisi server agar tidak terjadi bypass atau input berbahaya.

---

## 3. Ringkasan Analitis Sumber 1 — OWASP Mobile Top 10 2024

### Identitas Sumber

**Sumber:** OWASP Mobile Top 10 2024  
**Jenis:** Artikel/pedoman teknis keamanan mobile  
**Fokus:** Sepuluh risiko keamanan paling kritis pada aplikasi mobile  

### Temuan Utama

OWASP Mobile Top 10 2024 menyusun daftar risiko keamanan mobile yang perlu diperhatikan developer sejak tahap desain dan implementasi. Risiko yang paling relevan dengan pengembangan aplikasi Flutter antara lain improper credential usage, insecure authentication/authorization, insufficient input/output validation, insecure communication, insecure data storage, dan insufficient cryptography.

Temuan utama dari sumber ini adalah bahwa banyak kerentanan mobile bukan disebabkan oleh fitur yang kompleks, melainkan oleh praktik dasar yang kurang aman. Contohnya adalah menyimpan token dalam plaintext, tidak memvalidasi input, menggunakan komunikasi jaringan yang tidak aman, atau memasukkan credential langsung ke kode sumber. Risiko seperti ini dapat terjadi pada aplikasi kecil sekalipun jika developer hanya fokus pada fungsionalitas tanpa memikirkan keamanan.

OWASP juga menekankan bahwa keamanan harus dibangun secara berlapis. Satu mekanisme keamanan saja tidak cukup. Aplikasi perlu menggabungkan HTTPS, secure storage, validasi input, token management, dependency audit, dan konfigurasi release yang aman.

### Relevansi untuk Flutter

Dalam konteks Flutter, temuan OWASP sangat relevan karena Flutter sering digunakan untuk membangun aplikasi lintas platform yang terhubung dengan API dan menyimpan data lokal. Praktik yang perlu diterapkan adalah menggunakan `flutter_secure_storage` untuk token, menghindari penyimpanan data sensitif di `SharedPreferences`, menggunakan HTTPS pada semua endpoint, menambahkan validasi input pada form, tidak menampilkan stack trace kepada pengguna, melakukan audit package, dan mengaktifkan obfuscation pada build production.

### Rekomendasi Implementasi

1. Buat lapisan `security/` atau `core/security/` untuk menyimpan utilitas keamanan.
2. Gunakan secure storage untuk token dan data sensitif.
3. Tambahkan validasi input pada ViewModel sebelum memanggil service.
4. Pastikan semua API menggunakan HTTPS.
5. Jangan menyimpan API key di repository.
6. Gunakan error message yang aman dan tidak membocorkan detail sistem.
7. Audit dependency secara berkala.

---

## 4. Ringkasan Analitis Sumber 2 — Security Analysis of Top-Ranked mHealth Fitness Apps

### Identitas Sumber

**Sumber:** Security Analysis of Top-Ranked mHealth Fitness Apps: An Empirical Study  
**Jenis:** Jurnal/laporan penelitian keamanan mobile  
**Tahun:** 2024  
**Fokus:** Analisis keamanan aplikasi mobile kesehatan dan kebugaran populer  

### Temuan Utama

Studi ini menganalisis aplikasi kesehatan dan kebugaran Android populer dengan pendekatan static dan dynamic analysis menggunakan tools seperti MobSF, emulator Android, dan analisis keamanan server. Temuannya menunjukkan bahwa aplikasi populer pun masih dapat memiliki kelemahan seperti insecure coding, hardcoded sensitive information, permission berlebihan, konfigurasi yang kurang aman, dan komunikasi dengan terlalu banyak domain pihak ketiga.

Salah satu temuan penting adalah adanya aplikasi yang menyimpan API key atau URL database langsung di dalam kode. Praktik ini berbahaya karena aplikasi mobile dapat didekompilasi, sehingga informasi sensitif yang tertanam di aplikasi berpotensi ditemukan oleh penyerang. Selain itu, penggunaan metode enkripsi yang tidak aman seperti AES mode ECB menunjukkan bahwa penggunaan kriptografi tidak boleh dilakukan sembarangan.

Penelitian ini juga menyoroti risiko privasi akibat aplikasi berkomunikasi dengan banyak domain pihak ketiga. Semakin banyak domain yang terlibat, semakin besar potensi linkability dan pelacakan perilaku pengguna.

### Relevansi untuk Flutter

Bagi developer Flutter, studi ini memberi pelajaran bahwa keamanan bukan hanya urusan backend, tetapi juga client mobile. Aplikasi Flutter tetap dapat dibongkar, dianalisis, dan diperiksa oleh penyerang. Oleh karena itu, developer tidak boleh menyimpan secret, password, atau API key penting langsung di kode Dart. Developer juga perlu membatasi permission, menghindari log data sensitif, menerapkan secure storage, menggunakan HTTPS, dan melakukan review SDK pihak ketiga.

### Rekomendasi Implementasi

1. Lakukan dependency review sebelum menambahkan package baru.
2. Jangan commit file `.env`, private key, atau debug-info ke repository.
3. Gunakan prinsip least privilege pada permission.
4. Pisahkan konfigurasi development dan production.
5. Gunakan logging yang aman.
6. Lakukan review kode sebelum merge Pull Request.
7. Tambahkan checklist keamanan sebelum rilis aplikasi.

---

## 5. Analisis OWASP Mobile Top 10 untuk Proyek Flutter MVVM

| Kategori OWASP | Relevansi pada Proyek Flutter | Risiko | Mitigasi |
|---|---|---|---|
| M1 Improper Credential Usage | Jika proyek menambahkan login, token mungkin disimpan sembarangan. | Token dicuri dari local storage. | Gunakan `flutter_secure_storage`. |
| M4 Insufficient Input/Output Validation | Input pengguna dapat masuk tanpa validasi. | Crash, bypass, atau input berbahaya. | Validasi di ViewModel dan server. |
| M5 Insecure Communication | API call bisa rentan jika memakai HTTP. | MITM dan pencurian data. | Gunakan HTTPS dan certificate pinning untuk endpoint kritis. |
| M8 Security Misconfiguration | Debug mode atau konfigurasi permission berlebihan. | Data debug bocor atau permission disalahgunakan. | Audit konfigurasi sebelum release. |
| M9 Insecure Data Storage | Data cache atau token tersimpan tanpa enkripsi. | Data sensitif bocor pada perangkat rooted. | Enkripsi atau secure storage. |

---

## 6. Contoh Implementasi Flutter — Secure Storage

Contoh kode Flutter secure storage dapat diletakkan di:

```text
security/secure_storage_example.dart
```

```dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureTokenStorage {
  static const _storage = FlutterSecureStorage();

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    if (accessToken.isEmpty || refreshToken.isEmpty) {
      throw ArgumentError('Token tidak boleh kosong');
    }

    await _storage.write(key: _accessTokenKey, value: accessToken);
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  Future<void> clearTokens() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }
}
```

Tambahkan package berikut ke `pubspec.yaml`:

```yaml
dependencies:
  flutter_secure_storage: ^9.2.2
```

---

## 7. Refleksi Kritis

Hal paling mengejutkan dari materi keamanan mobile adalah bahwa banyak kerentanan tidak selalu berasal dari serangan yang rumit, tetapi dari keputusan kecil yang kurang aman. Contohnya adalah menyimpan token di penyimpanan biasa, menampilkan log yang berisi data sensitif, menggunakan HTTP, atau tidak memvalidasi input. Kesalahan seperti ini mudah terjadi pada proyek kecil karena developer sering fokus membuat aplikasi berjalan terlebih dahulu.

Setelah mempelajari materi ini, praktik coding yang akan saya terapkan adalah membiasakan security checklist sebelum aplikasi dianggap selesai. Saya juga akan memisahkan logika keamanan ke folder khusus, menggunakan secure storage untuk data sensitif, dan melakukan review terhadap package yang digunakan. Selain itu, saya akan menghindari hardcoded secret di kode dan lebih berhati-hati dalam menampilkan error message kepada pengguna.

---

## 8. Rekomendasi dan Rencana Implementasi

| Prioritas | Rekomendasi | Target |
|---|---|---|
| 1 | Secure Storage | Simpan token dan data sensitif menggunakan `flutter_secure_storage`. |
| 2 | HTTPS Only | Pastikan semua API endpoint menggunakan HTTPS. |
| 3 | Validasi Input | Validasi input di ViewModel dan server. |
| 4 | Error Handling Aman | Jangan tampilkan stack trace atau detail sistem ke UI. |
| 5 | Dependency Review | Periksa package dari pub.dev sebelum digunakan. |
| 6 | Least Privilege | Minta permission hanya ketika dibutuhkan. |
| 7 | Obfuscation | Aktifkan obfuscation pada build production. |

---

## 9. Komentar Konstruktif untuk Ringkasan 2 Teman

### Komentar untuk Teman 1

> Analisis kamu sudah tajam pada bagian secure storage karena sudah membedakan data biasa dan data sensitif. Kerentanan yang mungkin masih terlewat adalah risiko sensitive data exposure melalui log debug atau console. Referensi tambahan yang bisa digunakan adalah OWASP MASTG bagian testing logs for sensitive data.

### Komentar untuk Teman 2

> Pembahasan kamu kuat pada bagian komunikasi API dan pentingnya HTTPS. Namun, kerentanan yang mungkin masih terlewat adalah risiko Man-in-the-Middle jika aplikasi hanya mengandalkan HTTPS tanpa certificate pinning untuk endpoint kritis. Referensi tambahan yang relevan adalah OWASP Certificate and Public Key Pinning serta OWASP MASTG bagian network communication.

---

## 10. Referensi

1. OWASP Foundation. (2024). OWASP Mobile Top 10. https://owasp.org/www-project-mobile-top-10/
2. OWASP Foundation. (2024). OWASP Mobile Application Security Testing Guide. https://mas.owasp.org/MASTG/
3. OWASP Foundation. Mobile App Network Communication. https://mas.owasp.org/MASTG/0x04f-Testing-Network-Communication/
4. OWASP Foundation. Android Data Storage. https://mas.owasp.org/MASTG/0x05d-Testing-Data-Storage/
5. Forsberg, A., & Iwaya, L. H. (2024). Security Analysis of Top-Ranked mHealth Fitness Apps: An Empirical Study. arXiv. https://arxiv.org/abs/2409.18528
6. Pub.dev. flutter_secure_storage. https://pub.dev/packages/flutter_secure_storage
