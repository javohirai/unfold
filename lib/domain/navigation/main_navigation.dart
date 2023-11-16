import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unsplash/ui/widgets/auth_widget/auth_widget.dart';
import 'package:unsplash/ui/widgets/auth_widget/oauth_model.dart';
import 'package:unsplash/ui/widgets/auth_widget/oauth_widget.dart';
import 'package:unsplash/ui/widgets/collection_widget/collection_model.dart';
import 'package:unsplash/ui/widgets/collection_widget/collection_widget.dart';
import 'package:unsplash/ui/widgets/loader_widget/loader_view_model.dart';
import 'package:unsplash/ui/widgets/loader_widget/loader_widget.dart';
import 'package:unsplash/ui/widgets/main_widget/main_widget.dart';
import 'package:unsplash/ui/widgets/photo_widget/photo_model.dart';
import 'package:unsplash/ui/widgets/photo_widget/photo_widget.dart';

abstract class MainNavigationRouteNames {
  static const auth = '/';
  static const loader = 'loader';
  static const mainScreen = 'main_sreen';
  static const oauthScreen = '/oauth_screen';
  static const photo = '/photo';
  static const collection = '/collection';
}

class MainNavigation {
  final routes = {
    MainNavigationRouteNames.auth: (context) => const AuthWidget(),
    MainNavigationRouteNames.loader: (context) {
      return Provider(
        create: (context) => LoaderViewModel(context),
        lazy: false,
        child: const LoaderWidget(),
      );
    },
    MainNavigationRouteNames.mainScreen: (context) => const MainWidget(),
    MainNavigationRouteNames.oauthScreen: (context) => ChangeNotifierProvider(
          create: (_) => OauthModel(),
          child: const OauthWidget(),
        )
  };

  Route<Object> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.photo:
        final photoId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider.value(
            value: PhotoModel(context: context, photoId: photoId),
            child: const PhotoWidget(),
          ),
        );
      case MainNavigationRouteNames.collection:
        final collectionId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider.value(
            value: CollectionModel(context, collectionId),
            child: const CollectionWidget(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Text('unfound text'),
          ),
        );
    }
  }
}
