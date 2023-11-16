import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unsplash/ui/widgets/liked_photos_widget/liked_photos_model.dart';
import 'package:unsplash/ui/widgets/photo_item/photo_item_widget.dart';

class LikedPhotosItemWidget extends StatelessWidget {
  final int currentIndex;
  const LikedPhotosItemWidget({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final model = context.read<LikedPhotosModel>();
    final photo = model.photos[currentIndex];

    return PhotoItemWidget(photo: photo, onTapPhoto: model.onPhotoTap);
  }
}
