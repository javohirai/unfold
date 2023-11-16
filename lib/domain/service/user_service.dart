import 'package:unsplash/domain/entity/photo.dart';
import 'package:unsplash/domain/entity/photo_user.dart';
import 'package:unsplash/domain/network/user_client.dart';

class UserService {
  final _userClient = UserClient();
  final _photoList = <Photo>[];

  Future<PhotoUser?> getMe() async {
    return await _userClient.getMe();
  }

  Future<List<Photo>> loadUserPhotos(String username, int page) async {
    _photoList.addAll(await _userClient.loadUserPhotos(username, page));
    return _photoList;
  }
}
