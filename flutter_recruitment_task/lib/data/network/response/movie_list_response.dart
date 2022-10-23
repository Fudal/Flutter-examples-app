import 'package:flutter_recruitment_task/data/network/response/movies_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_list_response.g.dart';

@JsonSerializable()
class MovieListResponse {
  final int? page;
  final List<MoviesResponse>? results;

  MovieListResponse(this.page, this.results);

  factory MovieListResponse.fromJson(Map<String, dynamic> json) => _$MovieListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListResponseToJson(this);
}
