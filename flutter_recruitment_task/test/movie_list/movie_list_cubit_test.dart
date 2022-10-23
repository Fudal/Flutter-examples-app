import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_recruitment_task/domain/use_cases/get_movie_use_case.dart';
import 'package:flutter_recruitment_task/models/movie.dart';
import 'package:flutter_recruitment_task/pages/movie_list/movie_list_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetMoviesUseCase extends Mock implements GetMoviesUseCase {}

void main() {
  MockGetMoviesUseCase mockGetMoviesUseCase;
  late MovieListCubit movieListCubit;
  final item = Movie(id: 0, title: "", voteAverage: 0);

  setUp(() {
    mockGetMoviesUseCase = MockGetMoviesUseCase();
    movieListCubit = MovieListCubit(mockGetMoviesUseCase);
  });

  tearDown(() {
    movieListCubit.close();
  });

  group('movie list', () {
    mockGetMoviesUseCase = MockGetMoviesUseCase();
    void mockLoadMovieList() {
      when(() => mockGetMoviesUseCase(text: "", page: 1)).thenAnswer((_) async => [item]);
    }

    blocTest<MovieListCubit, MovieListState>(
        'emit state',
        build: () {
          mockLoadMovieList();
          return movieListCubit;
        },
      act: (MovieListCubit cubit) => cubit.loadMovies(""),
      expect: () => [
        MovieListLoaded([item]),
      ],
    );
  });
}
