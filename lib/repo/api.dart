import 'package:dio/dio.dart';

class Api {
  late final dio = Dio(options)..interceptors.addAll([_BasicInterceptor()]);

  final options = BaseOptions(
      baseUrl: 'https://fakestoreapi.com/products',
      connectTimeout: 30000,
      receiveTimeout: 30000);
}

class _BasicInterceptor implements Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
