import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/models/movie.dart';
import 'package:flutter_recruitment_task/pages/movie_list/movie_list_cubit.dart';
import 'package:flutter_recruitment_task/pages/movie_list/widgets/movie_card.dart';
import 'package:flutter_recruitment_task/routing/router.gr.dart';

class MovieListPageContent extends StatelessWidget {
  final ScrollController scrollController;
  final List<Movie> items;
  final bool isLoadingMore;
  final String searchPhrase;

  const MovieListPageContent({
    super.key,
    required this.items,
    required this.searchPhrase,
    required this.scrollController,
    this.isLoadingMore = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () => BlocProvider.of<MovieListCubit>(context).loadMovies(searchPhrase),
        child: ListView.separated(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          controller: scrollController,
          separatorBuilder: (context, index) => Container(
            height: 1.0,
            color: Colors.grey.shade300,
          ),
          itemBuilder: (context, index) {
            if (index == items.length) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            final Movie movie = items[index];
            return MovieCard(
              title: movie.title,
              rating: '${(movie.voteAverage * 10).toInt()}%',
              onTap: () => context.router
                  .push(MovieDetailsRoute(movie: movie)),
            );
          },
          itemCount: isLoadingMore
              ? items.length + 1
              : items.length,
        ),
      ),
    );
  }
}
