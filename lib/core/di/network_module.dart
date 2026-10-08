import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio get dio {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
    ));
    return dio;
  }
}
