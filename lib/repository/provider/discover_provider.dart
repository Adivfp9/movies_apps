import 'package:flutter/material.dart';
import 'package:movies_apps/models/movie.dart';
import 'package:movies_apps/repository/api_services.dart';
import 'package:movies_apps/repository/responses/movie_response.dart';

final ApiServices _apiService = ApiServices();

class DiscoverProvider extends ChangeNotifier {
  bool isLoading = false, hasMoreData = true;
  String? imgPath = '';
  List<Movies> movieList = [];

  DiscoverProvider() {
    imgPath = _apiService.baseImgUrl;
    getDiscover();
  }

  getDiscover() async {
    isLoading = true;
    MovieResponse? response = await _apiService.discoverMovie(1);
    List<Movies>? movies = response!.results;
    movieList.addAll(movies!);
    isLoading = false;
    notifyListeners();
  }
}
