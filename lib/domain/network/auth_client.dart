import 'package:dio/dio.dart';
import 'package:unsplash/domain/entity/photo_user.dart';
import 'package:unsplash/domain/exception/oauth_exception.dart';
import 'package:unsplash/domain/network/network_contract.dart';
import 'package:unsplash/utils.dart';

class AuthClient {
  final _dio = Dio();

  bool _exceptCatch(DioException e) {
    final response = e.response;
    if (response == null) return false;
    final responseCode = response.statusCode;
    if (responseCode == 403) {
      throw const OauthException(
        oauthReason: OauthReason.tokenIsInvalid,
      );
    }
    return false;
  }

  Future<String> getAccessToken(String code) async {
    final data = <String, dynamic>{
      "client_id": Utils.clientId,
      "client_secret": Utils.secretKey,
      "redirect_uri": Utils.redirectUri,
      "code": code,
      "grant_type": "authorization_code",
    };
    try {
      final response = await _dio.post(
        'https://unsplash.com/oauth/token',
        data: data,
      );
      if (response.statusCode == 200) {
        final result = response.data as Map<String, dynamic>;
        return result['access_token'];
      }
    } on DioException catch (e) {
      _exceptCatch(e);
    }
    return '';
  }

  Future<PhotoUser?> getMe() async {
    try {
      final response = await _dio.get('${NetworkContract.baseUrl}/me');
      if (response.statusCode == 200) {
        return PhotoUser.fromJson(response.data);
      }
    } on DioException catch (e) {
      _exceptCatch(e);
    }
    return null;
  }
}
