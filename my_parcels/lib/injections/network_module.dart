import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_parcels/domain/repository_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {

  @Named("BaseUrl")
  String get baseUrl => 'https://test.furgonetka.pl/example-integration/';

  @lazySingleton
  Dio dioInitializer(@Named('BaseUrl') String url) {
    final dio = Dio(BaseOptions(baseUrl: url));
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, handler) async {
          options.headers["Authorization"] = RepositoryConstants.token;
          return handler.next(options);
        },
        onResponse: (response, handler) async {
          return handler.next(response);
        },
      ),
    );

    dio.interceptors.add(PrettyDioLogger(
      requestBody: kDebugMode,
      requestHeader: kDebugMode,
    ),);

    return dio;
  }
}
