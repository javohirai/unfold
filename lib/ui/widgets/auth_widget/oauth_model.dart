import 'package:flutter/material.dart';
import 'package:unsplash/domain/navigation/main_navigation.dart';
import 'package:unsplash/utils.dart';
import 'package:unsplash/domain/service/auth_service.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OauthModel extends ChangeNotifier {
  final _authService = AuthService();

  String _code = '';
  bool _codeGranted = false;
  bool _accessTokenGranted = false;

  void _updateCodeAndUi(String code, BuildContext context) {
    _code = code;
    _codeGranted = true;
    notifyListeners();
    _getAccessToken(context);
  }

  final oauthCodeUrl = Uri.parse(
    AuthService.getOauthCodeUrl(
      Utils.clientId,
      Utils.redirectUri,
      'code',
      [
        "public",
        "read_user",
        "write_user",
        "read_photos",
        "write_photos",
        "write_likes",
        "write_followers",
        "read_collections",
        "write_collections"
      ].join('+'),
    ),
  );

  bool get codeGranted => _codeGranted;
  bool get accessTokenGranted => _accessTokenGranted;

  Future<void> saveOauthCode(
      NavigationRequest request, BuildContext context) async {
    if (request.url.startsWith(Utils.redirectUri)) {
      final uri = Uri.parse(request.url);
      uri.queryParameters.forEach(
        (key, value) async {
          if (key == 'code' && _code == '') {
            await _authService.saveOauthCode(value);
            _updateCodeAndUi(value, context);
          }
        },
      );
    }
  }

  Future<void> _getAccessToken(BuildContext context) async {
    _accessTokenGranted = await _authService.accessTokenGrant();
    if (_accessTokenGranted) {
      final me = await _authService.getMe();
      if (me != null) {
        await _authService.setUserName(me.username);
      }
    }
    Navigator.of(context).pushNamedAndRemoveUntil(
      MainNavigationRouteNames.loader,
      (route) => false,
    );
    notifyListeners();
  }
}
