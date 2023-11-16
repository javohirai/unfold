import 'package:flutter/material.dart';
import 'package:unsplash/domain/entity/photo.dart';
import 'package:unsplash/domain/exception/oauth_exception.dart';
import 'package:unsplash/domain/navigation/main_navigation.dart';
import 'package:unsplash/domain/service/auth_service.dart';
import 'package:unsplash/domain/service/user_service.dart';

class LikedPhotosModel extends ChangeNotifier {
  var _photoPage = 0;
  var _photoList = <Photo>[];

  final _userService = UserService();
  final _authService = AuthService();
  final BuildContext context;
  List<Photo> get photos => _photoList;

  LikedPhotosModel(this.context) {
    _loadPhotos();
  }

  Future<void> loadPhotos() async {
    _loadPhotos();
  }

  Future<void> _loadPhotos() async {
    _photoPage += 1;
    var photoList;
    try {
      final userName = await _authService.getUsername();
      photoList = await _userService.loadUserPhotos(
        userName ?? '',
        _photoPage,
      );
    } on OauthException catch (e) {
      OauthException.catchTokenException(context, e);
      return;
    }
    _photoList = photoList;
    notifyListeners();
  }

  Future<void> showPhotosAtIndex(BuildContext context, int index) async {
    if (index < _photoList.length - 1) return;
    try {
      _loadPhotos();
    } on OauthException catch (e) {
      OauthException.catchTokenException(context, e);
      return;
    }
  }

  void onPhotoTap(String photoId) {
    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.photo, arguments: photoId);
  }
}
