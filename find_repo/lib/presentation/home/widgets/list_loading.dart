import 'package:find_repo/domain/app/capabilities/repo_item.dart';
import 'package:find_repo/presentation/home/home_cubit.dart';
import 'package:find_repo/presentation/widgets/repo_tile.dart';
import 'package:find_repo/style/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeListLoading extends StatelessWidget {
  final ScrollController scrollController;
  final List<RepoItem> items;
  final bool isLoadingMore;
  final String searchPhrase;

  const HomeListLoading({
    super.key,
    required this.items,
    required this.searchPhrase,
    required this.scrollController,
    this.isLoadingMore = false,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => BlocProvider.of<HomeCubit>(context).loadRepos(searchPhrase),
      child: ListView.separated(
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        controller: scrollController,
        padding: const EdgeInsets.symmetric(vertical: Dimens.spacingM),
        itemBuilder: (context, index) {
          if (index == items.length) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return RepoTile(items[index]);
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: isLoadingMore
            ? items.length + 1
            : items.length,
      ),
    );
  }
}
