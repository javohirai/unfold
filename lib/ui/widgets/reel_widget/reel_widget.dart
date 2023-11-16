import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:unsplash/ui/widgets/reel_widget/reel_model.dart';
import 'package:unsplash/ui/widgets/reel_widget/reel_photo_item.dart';

class ReelWidget extends StatefulWidget {
  const ReelWidget({super.key});

  @override
  State<ReelWidget> createState() => _ReelWidgetState();
}

class _ReelWidgetState extends State<ReelWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final model = context.read<ReelModel>();
    model.loadPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return const _ReelContentWidget();
  }
}

class _ReelContentWidget extends StatelessWidget {
  const _ReelContentWidget();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ReelModel>();
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
          model.showMovieAtIndex(context, index);
          return ReelPhotoItemWidget(
            currentIndex: index,
          );
        },
      ),
    );
  }
}
