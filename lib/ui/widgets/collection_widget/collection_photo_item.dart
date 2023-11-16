import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unsplash/ui/widgets/collection_widget/collection_model.dart';
import 'package:unsplash/ui/widgets/photo_item/photo_item_widget.dart';

class CollectionPhotoItemWidget extends StatelessWidget {
  final int currentIndex;
  const CollectionPhotoItemWidget({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final model = context.read<CollectionModel>();
    final photos = model.collectionProvider.collectionPhotos;

    if (photos == null) return const SizedBox.shrink();

    return PhotoItemWidget(photo: photos[currentIndex], onTapPhoto: model.onPhotoTap);
  }
}

