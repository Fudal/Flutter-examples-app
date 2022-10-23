import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:find_repo/domain/app/capabilities/repo_item.dart';
import 'package:find_repo/domain/use_cases/get_repo_use_case.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetReposUseCase _getRepos;

  List<RepoItem> items = [];
  int page = 1;
  bool hasMore = true;

  HomeCubit(this._getRepos) : super(const HomeIdle([]));

  Future<void> loadRepos(String searchPhrase) async {
    try {
      emit(HomeLoading());
      items = await _getRepos(page: page, text: searchPhrase);
      emit(HomeIdle(items));
    } catch (exc, stack) {
      Fimber.e("Load Repos error", ex: exc, stacktrace: stack);
      emit(HomeError(exc));
    }
  }

  Future<void> loadMore(String searchPhrase) async {
    try {
      if (!hasMore) {
        emit(HomeIdle(items));
      } else {
        emit(HomeLoadingMore(items));
        page++;
        if (items.isNotEmpty) {
          final result = await _getRepos(page: page, text: searchPhrase);
          hasMore = result.isNotEmpty;
          items.addAll(result);
          emit(HomeIdle(items));
        }
      }
    } catch (exc, stack) {
      Fimber.e("Load More Repos error", ex: exc, stacktrace: stack);
      emit(HomeError(exc));
    }
  }
}
