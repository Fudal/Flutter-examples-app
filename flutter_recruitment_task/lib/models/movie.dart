import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Movie {
  final String title;
  final double voteAverage;
  final double? budget;
  final double? revenue;
  final double? profit;
  final int id;

  Movie({
    required this.title,
    required this.voteAverage,
    this.budget,
    this.revenue,
    this.profit,
    required this.id,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
