import 'package:flutter/material.dart';
import 'package:unsplash/domain/entity/photo.dart';

class PhotoItemWidget extends StatelessWidget {
  const PhotoItemWidget({
    super.key,
    required this.photo,
    required this.onTapPhoto,
  });

  final Photo photo;
  final Function(String photoId) onTapPhoto;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: photo.width / photo.height,
      child: Stack(
        children: [
          Image.network(photo.urls.small),
          _ItemLikesWidget(photo: photo),
          _ItemUserInfoWidget(photo: photo),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () => onTapPhoto.call(photo.id),
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemUserInfoWidget extends StatelessWidget {
  const _ItemUserInfoWidget({
    required this.photo,
  });

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    final user = photo.user;
    return Positioned(
        bottom: 10,
        left: 10,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipOval(
              child: Image.network(
                user.profileImage.small,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '@${user.username}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 7,
                  ),
                ),
              ],
            )
          ],
        ));
  }
}

class _ItemLikesWidget extends StatelessWidget {
  const _ItemLikesWidget({
    required this.photo,
  });

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 10,
        right: 10,
        child: Row(
          children: [
            Text(
              '${photo.likes}',
              style: const TextStyle(
                fontSize: 9,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 5),
            Icon(
              photo.likedByUser ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
            )
          ],
        ));
  }
}
