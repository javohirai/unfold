// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:unsplash/domain/entity/collection.dart';
import 'package:unsplash/domain/entity/photo.dart';
import 'package:unsplash/domain/exception/oauth_exception.dart';
import 'package:unsplash/domain/navigation/main_navigation.dart';
import 'package:unsplash/domain/service/collection_service.dart';

class CollectionModelDataProvider {
  String title;
  Collection? collection;
  List<Photo>? collectionPhotos;

  CollectionModelDataProvider({
    this.title = 'Collection ...',
    this.collectionPhotos,
    this.collection,
  });

  CollectionModelDataProvider copyWith({
    String? title,
    Collection? collection,
    List<Photo>? collectionPhotos,
  }) {
    return CollectionModelDataProvider(
      title: title ?? this.title,
      collection: collection ?? this.collection,
      collectionPhotos: collectionPhotos ?? this.collectionPhotos,
    );
  }
}

class CollectionModel extends ChangeNotifier {
  final BuildContext context;
  final String collectionId;
  CollectionModelDataProvider _collectionProvider =
      CollectionModelDataProvider();
  final _collectionService = CollectionService();

  CollectionModelDataProvider get collectionProvider => _collectionProvider;

  CollectionModel(this.context, this.collectionId) {
    _loadCollection();
    _loadCollectionPhotos();
  }

  void _loadCollection() async {
    Collection? collection;
    try {
      collection = await _collectionService.loadCollection(collectionId);
    } on OauthException catch (e) {
      OauthException.catchTokenException(context, e);
      return;
    }
    if (collection == null) return;
    _collectionProvider = _collectionProvider.copyWith(
        collection: collection, title: collection.title);
    notifyListeners();
  }

  void _loadCollectionPhotos() async {
    final collectionPhotos =
        await _collectionService.loadCollectionPhotos(collectionId);
    if (collectionPhotos == null) return;
    _collectionProvider =
        _collectionProvider.copyWith(collectionPhotos: collectionPhotos);
    notifyListeners();
  }

  void onPhotoTap(String photoId) {
    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.photo, arguments: photoId);
  }
}
