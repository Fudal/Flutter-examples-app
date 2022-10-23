import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_recruitment_task/data/network/response/movie_response.dart';
import 'package:flutter_recruitment_task/data/network/service/api_network_service.dart';
import 'package:flutter_recruitment_task/domain/repository_constants.dart';
import 'package:flutter_recruitment_task/models/movie.dart';
import 'package:injectable/injectable.dart';

abstract class AppMoviesRepository {
  Future<List<Movie>> getMovies({required String text, required int page});
  Future<Movie> getMovieDetails(int id);
}

@LazySingleton(as: AppMoviesRepository)
class AppMoviesRepositoryImpl implements AppMoviesRepository {
  final ApiNetworkService _apiNetworkService;

  AppMoviesRepositoryImpl(this._apiNetworkService);

  @override
  Future<List<Movie>> getMovies({required String text, required int page}) async {
    try {
      final result = await _apiNetworkService.getMovies(
          apiKey: RepositoryConstants.apiKey,
          query: text,
          page: page,
      );
      return result.results?.map((e) => Movie(
        id: e.id ?? 0,
        title: e.title ?? "",
        voteAverage: e.voteAverage ?? 0,
      ),).toList() ?? [];
    } on DioError catch (exc) {
      throw exc.error as Object;
    } on SocketException catch (_) {
      rethrow;
    }
  }

  @override
  Future<Movie> getMovieDetails(int id) async {
    try {
      final result = await _apiNetworkService.getMovieDetails(
          apiKey: RepositoryConstants.apiKey,
          id: id,
      );
      return Movie(
        id: result.id ?? 0,
        title: result.title ?? "",
        voteAverage: result.voteAverage ?? 0,
        budget: result.budget,
        revenue: result.revenue,
        profit: _getProfit(result),
      );
    } on DioError catch (exc) {
      throw exc.error as Object;
    } on SocketException catch (_) {
      rethrow;
    }
  }

  double? _getProfit(MovieResponse item) {
    if (item.revenue != null && item.budget != null) {
      return item.revenue! - item.budget!;
    }
    return null;
  }
}
