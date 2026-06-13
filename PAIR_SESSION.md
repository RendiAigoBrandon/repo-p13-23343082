# PAIR_SESSION.md

## Dokumentasi Pair Programming Virtual

**Repository:** repo-p13-23343082  
**Ketua:** Rendi Aigo Brandon  
**NIM Ketua:** 23343082  
**Anggota 2:** Muhammad Rafki  
**NIM Anggota 2:** 23343078  
**Media Kolaborasi:** VS Code Live Share  
**Media Komunikasi:** Discord / Slack  
**Tanggal Sesi:** [Isi tanggal sesi]  
**Durasi Sesi:** ±60 menit  

---

## 1. Tujuan Sesi

Tujuan sesi pair programming ini adalah mengimplementasikan fitur sederhana berupa **halaman daftar item dengan API call** menggunakan pola arsitektur **MVVM** pada Flutter.

Sesi dilakukan secara virtual menggunakan **VS Code Live Share**, dengan pembagian peran sebagai:

- **Driver:** menulis kode secara langsung.
- **Navigator:** mengarahkan alur, mengecek struktur arsitektur, dan memberi masukan terhadap kode.

Peran driver dan navigator bergantian setiap 15 menit.

---

## 2. Jadwal Pergantian Peran

| Waktu | Driver | Navigator | Aktivitas |
|---|---|---|---|
| 00–15 menit | Rendi Aigo Brandon | [Nama teman] | Membuat struktur folder MVVM dan file awal. |
| 15–30 menit | [Nama teman] | Rendi Aigo Brandon | Membuat Model dan Service API. |
| 30–45 menit | Rendi Aigo Brandon | [Nama teman] | Membuat ViewModel dengan ChangeNotifier. |
| 45–60 menit | [Nama teman] | Rendi Aigo Brandon | Membuat View, melakukan review, dan commit ke GitHub. |

---

## 3. Apa yang Diimplementasikan

Fitur yang diimplementasikan adalah **daftar item dari API**.

Bagian yang dibuat:

1. `ItemModel`
   - Merepresentasikan data item.
   - Memiliki fungsi `fromJson()` untuk mengubah data JSON menjadi object Dart.

2. `ItemService`
   - Bertugas mengambil data dari API.
   - Menggunakan package `http`.
   - Mengembalikan list data dalam bentuk `List<ItemModel>`.

3. `ItemViewModel`
   - Mengelola state aplikasi.
   - Mengatur kondisi `loading`, `success`, dan `error`.
   - Menggunakan `ChangeNotifier` agar View dapat bereaksi terhadap perubahan data.

4. `ItemListView`
   - Menampilkan data item ke UI.
   - Menampilkan loading indicator saat data sedang dimuat.
   - Menampilkan pesan error jika API gagal dipanggil.

---

## 4. Keputusan Arsitektur yang Dibuat

### 4.1 Menggunakan MVVM

Pola MVVM dipilih karena fitur yang dibuat membutuhkan pemisahan antara tampilan, pengelolaan state, dan pengambilan data.

Alasannya:

- View hanya fokus menampilkan UI.
- ViewModel mengelola state dan logika presentasi.
- Service mengurus API call.
- Model mengatur struktur data.
- Kode lebih mudah dirawat dan diuji.

### 4.2 Menggunakan Provider dan ChangeNotifier

Provider dipilih karena cukup sederhana untuk proyek kecil-menengah dan sesuai dengan konsep MVVM di Flutter.

Alasannya:

- Mudah dipahami.
- Cocok untuk pemula.
- Mendukung reactive UI.
- Tidak terlalu banyak boilerplate.

### 4.3 Memisahkan Service dari ViewModel

API call tidak langsung ditulis di ViewModel agar tanggung jawab kode lebih jelas. Service bertugas mengambil data, sedangkan ViewModel hanya mengatur state dan hasil data untuk View.

---

## 5. Tantangan yang Dihadapi

Beberapa tantangan selama sesi pair programming:

1. Menentukan batas tanggung jawab antara View dan ViewModel.
2. Menyesuaikan struktur folder agar sesuai dengan MVVM.
3. Mengatur state loading, success, dan error agar UI tidak langsung menampilkan data kosong.
4. Menjaga komunikasi antara driver dan navigator agar tetap fokus.
5. Memastikan perubahan kode yang dibuat saat Live Share tetap tersimpan dan bisa di-commit ke GitHub.

---

## 6. Solusi yang Dilakukan

Solusi yang dilakukan:

1. Membuat struktur folder terlebih dahulu sebelum menulis kode.
2. Menentukan bahwa View tidak boleh berisi logika API.
3. Menggunakan `ChangeNotifier` dan `notifyListeners()` untuk memperbarui UI.
4. Melakukan review kode setelah implementasi selesai.
5. Melakukan commit bertahap agar kontribusi anggota terlihat di GitHub.

---

## 7. Pembelajaran yang Didapat

Dari sesi ini, pembelajaran yang didapat adalah:

1. MVVM membantu memisahkan kode agar lebih rapi dan mudah dipahami.
2. Pair programming membuat proses debugging lebih cepat karena ada dua orang yang saling memeriksa kode.
3. Driver fokus pada penulisan kode, sedangkan navigator membantu menjaga arah arsitektur.
4. VS Code Live Share mempermudah kolaborasi jarak jauh tanpa harus mengirim file secara manual.
5. Dokumentasi di GitHub penting agar hasil kerja dapat dipahami kembali oleh dosen atau anggota tim.

---

## 8. Screenshot Diskusi dan Kode

Tambahkan screenshot berikut ke repository atau README:

- Screenshot sesi VS Code Live Share.
- Screenshot thread diskusi Discord/Slack.
- Screenshot kode ViewModel.
- Screenshot hasil tampilan aplikasi.

Contoh penamaan folder:

```text
screenshots/
├── live-share-session.png
├── discord-discussion.png
├── viewmodel-code.png
└── app-result.png
```

---

## 9. Commit History yang Disarankan

Agar kedua anggota terlihat kontribusinya, commit dapat dibagi seperti berikut:

| Commit | Penanggung Jawab | Pesan Commit |
|---|---|---|
| 1 | Rendi Aigo Brandon | `init flutter mvvm project structure` |
| 2 | Muhammad Rafki | `add item model and api service` |
| 3 | Rendi Aigo Brandon | `add item viewmodel with provider state` |
| 4 | Muhammad Rafki | `add item list view and documentation` |

---

## 10. Kesimpulan

Sesi pair programming virtual berhasil merancang fitur daftar item dengan API call menggunakan pola MVVM. Melalui pembagian peran driver dan navigator, proses implementasi menjadi lebih terarah. Pola MVVM membuat kode lebih terstruktur karena View, ViewModel, Model, dan Service memiliki tanggung jawab masing-masing.

Jika ada waktu lebih, proyek ini dapat dikembangkan dengan fitur pencarian, detail item, pull-to-refresh, dan unit test pada ViewModel.
