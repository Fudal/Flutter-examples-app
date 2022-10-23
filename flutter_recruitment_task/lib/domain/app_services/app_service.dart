import 'dart:io';

import 'package:flutter_recruitment_task/data/network/exceptions/network_exception.dart';
import 'package:flutter_recruitment_task/data/network/repository/movies_repository.dart';
import 'package:flutter_recruitment_task/domain/base/errors/connection_exception.dart';
import 'package:flutter_recruitment_task/domain/base/errors/network_exception.dart';
import 'package:flutter_recruitment_task/domain/base/errors/server_exception.dart';
import 'package:flutter_recruitment_task/models/movie.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppService {
  final AppMoviesRepository _appMoviesRepository;

  AppService(this._appMoviesRepository);

  Future<List<Movie>> getMovies({required String text, required int page}) async {
    try {
      return await _appMoviesRepository.getMovies(text: text, page: page);
    } catch (exc) {
      if (exc is ServiceUnavailable) {
        throw ServerException(exc.message);
      } else if (exc is ServerError) {
        throw ServerException(exc.message);
      } else if (exc is NetworkError) {
        throw NetworkException(exc.message);
      } else if (exc is SocketException) {
        throw ConnectionException(exc.message);
      } else {
        rethrow;
      }
    }
  }

  Future<Movie> getMovieDetails(int id) async {
    try {
      return await _appMoviesRepository.getMovieDetails(id);
    } catch (exc) {
      if (exc is ServiceUnavailable) {
        throw ServerException(exc.message);
      } else if (exc is ServerError) {
        throw ServerException(exc.message);
      } else if (exc is NetworkError) {
        throw NetworkException(exc.message);
      } else if (exc is SocketException) {
        throw ConnectionException(exc.message);
      } else {
        rethrow;
      }
    }
  }
}
