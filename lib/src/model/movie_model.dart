import 'dart:convert';

List<Movie> moviesFromJson(String str) =>
    List<Movie>.from(json.decode(str).map((x) => Movie.fromJson(x)));

class Movie {
  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool? adult;

  final String backdropPath;

  final List<int> genreIds;

  final int? id;

  final String? originalLanguage;

  final String originalTitle;
  final String overview;
  final double? popularity;
  final String posterPath;
  final String? releaseDate;

  final String title;

  final bool video;

  final double voteAverage;

  final int voteCount;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"]?? '',
        genreIds: List<int>.from(json["genre_ids"] ?? [].map((x) => x)),
        id: json["id"] ?? -1,
        originalLanguage: json["original_language"] ?? 'en',
        originalTitle: json["original_title"] ?? '',
        overview: json["overview"] ?? '',
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"] ?? '',
        releaseDate: json["release_date"],
        title: json["title"] ?? '',
        video: json["video"] ?? false,
        voteAverage: json["vote_average"].toDouble() ?? -1,
        voteCount: json["vote_count"] ?? 0,
      );
}
