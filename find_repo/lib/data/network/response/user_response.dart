import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  final String? login;
  @JsonKey(name: "avatar_url")
  final String? avatarUrl;
  final int? id;

  UserResponse({
    this.login,
    this.avatarUrl,
    this.id,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
