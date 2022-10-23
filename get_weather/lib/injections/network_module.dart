import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_weather/domain/repository_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {

  @Named("BaseUrl")
  String get baseUrl => RepositoryConstants.baseUrl;

  @lazySingleton
  Dio dioInitializer(@Named('BaseUrl') String url) {
    final dio = Dio(BaseOptions(baseUrl: url));

    dio.interceptors.add(PrettyDioLogger(
      requestBody: kDebugMode,
      requestHeader: kDebugMode,
    ),);

    return dio;
  }
}
