enum OauthReason { tokenIsInvalid, tokenExpired }

class OauthException implements Exception {
  final OauthReason oauthReason;
  const OauthException({required this.oauthReason});
}
