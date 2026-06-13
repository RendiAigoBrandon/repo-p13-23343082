# Security Code Review Comments

Gunakan komentar berikut pada GitHub Pull Request repository teman.

## 1. Penyimpanan Data

Pada bagian penyimpanan data, sebaiknya token autentikasi, session ID, atau data sensitif tidak disimpan menggunakan `SharedPreferences` karena penyimpanannya tidak dirancang untuk data rahasia. Untuk aplikasi Flutter, lebih aman menggunakan `flutter_secure_storage` karena memanfaatkan Android Keystore dan iOS Keychain. Jika nanti fitur login ditambahkan, access token dan refresh token perlu disimpan di secure storage, bukan di local preference biasa.

## 2. Komunikasi API

Pada bagian service API, endpoint sudah menggunakan HTTP client, tetapi perlu dipastikan bahwa semua request menggunakan HTTPS, bukan HTTP. Selain itu, jika aplikasi digunakan untuk data sensitif, sebaiknya ditambahkan lapisan keamanan seperti certificate pinning atau minimal validasi domain API agar risiko Man-in-the-Middle dapat dikurangi. Error response juga sebaiknya tidak menampilkan detail teknis langsung ke UI.

## 3. Validasi Input

Pada bagian input pengguna, sebaiknya ditambahkan validasi sebelum data diproses oleh ViewModel atau dikirim ke service. Validasi dapat mencakup pengecekan input kosong, panjang minimal/maksimal, format email, dan karakter yang diizinkan. Validasi di sisi client penting untuk UX, tetapi tetap perlu divalidasi ulang di sisi server agar tidak terjadi bypass atau input berbahaya.
