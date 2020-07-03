// To parse this JSON data, do
//
//     final theMovie = theMovieFromJson(jsonString);

import 'dart:convert';

TheMovie theMovieFromJson(String str) => TheMovie.fromJson(json.decode(str));
String theMovieToJson(TheMovie data) => json.encode(data.toJson());

const String POSTER_THUMB_BASE_URL = "https://image.tmdb.org/t/p/w300_and_h450_bestv2";
const String BACKGROUND_BASE_URL = "https://image.tmdb.org/t/p/w500_and_h282_face";

class TheMovie {
  TheMovie({
    this.page,
    this.totalResults,
    this.totalPages,
    this.results,
  });

  int page;
  int totalResults;
  int totalPages;
  List<Result> results;

  factory TheMovie.fromJson(Map<String, dynamic> json) => TheMovie(
    page: json["page"],
    totalResults: json["total_results"],
    totalPages: json["total_pages"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "total_results": totalResults,
    "total_pages": totalPages,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.popularity,
    this.id,
    this.video,
    this.voteCount,
    this.voteAverage,
    this.title,
    this.releaseDate,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.posterPath,
  });

  double popularity;
  int id;
  bool video;
  int voteCount;
  double voteAverage;
  String title;
  DateTime releaseDate;
  OriginalLanguage originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  String posterPath;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    popularity: json["popularity"].toDouble(),
    id: json["id"],
    video: json["video"],
    voteCount: json["vote_count"],
    voteAverage: json["vote_average"].toDouble(),
    title: json["title"],
    releaseDate: DateTime.parse(json["release_date"]),
    originalLanguage: originalLanguageValues.map[json["original_language"]],
    originalTitle: json["original_title"],
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    backdropPath: BACKGROUND_BASE_URL+json["backdrop_path"],
    adult: json["adult"],
    overview: json["overview"],
    posterPath: POSTER_THUMB_BASE_URL+json["poster_path"],
  );

  Map<String, dynamic> toJson() => {
    "popularity": popularity,
    "id": id,
    "video": video,
    "vote_count": voteCount,
    "vote_average": voteAverage,
    "title": title,
    "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    "original_language": originalLanguageValues.reverse[originalLanguage],
    "original_title": originalTitle,
    "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    "backdrop_path": backdropPath,
    "adult": adult,
    "overview": overview,
    "poster_path": posterPath,
  };
}

enum OriginalLanguage { EN, SV, KO, FR }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "fr": OriginalLanguage.FR,
  "ko": OriginalLanguage.KO,
  "sv": OriginalLanguage.SV
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
