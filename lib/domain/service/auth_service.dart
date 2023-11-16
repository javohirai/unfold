import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unsplash/domain/network/auth_client.dart';

abstract class AuthServiceKeys {
  static const oauthCodeKey = "oauth_code";
  static const accessTokenKey = "access_token";
  static const userIdKey = "user_id";
}

class AuthService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final _storage = const FlutterSecureStorage();
  final _authClient = AuthClient();

  static String getOauthCodeUrl(
    String clientId,
    String redirectUri,
    String responseType,
    String scope,
  ) =>
      'https://unsplash.com/oauth/authorize?client_id=$clientId&redirect_uri=$redirectUri&response_type=$responseType&scope=$scope';

  IOSOptions _getIOSOptions() => IOSOptions();

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
        // sharedPreferencesName: 'Test2',
        // preferencesKeyPrefix: 'Test'
      );

  Future<void> saveOauthCode(String code) async {
    await _storage.write(
      key: AuthServiceKeys.oauthCodeKey,
      value: code,
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
  }

  Future<String?> getOauthCode() async {
    return await _storage.read(
      key: AuthServiceKeys.oauthCodeKey,
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
  }

  Future<void> saveAccessToken(String? accessToken) async {
    await _storage.write(
      key: AuthServiceKeys.accessTokenKey,
      value: accessToken,
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(
      key: AuthServiceKeys.accessTokenKey,
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
  }

  Future<bool> isAuth() async {
    final accessToken = await getAccessToken();
    return accessToken != null && accessToken.isNotEmpty;
  }

  Future<bool> accessTokenGrant() async {
    final code = await getOauthCode();
    if (code == null) return false;
    final accessToken = await _authClient.getAccessToken(code);
    if (accessToken != '') {
      await saveAccessToken(accessToken);
      return true;
    }
    return false;
  }

  Future<void> setUserName(String userId) async {
    final prefs = await _prefs;
    await prefs.setString(AuthServiceKeys.userIdKey, userId);
  }

  Future<String?> getUsername() async {
    final prefs = await _prefs;
    return prefs.getString(AuthServiceKeys.userIdKey);
  }

}
