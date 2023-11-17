import 'package:flutter/material.dart';
import 'package:unsplash/domain/navigation/main_navigation.dart';
import 'package:unsplash/domain/service/auth_service.dart';

enum OauthReason { tokenIsInvalid, tokenExpired }

class OauthException implements Exception {
  final OauthReason oauthReason;
  const OauthException({required this.oauthReason});

  static void catchTokenException(
      BuildContext context, OauthException e) async {
    final authService = AuthService();
    if (e.oauthReason == OauthReason.tokenIsInvalid) {
      await authService.saveAccessToken(null);
      Navigator.of(context).pushNamedAndRemoveUntil(
        MainNavigationRouteNames.loader,
        (route) => false,
      );
    }
  }
}
