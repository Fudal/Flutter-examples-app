part of 'movie_list_cubit.dart';

abstract class MovieListState extends Equatable {
  const MovieListState();
}

class MovieListLoaded extends MovieListState {
  final List<Movie> movies;

  const MovieListLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}


class MovieListLoadingMore extends MovieListState {
  final List<Movie> movies;

  const MovieListLoadingMore(this.movies);

  @override
  List<Object> get props => [movies];
}

class MovieListInitial extends MovieListState {
  @override
  List<Object> get props => [];
}

class MovieListLoading extends MovieListState {
  @override
  List<Object> get props => [];
}

class MovieListError extends MovieListState {
  final dynamic error;

  const MovieListError(this.error);

  @override
  List<Object> get props => [];
}
