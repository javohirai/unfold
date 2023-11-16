import 'package:flutter/material.dart';
import 'package:unsplash/domain/entity/photo.dart';
import 'package:unsplash/domain/exception/oauth_exception.dart';
import 'package:unsplash/domain/navigation/main_navigation.dart';
import 'package:unsplash/domain/service/photos_service.dart';

class ReelModel extends ChangeNotifier {
  var _photoPage = 0;
  var _photoList = <Photo>[];

  final _photoService = PhotoService();
  final BuildContext context;
  List<Photo> get photos => _photoList;

  ReelModel(this.context) {
    _loadPhotos();
  }

  Future<void> loadPhotos() async {
    _loadPhotos();
  }

  Future<void> _loadPhotos() async {
    _photoPage += 1;
    final photoList = await _photoService.loadPhotos(_photoPage);
    _photoList = photoList;
    notifyListeners();
  }

  Future<void> showPhotosAtIndex(BuildContext context, int index) async {
    if (index < _photoList.length - 1) return;
    try {
      _loadPhotos();
    } on OauthException catch (e) {
      OauthException.catchTokenException(context, e);
    }
  }

  void onPhotoTap(String photoId) {
    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.photo, arguments: photoId);
  }

  
}
