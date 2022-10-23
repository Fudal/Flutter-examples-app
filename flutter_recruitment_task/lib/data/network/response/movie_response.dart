import 'package:json_annotation/json_annotation.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponse {
  final int? id;
  @JsonKey(name: "vote_average")
  final double? voteAverage;
  final double? budget;
  final double? revenue;
  final String? title;

  MovieResponse(
      this.id,
      this.voteAverage,
      this.budget,
      this.revenue,
      this.title,
      );

  factory MovieResponse.fromJson(Map<String, dynamic> json) => _$MovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}
