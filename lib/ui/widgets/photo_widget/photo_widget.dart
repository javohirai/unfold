import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:provider/provider.dart';
import 'package:unsplash/ui/resources/styles.dart';
import 'package:unsplash/ui/widgets/collection_widget/collection_item_widget.dart';
import 'package:unsplash/ui/widgets/photo_widget/photo_model.dart';
import 'package:unsplash/ui/widgets/tag_widget/tag_widget.dart';
import 'package:unsplash/ui/widgets/user_widget/user_avatar_widget.dart';

abstract class _PhotoColorsStyle {}

class PhotoWidget extends StatelessWidget {
  const PhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<PhotoModel>();
    final photoTitleData =
        context.select((PhotoModel value) => value.photoTitleData);
    final body = photoTitleData.photo != null
        ? const _PhotoDetailWidget()
        : const Center(child: CircularProgressIndicator());
    return Scaffold(
      appBar: AppBar(
        title: Text(photoTitleData.title),
        actions: [
          IconButton(
            onPressed: () => model.likeUnlikePhoto(),
            icon: photoTitleData.likedByUser
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border_outlined),
          ),
        ],
      ),
      body: body,
    );
  }
}

class DropdownChoices {
  const DropdownChoices({required this.title, required this.icon});

  final String title;
  final IconData icon;
}

class _PhotoDetailWidget extends StatelessWidget {
  const _PhotoDetailWidget();

  @override
  Widget build(BuildContext context) {
    final photoTitleData =
        context.select((PhotoModel value) => value.photoTitleData);
    final photo = photoTitleData.photo!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          UserAvatarWidget(user: photo.user),
          const SizedBox(height: 10),
          const _PhotoSrcWidget(),
          const SizedBox(height: 10),
          const _PhotoViewsDownloadWidget(),
          const SizedBox(height: 10),
          const _PhotoDescriptionWidget(),
          const SizedBox(height: 10),
          const _PhotoLocationPulishedAtWidget(),
          const SizedBox(height: 10),
          const _PhotoTagsWidget(),
          const SizedBox(height: 10),
          const _PhotoReleatedCollectionWidget(),
        ],
      ),
    );
  }
}

class _PhotoSrcWidget extends StatelessWidget {
  const _PhotoSrcWidget();

  @override
  Widget build(BuildContext context) {
    final photoTitleData =
        context.select((PhotoModel value) => value.photoTitleData);
    final photo = photoTitleData.photo!;
    return AspectRatio(
      aspectRatio: photo.width / photo.height,
      child: Image.network(
        photo.urls.small,
      ),
    );
  }
}

class _PhotoViewsDownloadWidget extends StatelessWidget {
  const _PhotoViewsDownloadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final photoTitleData =
        context.select((PhotoModel value) => value.photoTitleData);
    final photo = photoTitleData.photo!;
    final buttonStyle = ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(
              color: AppColors.buttonBorderSideColor,
            )),
      ),
    );
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Views',
                style: TextStyle(
                  color: AppColors.textCustomColor,
                  fontSize: 14,
                ),
              ),
              Text(
                PhotoModel.getStringFromNumber(photo.views ?? 0),
                style: AppStyles.textStyle,
              ),
              if (photo.downloads != null || photo.downloads != 0) ...[
                const SizedBox(height: 8),
                const Text(
                  'Downloads',
                  style: TextStyle(
                    color: AppColors.textCustomColor,
                    fontSize: 14,
                  ),
                ),
                Text(
                  PhotoModel.getStringFromNumber(photo.downloads ?? 0),
                  style: AppStyles.textStyle,
                ),
              ]
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                style: buttonStyle,
                onPressed: () {},
                icon: const Icon(Icons.share),
              ),
              const SizedBox(width: 8),
              OutlinedButton(
                onPressed: () {},
                style: buttonStyle,
                child: const Text(
                  'Download',
                  style: TextStyle(
                    color: AppColors.textCustomColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _PhotoDescriptionWidget extends StatelessWidget {
  const _PhotoDescriptionWidget();

  @override
  Widget build(BuildContext context) {
    final photoTitleData =
        context.select((PhotoModel value) => value.photoTitleData);
    final description = photoTitleData.photo!.description;

    return (description == null)
        ? const SizedBox.shrink()
        : Text(
            description,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          );
  }
}

class _PhotoLocationPulishedAtWidget extends StatelessWidget {
  const _PhotoLocationPulishedAtWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final photoTitleData =
        context.select((PhotoModel value) => value.photoTitleData);
    final photo = photoTitleData.photo!;
    final location = photo.location;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (location?.name != null) ...[
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: AppColors.textCustomColor,
              ),
              Text(
                location?.name ?? '',
                style: AppStyles.locationTextStyle,
              )
            ],
          ),
          const SizedBox(height: 8)
        ],
        Row(
          children: [
            const Icon(
              Icons.date_range,
              color: AppColors.textCustomColor,
            ),
            Text(
              PhotoModel.getPublishedAt(photo.createdAt!),
              style: AppStyles.locationTextStyle,
            )
          ],
        )
      ],
    );
  }
}

class _PhotoTagsWidget extends StatelessWidget {
  const _PhotoTagsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final photoTitleData =
        context.select((PhotoModel value) => value.photoTitleData);
    final tags = photoTitleData.photo?.tags;
    if (tags == null) {
      return const SizedBox.shrink();
    }
    return Wrap(
      runSpacing: 4,
      spacing: 4,
      children: tags
          .map(
            (tag) => TagWidget(title: tag.title),
          )
          .toList(),
    );
  }
}

class _PhotoReleatedCollectionWidget extends StatelessWidget {
  const _PhotoReleatedCollectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<PhotoModel>();
    final photoTitleData =
        context.select((PhotoModel value) => value.photoTitleData);
    final collections = photoTitleData.photo?.relatedCollections?.results;

    if (collections == null) {
      return const SizedBox.shrink();
    }
    final widgetList = CollectionItemWidget(
      collections: collections,
      onCollectionTap: model.onCollectionTap,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Related collections',
          style: AppStyles.releatedCollectionTextStyle,
        ),
        widgetList
      ],
    );
  }
}
