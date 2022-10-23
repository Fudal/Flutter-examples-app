import 'dart:async';

import 'package:flutter_recruitment_task/domain/app_services/application_service.dart';
import 'package:flutter_recruitment_task/models/movie.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMoviesUseCase {
  final AppApi _appApi;

  GetMoviesUseCase(this._appApi);

  Future<List<Movie>> call({required String text, required int page}) async {
    final List<Movie> response = await _appApi
        .getMovies(searchPhrase: text, page: page);

    response.sort((a, b) => a.voteAverage.compareTo(b.voteAverage));

    final List<Movie> sortedList = [];

    sortedList.addAll(response.reversed);

    return sortedList;
  }
}
