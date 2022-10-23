import 'dart:io';

import 'package:find_repo/data/network/exceptions/network_exceptions.dart';
import 'package:find_repo/data/network/repository/repos_repository.dart';
import 'package:find_repo/domain/app/capabilities/issue_item.dart';
import 'package:find_repo/domain/app/capabilities/repo_item.dart';
import 'package:find_repo/domain/base/errors/connection_exception.dart';
import 'package:find_repo/domain/base/errors/network_exception.dart';
import 'package:find_repo/domain/base/errors/server_exception.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppService {
  final AppRepoListRepository _appRepoListRepository;

  AppService(this._appRepoListRepository);

  Future<List<RepoItem>> getRepos({
  required String searchPhrase,
  required int page,
  }) async {
    try {
      return await _appRepoListRepository
          .getRepos(text: searchPhrase, page: page);
    } catch (exc) {
      if (exc is ServiceUnavailable) {
        throw ServerException(exc.message);
      } else if (exc is ServerError) {
        throw ServerException(exc.message);
      } else if (exc is NetworkError) {
        throw NetworkException(exc.message);
      } else if (exc is SocketException) {
        throw ConnectionException(exc.message);
      } else {
        rethrow;
      }
    }
  }

  Future<List<IssueItem>> getIssues(String userName) async {
    try {
      return await _appRepoListRepository.getIssues(userName);
    } catch (exc) {
      if (exc is ServiceUnavailable) {
        throw ServerException(exc.message);
      } else if (exc is ServerError) {
        throw ServerException(exc.message);
      } else if (exc is NetworkError) {
        throw NetworkException(exc.message);
      } else if (exc is SocketException) {
        throw ConnectionException(exc.message);
      } else {
        rethrow;
      }
    }
  }
}
