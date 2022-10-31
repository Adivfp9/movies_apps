import 'package:flutter/material.dart';
import 'package:movies_apps/models/genre.dart';
import 'package:movies_apps/repository/api_services.dart';
import 'package:movies_apps/repository/responses/genre_response.dart';

ApiServices _apiService = ApiServices();

class MovieDetailProvider extends ChangeNotifier {
  bool isLoading = false, hasMoreData = true;
  String? imgPath = '';
  List<Genres> genreList = [];

  MovieDetailProvider() {
    imgPath = _apiService.baseImgUrl;
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
