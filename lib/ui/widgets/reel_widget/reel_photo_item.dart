import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unsplash/ui/widgets/photo_item/photo_item_widget.dart';
import 'package:unsplash/ui/widgets/reel_widget/reel_model.dart';

class ReelPhotoItemWidget extends StatelessWidget {
  final int currentIndex;
  const ReelPhotoItemWidget({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final model = context.read<ReelModel>();
    final photo = model.photos[currentIndex];

    return PhotoItemWidget(photo: photo, onTapPhoto: model.onPhotoTap);
  }
}

