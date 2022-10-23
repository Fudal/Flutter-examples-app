import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/injections/bloc_factory.dart';
import 'package:flutter_recruitment_task/pages/movie_list/movie_list_cubit.dart';
import 'package:flutter_recruitment_task/pages/movie_list/widgets/page_content.dart';
import 'package:flutter_recruitment_task/pages/movie_list/widgets/search_box.dart';
import 'package:flutter_recruitment_task/routing/router.gr.dart';
import 'package:flutter_recruitment_task/widgets/custom_error_dialog.dart';

class MovieListPage extends StatefulWidget implements AutoRouteWrapper {
  @override
  _MovieListPage createState() => _MovieListPage();

  @override
  Widget wrappedRoute(BuildContext context) {
    final BlocFactory blocFactory = BlocFactory.of(context);
    return BlocProvider<MovieListCubit>(
      create: (context) => blocFactory.get<MovieListCubit>(),
      child: this,
    );
  }
}

class _MovieListPage extends State<MovieListPage> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();
  final _scrollThreshold = 100.0;
  bool _isScrolling = false;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.movie_creation_outlined),
              onPressed: () => context.router.push(const TwoButtonsRoute()),
            ),
          ],
          title: const Text('Movie Browser'),
        ),
        body: BlocConsumer<MovieListCubit, MovieListState>(
          listener: (_, state) {
            if (state is MovieListError) {
              CustomErrorDialog(
                onClick: () => AutoRouter.of(context).pop(),
                error: state.error,
              ).show(context);
            }
          },
          builder: (context, state) {
            if (state is MovieListLoading) {
              _isScrolling = false;
              return Column(
                children: const [
                  Spacer(),
                  Center(child: CircularProgressIndicator.adaptive()),
                  Spacer(),
                ],
              );
            } else if (state is MovieListInitial || state is MovieListLoaded) {
              _isScrolling = false;
              return Column(
                children: [
                  SearchBox(
                    controller: _searchController,
                    onSubmitted: (_) => _searchText(),
                    onchange: () => _searchText(),
                  ),
                  if (state is MovieListLoaded)
                    MovieListPageContent(
                      items: state.movies,
                      scrollController: _scrollController,
                      searchPhrase: _searchController.text,
                    )
                ],
              );
            } else if (state is MovieListInitial || state is MovieListLoadingMore) {
              return Column(
                children: [
                  SearchBox(
                    controller: _searchController,
                    onSubmitted: (_) => _searchText(),
                  ),
                  if (state is MovieListLoadingMore)
                    MovieListPageContent(
                      items: state.movies,
                      scrollController: _scrollController,
                      isLoadingMore: true,
                      searchPhrase: _searchController.text,
                    )
                ],
              );
            } else {
              _isScrolling = false;
              return const SizedBox.shrink();
            }
          },
        ),
      );

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold && !_isScrolling) {
      _isScrolling = true;
      _searchText(isLoadMore: true);
    }
  }

  void _searchText({bool isLoadMore = false}) {
    if (_searchController.text.length > 2 && isLoadMore) {
      BlocProvider.of<MovieListCubit>(context).loadMore(_searchController.text);
    } else if (_searchController.text.length > 2) {
      BlocProvider.of<MovieListCubit>(context).loadMovies(_searchController.text);
    }
  }
}
