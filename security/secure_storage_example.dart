import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Contoh implementasi secure storage untuk menyimpan token autentikasi.
///
/// Catatan:
/// - Jangan simpan token di SharedPreferences.
/// - Jangan print token ke console.
/// - Hapus token saat logout.
class SecureTokenStorage {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    if (accessToken.trim().isEmpty || refreshToken.trim().isEmpty) {
      throw ArgumentError('Access token dan refresh token tidak boleh kosong');
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

  Future<bool> hasActiveSession() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> clearTokens() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }
}
