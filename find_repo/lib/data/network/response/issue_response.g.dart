// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueResponse _$IssueResponseFromJson(Map<String, dynamic> json) =>
    IssueResponse(
      id: json['id'] as int?,
      title: json['title'] as String?,
      user: json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
      body: json['body'] as String?,
      comments: json['comments'] as int?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$IssueResponseToJson(IssueResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'comments': instance.comments,
      'title': instance.title,
      'body': instance.body,
      'user': instance.user,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
