import 'package:unsplash/domain/entity/collection.dart';
import 'package:unsplash/domain/entity/photo.dart';
import 'package:unsplash/domain/network/collection_client.dart';

class CollectionService {
  final _collectionClient = CollectionClient();

  Future<Collection?> loadCollection(String collectionId) async {
    return await _collectionClient.loadCollection(collectionId);
  }

  Future<List<Photo>?> loadCollectionPhotos(String collectionId) async {
    return await _collectionClient.loadCollectionPhotos(collectionId);
  }
}
