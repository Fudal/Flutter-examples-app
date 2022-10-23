import 'package:flutter_recruitment_task/domain/app_services/app_service.dart';
import 'package:flutter_recruitment_task/models/movie.dart';
import 'package:injectable/injectable.dart';

abstract class AppApi {
  Future<List<Movie>> getMovies({required String searchPhrase, required int page});
  Future<Movie> getMovieDetails(int id);
}

@LazySingleton(as: AppApi)
class AppApplicationService extends AppApi {
  final AppService _appService;

  AppApplicationService(this._appService);

  @override
  Future<List<Movie>> getMovies({required String searchPhrase, required int page}) {
    return _appService.getMovies(text: searchPhrase, page: page);
  }

  @override
  Future<Movie> getMovieDetails(int id) {
    return _appService.getMovieDetails(id);
  }
}
