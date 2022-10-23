import 'package:json_annotation/json_annotation.dart';

part 'movies_response.g.dart';

@JsonSerializable()
class MoviesResponse {
  final int? id;
  @JsonKey(name: "vote_average")
  final double? voteAverage;
  final String? title;

  MoviesResponse(
      this.id,
      this.voteAverage,
      this.title,
      );

  factory MoviesResponse.fromJson(Map<String, dynamic> json) => _$MoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);
}
