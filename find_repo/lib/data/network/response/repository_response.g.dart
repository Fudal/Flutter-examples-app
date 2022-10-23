// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepositoryResponse _$RepositoryResponseFromJson(Map<String, dynamic> json) =>
    RepositoryResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      issuesUrl: json['issues_url'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      homepage: json['homepage'] as String?,
      openIssuesCount: json['open_issues_count'] as int?,
      defaultBranch: json['default_branch'] as String?,
      language: json['language'] as String?,
      owner: json['owner'] == null
          ? null
          : UserResponse.fromJson(json['owner'] as Map<String, dynamic>),
      fullName: json['full_name'] as String?,
    );

Map<String, dynamic> _$RepositoryResponseToJson(RepositoryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'full_name': instance.fullName,
      'description': instance.description,
      'issues_url': instance.issuesUrl,
      'homepage': instance.homepage,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'open_issues_count': instance.openIssuesCount,
      'default_branch': instance.defaultBranch,
      'language': instance.language,
      'owner': instance.owner,
    };
