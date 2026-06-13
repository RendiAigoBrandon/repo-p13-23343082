import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

/// Contoh konsep certificate pinning menggunakan Dio.
///
/// Catatan:
/// - File sertifikat harus disiapkan di assets/certificates/server.pem.
/// - Untuk production, gunakan strategi pinning yang sesuai dengan rotasi sertifikat server.
class SecureHttpClient {
  static Dio createPinnedDio() {
    final securityContext = SecurityContext(withTrustedRoots: false);

    final certBytes = File('assets/certificates/server.pem').readAsBytesSync();
    securityContext.setTrustedCertificatesBytes(certBytes);

    final httpClient = HttpClient(context: securityContext);
    httpClient.badCertificateCallback = (cert, host, port) => false;

    final adapter = IOHttpClientAdapter();
    adapter.createHttpClient = () => httpClient;

    final dio = Dio();
    dio.httpClientAdapter = adapter;

    return dio;
  }
}
