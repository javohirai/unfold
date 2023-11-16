import 'package:unsplash/domain/entity/photo.dart';
import 'package:unsplash/domain/network/photo_client.dart';

class PhotoService {
  final _photoList = <Photo>[];
  final _photoClient = PhotoClient();

  Future<List<Photo>> loadPhotos(int page) async {
    _photoList.addAll(await _photoClient.loadPhotos(page));
    return _photoList;
  }

  Future<bool> likePhoto(String photoId) async {
    return await _photoClient.likePhoto(photoId);
  }

  Future<bool> unlikePhoto(String photoId) async {
    return await _photoClient.unlikePhoto(photoId);
  }

  Future<Photo?> loadPhoto(String photoId) async {
    return _photoClient.loadPhoto(photoId);
  }
}
