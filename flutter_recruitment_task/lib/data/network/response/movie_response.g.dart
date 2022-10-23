// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) =>
    MovieResponse(
      json['id'] as int?,
      (json['vote_average'] as num?)?.toDouble(),
      (json['budget'] as num?)?.toDouble(),
      (json['revenue'] as num?)?.toDouble(),
      json['title'] as String?,
    );

Map<String, dynamic> _$MovieResponseToJson(MovieResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vote_average': instance.voteAverage,
      'budget': instance.budget,
      'revenue': instance.revenue,
      'title': instance.title,
    };
