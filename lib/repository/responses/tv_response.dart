import 'package:movies_apps/models/tv.dart';

class TvResponse {
  int? page;
  List<Tv>? results;
  int? totalPages;
  int? totalResults;

  TvResponse({this.page, this.results, this.totalPages, this.totalResults});

  TvResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Tv>[];
      json['results'].forEach((v) {
        results!.add(Tv.fromJson(v));
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
