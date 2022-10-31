import 'package:movies_apps/models/movie.dart';

class MovieResponse {
  int? page;
  List<Movies>? results;
  int? totalPages;
  int? totalResults;

  MovieResponse({this.page, this.results, this.totalPages, this.totalResults});

  MovieResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Movies>[];
      json['results'].forEach((v) {
        results!.add(Movies.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
