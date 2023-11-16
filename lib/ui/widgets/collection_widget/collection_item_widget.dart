import 'package:flutter/material.dart';
import 'package:unsplash/domain/entity/collection.dart';
import 'package:unsplash/ui/resources/styles.dart';
import 'package:unsplash/ui/widgets/photo_widget/photo_model.dart';
import 'package:unsplash/ui/widgets/tag_widget/tag_widget.dart';

class CollectionItemWidget extends StatelessWidget {
  const CollectionItemWidget({
    super.key,
    required this.collections,
    required this.onCollectionTap,
  });

  final List<Collection> collections;
  final Function(String collection) onCollectionTap;

  @override
  Widget build(BuildContext context) {
    final widgetList = collections.map(
      (collection) {
        final coverPhoto = collection.coverPhoto;
        if (coverPhoto == null) return const SizedBox.shrink();
        var tags = collection.tags;
        Widget widgetTags = const SizedBox.shrink();
        if (tags != null) {
          if (tags.length > 3) {
            tags = tags.sublist(3);
          }
          widgetTags = Wrap(
            runSpacing: 4,
            spacing: 4,
            children: tags.map((tag) => TagWidget(title: tag.title)).toList(),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                onCollectionTap.call(collection.id);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black.withOpacity(0.2)),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                clipBehavior: Clip.hardEdge,
                child: AspectRatio(
                  aspectRatio: coverPhoto.width / coverPhoto.height,
                  child: Image.network(coverPhoto.urls.small),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              collection.title,
              style: AppStyles.releatedCollectionTitleTextStyle,
            ),
            const SizedBox(height: 6),
            Text(
              PhotoModel.getCollectionAbout(collection),
              style: AppStyles.locationTextStyle,
            ),
            widgetTags,
            const SizedBox(height: 6),
          ],
        );
      },
    ).toList();
    return Column(
      children: widgetList,
    );
  }
}
