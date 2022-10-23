// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      title: json['title'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      budget: (json['budget'] as num?)?.toDouble(),
      revenue: (json['revenue'] as num?)?.toDouble(),
      profit: (json['profit'] as num?)?.toDouble(),
      id: json['id'] as int,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'title': instance.title,
      'vote_average': instance.voteAverage,
      'budget': instance.budget,
      'revenue': instance.revenue,
      'profit': instance.profit,
      'id': instance.id,
    };
