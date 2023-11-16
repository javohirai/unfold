import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:unsplash/domain/entity/collection.dart';
import 'package:unsplash/ui/resources/styles.dart';
import 'package:unsplash/ui/widgets/collection_widget/collection_model.dart';
import 'package:unsplash/ui/widgets/collection_widget/collection_photo_item.dart';
import 'package:unsplash/ui/widgets/reel_widget/reel_photo_item.dart';
import 'package:unsplash/ui/widgets/user_widget/user_avatar_widget.dart';

class CollectionWidget extends StatelessWidget {
  const CollectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final collectionProvider =
        context.select((CollectionModel value) => value.collectionProvider);
    final collection = collectionProvider.collection;
    Widget body = const Center(
      child: CircularProgressIndicator(),
    );
    if (collection != null) {
      body = const _CollectionTitleUserWidget();
    }
    return Scaffold(
      appBar: AppBar(title: Text(collectionProvider.title)),
      body: body,
    );
  }
}

class _CollectionTitleUserWidget extends StatelessWidget {
  const _CollectionTitleUserWidget();

  @override
  Widget build(BuildContext context) {
    final collectionProvider =
        context.select((CollectionModel value) => value.collectionProvider);
    final collection = collectionProvider.collection!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
          child: Column(
        children: [
          _CollectionTitleWidget(collection: collection),
          const SizedBox(height: 8),
          UserAvatarWidget(user: collection.user),
          const SizedBox(height: 8),
          const _CollectionPhotosWidget(),
        ],
      )),
    );
  }
}

class _CollectionPhotosWidget extends StatelessWidget {
  const _CollectionPhotosWidget();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CollectionModel>();
    final photos = model.collectionProvider.collectionPhotos;
    if (photos == null) return const CircularProgressIndicator();
    return MasonryGridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      mainAxisSpacing: 4,
      itemCount: photos.length,
      crossAxisSpacing: 4,
      itemBuilder: (context, index) {
        return CollectionPhotoItemWidget(
          currentIndex: index,
        );
      },
    );
  }
}

class _CollectionTitleWidget extends StatelessWidget {
  const _CollectionTitleWidget({
    required this.collection,
  });

  final Collection collection;

  @override
  Widget build(BuildContext context) {
    return Text(
      collection.title,
      style: AppStyles.collectionTitleStyle,
    );
  }
}
