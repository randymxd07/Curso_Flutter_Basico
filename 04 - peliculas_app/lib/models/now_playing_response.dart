import 'dart:convert';
import 'movie.dart';

class NowPlayingResponse {

  NowPlayingResponse({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  Dates dates;
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory NowPlayingResponse.fromJson(String str) => NowPlayingResponse.fromMap(json.decode(str));

  factory NowPlayingResponse.fromMap(Map<String, dynamic> json) => NowPlayingResponse(
    dates: Dates.fromJson(json["dates"]),
    page: json["page"],
    results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toMap() => {
    "dates": dates.toString(),
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toString())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}

class Dates {

  Dates({
    required this.maximum,
    required this.minimum,
  });

  DateTime maximum;
  DateTime minimum;

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
    maximum: DateTime.parse(json["maximum"]),
    minimum: DateTime.parse(json["minimum"]),
  );

  // Map<String, dynamic> toJson() => {
  //   "maximum": "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
  //   "minimum": "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
  // };

}

