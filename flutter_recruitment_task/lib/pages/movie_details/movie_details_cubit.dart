import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_recruitment_task/domain/app_services/application_service.dart';
import 'package:flutter_recruitment_task/models/movie.dart';
import 'package:injectable/injectable.dart';

part 'movie_details_state.dart';

@injectable
class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final AppApi _appApi;
  
  MovieDetailsCubit(this._appApi) : super(MovieDetailsLoading());

  Future<void> loadMovieDetail(int id) async {
    try {
      final Movie movie = await _appApi.getMovieDetails(id);
      emit(MovieDetailsLoaded(movie));
    } catch (exc, stack) {
      Fimber.e("Load Movie Details error", ex: exc, stacktrace: stack);
      emit(MovieDetailsError(exc));
    }
  }
}
