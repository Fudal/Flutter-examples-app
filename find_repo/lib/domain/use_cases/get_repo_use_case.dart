import 'dart:async';

import 'package:find_repo/domain/app/capabilities/repo_item.dart';
import 'package:find_repo/domain/app/services/app_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetReposUseCase {
  final AppService _appService;

  GetReposUseCase(this._appService);

  Future<List<RepoItem>> call({
    required String text,
    required int page,
  }) async {
    final List<RepoItem> response = await _appService
        .getRepos(page: page, searchPhrase: text);

    final List<RepoItem> listWithName = response
        .where((element) => element.name != null).toList();

    final List<RepoItem> listWithoutName = response
        .where((element) => element.name == null).toList();

    listWithName.sort((a, b) => a.name!.compareTo(b.name!));

    final List<RepoItem> sortedList = [];
    sortedList.addAll(listWithName);
    sortedList.addAll(listWithoutName);

    return sortedList;
  }
}
