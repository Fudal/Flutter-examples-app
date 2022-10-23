import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_recruitment_task/domain/use_cases/get_movie_use_case.dart';
import 'package:flutter_recruitment_task/models/movie.dart';
import 'package:injectable/injectable.dart';

part 'movie_list_state.dart';

@injectable
class MovieListCubit extends Cubit<MovieListState> {
  final GetMoviesUseCase _getMovies;

  List<Movie> items = [];
  int page = 1;
  bool hasMore = true;

  MovieListCubit(this._getMovies) : super(MovieListInitial());

  Future<void> loadMovies(String text) async {
    try {
      items = await _getMovies(page: page, text: text);
      emit(MovieListLoaded(items));
    } catch (exc, stack) {
      Fimber.e("Load Movies error", ex: exc, stacktrace: stack);
      emit(MovieListError(exc));
    }
  }

  Future<void> loadMore(String text) async {
    try {
      if (!hasMore) {
        emit(MovieListLoaded(items));
      } else {
        emit(MovieListLoadingMore(items));
        if (items.isNotEmpty) {
          page++;
          final result = await _getMovies(page: page, text: text);
          hasMore = result.isNotEmpty;
          items.addAll(result);
          emit(MovieListLoaded(items));
        }
      }
    } catch (exc, stack) {
      Fimber.e("Load More Movies error", ex: exc, stacktrace: stack);
      emit(MovieListError(exc));
    }
  }
}
