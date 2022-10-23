import 'package:dio/dio.dart';
import 'package:find_repo/data/network/response/issue_response.dart';
import 'package:find_repo/data/network/response/repo_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_network_service.g.dart';

@singleton
@RestApi()
abstract class ApiNetworkService {
  @factoryMethod
  factory ApiNetworkService(Dio dio) {
    return _ApiNetworkService(dio);
  }

  @GET('search/repositories?q={text}&page={page}&per_page=50')
  Future<RepoResponse> getRepositories({
    @Path("text") required String text,
    @Path("page") required int page,
  });

  @GET('repos/{name}/issues')
  Future<List<IssueResponse>> getIssues(@Path("name") String name);
}
