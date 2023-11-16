import 'package:flutter/material.dart';
import 'package:unsplash/domain/entity/photo.dart';
import 'package:unsplash/domain/exception/oauth_exception.dart';
import 'package:unsplash/domain/navigation/main_navigation.dart';
import 'package:unsplash/domain/service/auth_service.dart';
import 'package:unsplash/domain/service/photos_service.dart';

class ReelModel extends ChangeNotifier {
  var _photoPage = 0;
  var _photoList = <Photo>[];

  final _photoService = PhotoService();
  final _authService = AuthService();
  final BuildContext context;
  List<Photo> get photos => _photoList;

  ReelModel(this.context) {
    _loadPhotos();
  }

  void catchTokenException(BuildContext context, OauthException e) async {
    if (e.oauthReason == OauthReason.tokenIsInvalid) {
      await _authService.saveAccessToken(null);
      Navigator.of(context).pushNamedAndRemoveUntil(
        MainNavigationRouteNames.loader,
        (route) => false,
      );
    }
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

  Future<void> showMovieAtIndex(BuildContext context, int index) async {
    if (index < _photoList.length - 1) return;
    try {
      _loadPhotos();
    } on OauthException catch (e) {
      catchTokenException(context, e);
    }
  }

  void onPhotoTap(String photoId) {
    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.photo, arguments: photoId);
  }

  
}
