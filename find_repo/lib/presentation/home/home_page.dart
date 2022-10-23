import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:find_repo/generated/locale_keys.g.dart';
import 'package:find_repo/injections/bloc_factory.dart';
import 'package:find_repo/presentation/home/home_cubit.dart';
import 'package:find_repo/presentation/home/widgets/list_loading.dart';
import 'package:find_repo/style/colors.dart';
import 'package:find_repo/widgets/custom_error_dialog.dart';
import 'package:find_repo/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget implements AutoRouteWrapper {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    final BlocFactory blocFactory = BlocFactory.of(context);
    return BlocProvider<HomeCubit>(
      create: (context) => blocFactory.get<HomeCubit>(),
      child: this,
    );
  }
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 100.0;
  final _searchController = TextEditingController();
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
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: CustomSearchBar(
              controller: _searchController,
              onChanged: () => _searchText(),
              onSubmitted: () => _searchText(),
              hintText: LocaleKeys.home_page_search_hint.tr(),
              suffix: InkWell(
                onTap: () => context.router.pop(),
                child: const Icon(Icons.search, color: AppColors.dark_50),
              ),
            ),
        ),
        body: SafeArea(
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (_, state) {
              if (state is HomeError) {
                CustomErrorDialog(
                  onClick: () => AutoRouter.of(context).pop(),
                  error: state.error,
                ).show(context);
              }
            },
            builder: (context, state) {
              if (state is HomeLoading) {
                _isScrolling = false;
                return Column(
                  children: const [
                    Spacer(),
                    Center(child: CircularProgressIndicator.adaptive()),
                    Spacer(),
                  ],
                );
              } else if (state is HomeIdle) {
                _isScrolling = false;
                return HomeListLoading(
                  items: state.items,
                  scrollController: _scrollController,
                  searchPhrase: _searchController.text,
                );
              } else if (state is HomeLoadingMore) {
                return HomeListLoading(
                  items: state.items,
                  scrollController: _scrollController,
                  isLoadingMore: true,
                  searchPhrase: _searchController.text,
                );
              } else {
                _isScrolling = false;
                return const SizedBox.shrink();
              }
            },
          ),
        ),);
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold && !_isScrolling) {
      _isScrolling = true;
      _searchText(isLoadMore: true);
    }
  }

  void _searchText({bool isLoadMore = false}) {
    if (_searchController.text.length > 3 && isLoadMore) {
      BlocProvider.of<HomeCubit>(context).loadMore(_searchController.text);
    } else if (_searchController.text.length > 3) {
      BlocProvider.of<HomeCubit>(context).loadRepos(_searchController.text);
    }
  }
}
