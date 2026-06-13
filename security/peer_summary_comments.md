# Komentar Konstruktif untuk Ringkasan Teman

## Komentar untuk Teman 1

Analisis kamu sudah tajam pada bagian secure storage karena sudah membedakan data biasa dan data sensitif. Kerentanan yang mungkin masih terlewat adalah risiko sensitive data exposure melalui log debug atau console. Referensi tambahan yang bisa digunakan adalah OWASP MASTG bagian testing logs for sensitive data.

## Komentar untuk Teman 2

Pembahasan kamu kuat pada bagian komunikasi API dan pentingnya HTTPS. Namun, kerentanan yang mungkin masih terlewat adalah risiko Man-in-the-Middle jika aplikasi hanya mengandalkan HTTPS tanpa certificate pinning untuk endpoint kritis. Referensi tambahan yang relevan adalah OWASP Certificate and Public Key Pinning serta OWASP MASTG bagian network communication.
