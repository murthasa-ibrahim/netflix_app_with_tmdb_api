List<MovieModel> movieModelFromJson(List< Map<String,dynamic>> list) =>
    List<MovieModel>.from(list.map((x) => MovieModel.fromJson(x)));

class MovieModel {
  MovieModel({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.name,
    required this.originalName,
    required this.firstAirDate,
    required this.originCountry,
  });

  final bool adult;
  final String? backdropPath;
  final int id;
  final String title;
  final String? originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String? mediaType;
  final List<int> genreIds;
  final double popularity;
  final DateTime? releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;
  final String name;
  final String originalName;
  final String firstAirDate;
  final List<String> originCountry;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"] ?? '',
        id: json["id"],
        title: json["title"] ?? '',
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"] ?? '',
        overview: json["overview"],
        posterPath: json["poster_path"] ?? '',
        mediaType: json["media_type"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        popularity: json["popularity"].toDouble(),
        releaseDate: DateTime.parse(json["release_date"]),
        video: json["video"] ?? '',
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        name: json["name"] ?? '',
        originalName: json["original_name"] ?? '',
        firstAirDate: json["first_air_date"] ?? '',
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
      );
}
