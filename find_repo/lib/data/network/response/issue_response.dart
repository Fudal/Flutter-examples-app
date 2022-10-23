import 'package:find_repo/data/network/response/user_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'issue_response.g.dart';

@JsonSerializable()
class IssueResponse {
  final int? id;
  final int? comments;
  final String? title;
  final String? body;
  final UserResponse? user;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;

  IssueResponse({
    this.id,
    this.title,
    this.user,
    this.createdAt,
    this.body,
    this.comments,
    this.updatedAt,
  });

  factory IssueResponse.fromJson(Map<String, dynamic> json) => _$IssueResponseFromJson(json);

  Map<String, dynamic> toJson() => _$IssueResponseToJson(this);
}
