import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:unsplash/ui/widgets/liked_photos_widget/liked_photos_item.dart';
import 'package:unsplash/ui/widgets/liked_photos_widget/liked_photos_model.dart';

class LikedPhotosWidget extends StatelessWidget {
  const LikedPhotosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ReelContentWidget();
  }
}

class _ReelContentWidget extends StatelessWidget {
  const _ReelContentWidget();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<LikedPhotosModel>();
    final photos = model.photos;

    return Container(
      padding: const EdgeInsets.all(8),
      child: MasonryGridView.builder(
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        mainAxisSpacing: 4,
        itemCount: photos.length,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          model.showPhotosAtIndex(context, index);
          return LikedPhotosItemWidget(
            currentIndex: index,
          );
        },
      ),
    );
  }
}
