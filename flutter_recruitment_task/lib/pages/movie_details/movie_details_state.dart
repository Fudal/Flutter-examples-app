part of 'movie_details_cubit.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();
}

class MovieDetailsLoaded extends MovieDetailsState {
  final Movie movie;

  const MovieDetailsLoaded(this.movie);

  @override
  List<Object> get props => [movie];
}

class MovieDetailsLoading extends MovieDetailsState {
  @override
  List<Object> get props => [];
}

class MovieDetailsError extends MovieDetailsState {
  final dynamic error;

  const MovieDetailsError(this.error);

  @override
  List<Object> get props => [];
}
