import 'package:flutter/material.dart';
import 'package:unsplash/domain/entity/collection.dart';
import 'package:unsplash/domain/navigation/main_navigation.dart';
import 'package:unsplash/domain/service/collection_service.dart';

class CollectionListModel extends ChangeNotifier {
  var _collectionPage = 0;
  var _collectionList = <Collection>[];

  final BuildContext context;
  final _collectionService = CollectionService();
  List<Collection> get collectinos => _collectionList;

  CollectionListModel(this.context) {
    _loadCollections();
  }

  Future<void> _loadCollections() async {
    _collectionPage += 1;
    final collectionList =
        await _collectionService.loadCollections(_collectionPage);
    _collectionList = collectionList;
    notifyListeners();
  }

  void onCollectionTap(String collectionId) {
    Navigator.of(context).pushNamed(MainNavigationRouteNames.collection,
        arguments: collectionId);
  }
}
