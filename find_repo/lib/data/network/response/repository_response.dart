import 'package:find_repo/data/network/response/user_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repository_response.g.dart';

@JsonSerializable()
class RepositoryResponse {
  final int? id;
  final String? name;
  @JsonKey(name: "full_name")
  final String? fullName;
  final String? description;
  @JsonKey(name: "issues_url")
  final String? issuesUrl;
  final String? homepage;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @JsonKey(name: "open_issues_count")
  final int? openIssuesCount;
  @JsonKey(name: "default_branch")
  final String? defaultBranch;
  final String? language;
  final UserResponse? owner;

  RepositoryResponse({
    this.id,
    this.name,
    this.description,
    this.issuesUrl,
    this.createdAt,
    this.updatedAt,
    this.homepage,
    this.openIssuesCount,
    this.defaultBranch,
    this.language,
    this.owner,
    this.fullName,
  });

  factory RepositoryResponse.fromJson(Map<String, dynamic> json) => _$RepositoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RepositoryResponseToJson(this);
}
