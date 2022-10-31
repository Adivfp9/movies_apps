import 'package:flutter/material.dart';
import 'package:movies_apps/models/movie.dart';
import 'package:movies_apps/repository/api_services.dart';
import 'package:movies_apps/repository/responses/movie_response.dart';

final ApiServices _apiService = ApiServices();

class MoviesProvider extends ChangeNotifier {
  bool? isLoading = false;
  String? imgPath = '';
  List<Movies> nowPlayingList = [];
  List<Movies> upComingList = [];

  MoviesProvider() {
    imgPath = _apiService.baseImgUrl;
    getNowPlaying();
    getUpComing();
  }

  getNowPlaying() async {
    isLoading = true;
    MovieResponse? response = await _apiService.nowPlayingMovie(1);
    List<Movies>? movies = response!.results;
    nowPlayingList.addAll(movies!);
    isLoading = false;
    notifyListeners();
  }

  getUpComing() async {
    isLoading = true;
    MovieResponse? response = await _apiService.upComingMovie(1);
    List<Movies>? upcomingmovies = response!.results;
    upComingList.addAll(upcomingmovies!);
    isLoading = false;
    notifyListeners();
  }
}
