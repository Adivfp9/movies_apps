import 'package:flutter/material.dart';
// import 'package:movies_apps/models/genre.dart';
import 'package:movies_apps/models/movie.dart';
import 'package:movies_apps/repository/api_services.dart';
import 'package:movies_apps/repository/responses/movie_response.dart';

ApiServices _apiService = ApiServices();

class NowPlayingProvider extends ChangeNotifier {
  ThemeData themeData = ThemeData();
  bool isLoading = false, hasMoreData = true;
  String? imgPath = '';
  List<Movies> movieList = [];

  NowPlayingProvider() {
    imgPath = _apiService.baseImgUrl;
    getNowPlaying();
  }

  getNowPlaying() async {
    isLoading = true;
    MovieResponse? response = await _apiService.nowPlayingMovie(1);
    List<Movies>? movies = response!.results;
    movieList.addAll(movies!);
    isLoading = false;
    notifyListeners();
  }
}
