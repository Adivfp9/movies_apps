import 'package:flutter/material.dart';
import 'package:movies_apps/models/movie.dart';
import 'package:movies_apps/repository/api_services.dart';
import 'package:movies_apps/repository/responses/movie_response.dart';

ApiServices _apiService = ApiServices();

class UpComingProvider extends ChangeNotifier {
  bool isLoading = false, hasMoreData = true;
  String? imgPath = '';
  List<Movies> movieList = [];

  UpComingProvider() {
    imgPath = _apiService.baseImgUrl;
    getUpComing();
  }

  getUpComing() async {
    isLoading = true;
    MovieResponse? response = await _apiService.upComingMovie(1);
    List<Movies>? movies = response!.results;
    movieList.addAll(movies!);
    isLoading = false;
    notifyListeners();
  }
}
