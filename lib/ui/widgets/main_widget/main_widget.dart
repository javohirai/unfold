import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unsplash/ui/widgets/collection_list_widget/collection_list_model.dart';
import 'package:unsplash/ui/widgets/collection_list_widget/collection_list_widget.dart';
import 'package:unsplash/ui/widgets/reel_widget/reel_model.dart';
import 'package:unsplash/ui/widgets/reel_widget/reel_widget.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<MainWidget> {
  var selectedIndex = 0;

  final widgetAppBarTitles = [
    const Text('Reel'),
    const Text('Collection'),
    const Text('Liked'),
    const Text('Account'),
  ];

  final icons = [
    Icons.home,
    Icons.collections,
    Icons.star,
    Icons.account_circle,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: widgetAppBarTitles[selectedIndex]),
      body: IndexedStack(
        index: selectedIndex,
        children: [
          ChangeNotifierProvider(
            create: (context) => ReelModel(context),
            child: const ReelWidget(),
          ),
          ChangeNotifierProvider(
            create: (context) => CollectionListModel(context),
            child: const CollectionListWidget(),
          ),
          const Text('Liked'),
          const Text('Account'),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 76,
        child: BottomNavigationBar(
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          currentIndex: selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: icons
              .map(
                (icon) => BottomNavigationBarItem(
                  label: '',
                  icon: Icon(icon),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
