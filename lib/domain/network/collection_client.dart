import 'package:dio/dio.dart';
import 'package:unsplash/domain/entity/collection.dart';
import 'package:unsplash/domain/entity/photo.dart';
import 'package:unsplash/domain/exception/oauth_exception.dart';
import 'package:unsplash/domain/interceptor/dio_interceptor.dart';
import 'package:unsplash/domain/network/network_contract.dart';

class CollectionClient {
  final _dio = Dio();
  int perPage = 20;

  CollectionClient() {
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

  Future<Collection?> loadCollection(String collectionId) async {
    try {
      final response = await _dio
          .get('${NetworkContract.baseUrl}/collections/$collectionId');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Collection.fromJson(response.data);
      }
    } on DioException catch (e) {
      _exceptCatch(e);
    }
    return null;
  }

  Future<List<Photo>?> loadCollectionPhotos(String collectionId) async {
    final photoList = <Photo>[];
    try {
      final response = await _dio
          .get('${NetworkContract.baseUrl}/collections/$collectionId/photos');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = response.data.map((e) => Photo.fromJson(e));
        for (final item in result) {
          photoList.add(item);
        }
        return photoList;
      }
    } on DioException catch (e) {
      _exceptCatch(e);
    }
    return null;
  }

  Future<List<Collection>> loadCollections(int page) async {
    final queryParameters = <String, dynamic>{
      "page": "$page",
      "per_page": perPage.toString()
    };
    final collectionList = <Collection>[];
    try {
      final response = await _dio.get(
        '${NetworkContract.baseUrl}/collections',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = response.data.map((e) => Collection.fromJson(e));
        for (final item in result) {
          collectionList.add(item);
        }
      }
    } on DioException catch (e) {
      _exceptCatch(e);
    }
    return collectionList;
  }
}
