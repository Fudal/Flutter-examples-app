import 'dart:io';

import 'package:dio/dio.dart';
import 'package:find_repo/data/network/service/api_network_service.dart';
import 'package:find_repo/domain/app/capabilities/issue_item.dart';
import 'package:find_repo/domain/app/capabilities/repo_item.dart';
import 'package:find_repo/domain/app/capabilities/user_item.dart';
import 'package:injectable/injectable.dart';

abstract class AppRepoListRepository {
  Future<List<RepoItem>> getRepos({required String text, required int page});
  Future<List<IssueItem>> getIssues(String userName);
}

@LazySingleton(as: AppRepoListRepository)
class AppRepoListRepositoryImpl implements AppRepoListRepository {
  final ApiNetworkService _apiNetworkService;

  AppRepoListRepositoryImpl(this._apiNetworkService);

  @override
  Future<List<RepoItem>> getRepos({required String text, required int page}) async {
    try {
      final result = await _apiNetworkService.getRepositories(
        text: text,
        page: page,
      );
      return result.items?.map((e) => RepoItem(
        id: e.id,
        createdAt: _parseDate(e.createdAt),
        updatedAt: _parseDate(e.updatedAt),
        fullName: e.fullName,
        name: e.name,
        description: e.description,
        defaultBranch: e.defaultBranch,
        homepage: e.homepage,
        issuesUrl: e.issuesUrl,
        language: e.language,
        openIssuesCount: e.openIssuesCount,
        owner: UserItem(
          id: e.owner?.id,
          avatarUrl: e.owner?.avatarUrl,
          login: e.owner?.login,
        ),
      ),).toList() ?? [];
    } on DioError catch (exc) {
      throw exc.error as Object;
    } on SocketException catch (_) {
      rethrow;
    }
  }
  @override
  Future<List<IssueItem>> getIssues(String userName) async {
    try {
      final result = await _apiNetworkService.getIssues(userName);

      return result.map((e) => IssueItem(
        id: e.id,
        createdAt: _parseDate(e.createdAt),
        updatedAt: _parseDate(e.updatedAt),
        title: e.title,
        body: e.body,
        commentsCount: e.comments,
        user: UserItem(
          id: e.user?.id,
          avatarUrl: e.user?.avatarUrl,
          login: e.user?.login,
        ),
      ),).toList();
    } on DioError catch (exc) {
      throw exc.error as Object;
    } on SocketException catch (_) {
      rethrow;
    }
  }

  DateTime? _parseDate(String? date) {
    if (date != null) {
      return DateTime.parse(date);
    }
    return null;
  }
}
