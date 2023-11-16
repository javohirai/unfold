import 'package:dio/dio.dart';
import 'package:unsplash/domain/entity/photo.dart';
import 'package:unsplash/domain/exception/oauth_exception.dart';
import 'package:unsplash/domain/interceptor/dio_interceptor.dart';
import 'package:unsplash/domain/network/network_contract.dart';
import 'package:unsplash/utils.dart';

class PhotoClient {
  final _dio = Dio();
  final perPage = 20;

  PhotoClient() {
    _dio.interceptors.add(DioInterceptor());
  }

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

  Future<List<Photo>> loadPhotos(int page) async {
    final queryParameters = <String, dynamic>{
      "page": "$page",
      "client_id": Utils.clientId,
      "per_page": perPage.toString()
    };
    final photoList = <Photo>[];
    final response = await _dio.get(
      '${NetworkContract.baseUrl}/photos',
      queryParameters: queryParameters,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final result = response.data.map((e) => Photo.fromJson(e));
      for (final item in result) {
        photoList.add(item);
      }
    }
    return photoList;
  }

  Future<Photo?> loadPhoto(String photoId) async {
    try {
      final response = await _dio.get(
        '${NetworkContract.baseUrl}/photos/$photoId',
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Photo.fromJson(response.data as Map<String, dynamic>);
      }
    } on DioException catch (e) {
      _exceptCatch(e);
      return null;
    }
    return null;
  }

  Future<bool> likePhoto(String photoId) async {
    try {
      final response = await _dio.post(
        '${NetworkContract.baseUrl}/photos/$photoId/like',
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
    } on DioException catch (e) {
      return _exceptCatch(e);
    }
    return false;
  }

  Future<bool> unlikePhoto(String photoId) async {
    try {
      final response = await _dio.delete(
        '${NetworkContract.baseUrl}/photos/$photoId/like',
      );
      if (response.statusCode == 200) {
        return true;
      }
    } on DioException catch (e) {
      return _exceptCatch(e);
    }
    return false;
  }
}
