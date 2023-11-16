import 'package:dio/dio.dart';
import 'package:unsplash/utils.dart';

class AuthClient {
  final _dio = Dio();

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
        final result = response.data as Map<String,dynamic>;
        return result['access_token'];
      }
    } on DioException catch (e) {
      final response = e.response;
      final statusCode = response?.statusCode ?? 0;
      if (statusCode == 400) {
        print(e.message);
      }
    }
    return '';
  }
}
