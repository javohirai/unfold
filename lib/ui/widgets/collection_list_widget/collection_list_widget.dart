import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unsplash/ui/widgets/collection_list_widget/collection_list_model.dart';
import 'package:unsplash/ui/widgets/collection_widget/collection_item_widget.dart';

class CollectionListWidget extends StatelessWidget {
  const CollectionListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<CollectionListModel>();
    final collections =
        context.select((CollectionListModel value) => value.collectinos);
    final widgetList = CollectionItemWidget(
        collections: collections, onCollectionTap: model.onCollectionTap);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          widgetList,
        ],
      ),
    );
  }
}
