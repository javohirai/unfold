import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unsplash/domain/entity/collection.dart';
import 'package:unsplash/domain/entity/photo.dart';
import 'package:unsplash/domain/exception/oauth_exception.dart';
import 'package:unsplash/domain/navigation/main_navigation.dart';
import 'package:unsplash/domain/service/photos_service.dart';

class PhotoTitleDataProvider {
  String title;
  bool likedByUser;
  Photo? photo;

  PhotoTitleDataProvider({
    this.title = '',
    this.likedByUser = false,
    this.photo,
  });

  PhotoTitleDataProvider copyWith({
    String? title,
    bool? likedByUser,
    Photo? photo,
  }) {
    return PhotoTitleDataProvider(
      title: title ?? this.title,
      likedByUser: likedByUser ?? this.likedByUser,
      photo: photo ?? this.photo,
    );
  }
}

class PhotoModel extends ChangeNotifier {
  final _photoService = PhotoService();
  final String photoId;
  final BuildContext context;
  var _photoTitleDataProvider = PhotoTitleDataProvider();

  PhotoTitleDataProvider get photoTitleData => _photoTitleDataProvider;

  PhotoModel({required this.context, required this.photoId}) {
    _loadPhoto();
  }

  static String getPublishedAt(DateTime date) {
    final dateFormat = DateFormat.yMMMd();
    return 'Published on ${dateFormat.format(date)}';
  }

  static String getCollectionAbout(Collection collection) {
    final user = collection.user;
    return '${collection.totalPhotos} photos · Curated by ${user.name}';
  }

  static String getStringFromNumber(int number) {
    return NumberFormat.decimalPattern().format(number);
  }

  void _loadPhoto() async {
    try {
      final photo = await _photoService.loadPhoto(photoId);
      if (photo == null) {
        return;
      }

      _photoTitleDataProvider = _photoTitleDataProvider.copyWith(
        title: 'Photo',
        likedByUser: photo.likedByUser,
        photo: photo,
      );
      notifyListeners();
    } on OauthException catch (e) {
      OauthException.catchTokenException(context, e);
      return;
    }
  }

  void likeUnlikePhoto() async {
    try {
      var result = false;
      final likedByUser = _photoTitleDataProvider.likedByUser;
      if (likedByUser) {
        result = await _photoService.unlikePhoto(photoId);
      } else {
        result = await _photoService.likePhoto(photoId);
      }
      if (result) {
        _photoTitleDataProvider =
            _photoTitleDataProvider.copyWith(likedByUser: !likedByUser);
        notifyListeners();
      }
    } on OauthException catch (e) {
      OauthException.catchTokenException(context, e);
      return;
    }
  }

  void onCollectionTap(String collectioId) {
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.collection,
      arguments: collectioId,
    );
  }
}
