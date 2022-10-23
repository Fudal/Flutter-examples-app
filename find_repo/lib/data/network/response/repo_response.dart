import 'package:find_repo/data/network/response/repository_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repo_response.g.dart';

@JsonSerializable()
class RepoResponse {
  @JsonKey(name: "total_count")
  final int? totalCount;
  @JsonKey(name: "incomplete_results")
  final bool? incompleteResults;
  final List<RepositoryResponse>? items;

  RepoResponse({
    this.totalCount,
    this.incompleteResults,
    this.items,
  });

  factory RepoResponse.fromJson(Map<String, dynamic> json) => _$RepoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RepoResponseToJson(this);
}
