import 'package:dio/dio.dart';
import 'package:unsplash/domain/service/auth_service.dart';

class DioInterceptor extends Interceptor {
  final _authService = AuthService();
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _authService.getAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = "Bearer $token";
    }
    options.headers['Content-Type'] = "application/json";
    super.onRequest(options, handler);
  }
}
