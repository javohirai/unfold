import 'package:dio/dio.dart';
import 'package:unsplash/domain/entity/photo_user.dart';
import 'package:unsplash/domain/exception/oauth_exception.dart';
import 'package:unsplash/domain/entity/photo.dart';
import 'package:unsplash/domain/interceptor/dio_interceptor.dart';
import 'package:unsplash/domain/network/network_contract.dart';

class UserClient {
  final _dio = Dio();
  int perPage = 20;

  UserClient() {
    _dio.interceptors.add(DioInterceptor());
  }
  bool _exceptCatch(DioException e) {
    final response = e.response;
    print(e);
    if (response == null) return false;
    final responseCode = response.statusCode;
    if (responseCode == 403) {
      throw const OauthException(
        oauthReason: OauthReason.tokenIsInvalid,
      );
    }
    return false;
  }

  Future<PhotoUser?> getMe() async {
    try {
      final response = await _dio.get('${NetworkContract.baseUrl}/me');
      if (response.statusCode == 200) {
        return PhotoUser.fromJson(response.data);
      }
    } on DioException catch (e) {
      print('IIIIIII');
      _exceptCatch(e);
    }
    return null;
  }

  Future<List<Photo>> loadUserPhotos(String username, int page) async {
    final queryParameters = <String, dynamic>{
      "page": "$page",
      "per_page": perPage.toString()
    };
    final photoList = <Photo>[];
    try {
      final response = await _dio.get(
        '${NetworkContract.baseUrl}/users/$username/likes',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = response.data.map((e) => Photo.fromJson(e));
        for (final item in result) {
          photoList.add(item);
        }
      }
    } on DioException catch (e) {
      _exceptCatch(e);
    }
    return photoList;
  }
}
