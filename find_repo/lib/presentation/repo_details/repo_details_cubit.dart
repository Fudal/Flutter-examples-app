import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:find_repo/domain/app/capabilities/issue_item.dart';
import 'package:find_repo/domain/app/capabilities/repo_item.dart';
import 'package:find_repo/domain/app/services/app_service.dart';
import 'package:injectable/injectable.dart';

part 'repo_details_state.dart';

@injectable
class RepoDetailsCubit extends Cubit<RepoDetailsState> {
  final AppService _appService;

  RepoDetailsCubit(this._appService) : super(RepoDetailsLoading());

  Future<void> loadIssues(RepoItem repo) async {
    try {
      emit(RepoDetailsLoading());
      final List<IssueItem> items = [];
      if (repo.fullName != null && repo.fullName!.isNotEmpty) {
         final results = await _appService.getIssues(repo.fullName ?? "");
         items.addAll(results);
      }
      emit(RepoDetailsIdle(items));
    } catch (exc, stack) {
      Fimber.e("Load Issues error", ex: exc, stacktrace: stack);
      emit(RepoDetailsError(exc));
    }
  }
}
