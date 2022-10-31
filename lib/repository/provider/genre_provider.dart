import 'package:flutter/material.dart';
import 'package:movies_apps/models/genre.dart';
import 'package:movies_apps/repository/api_services.dart';
import 'package:movies_apps/repository/responses/genre_response.dart';

final ApiServices _apiService = ApiServices();

class GenreProvider extends ChangeNotifier {
  List<Genres> genreList = [];
  bool isLoading = false;
  int? totalGenres = 0;

  GenreProvider() {
    getGenreAll();
  }

  getGenreAll() async {
    isLoading = true;
    GenreResponse? response = await _apiService.getGenres();
    List<Genres>? genres = response!.genres;
    genreList.addAll(genres!);
    isLoading = false;
    notifyListeners();
  }
}
