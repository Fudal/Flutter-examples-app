// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepoResponse _$RepoResponseFromJson(Map<String, dynamic> json) => RepoResponse(
      totalCount: json['total_count'] as int?,
      incompleteResults: json['incomplete_results'] as bool?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => RepositoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RepoResponseToJson(RepoResponse instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'incomplete_results': instance.incompleteResults,
      'items': instance.items,
    };
