import 'package:dio/dio.dart';
import 'package:movies_apps/repository/responses/genre_response.dart';
// import 'package:flutter/foundation.dart';
import 'package:movies_apps/repository/responses/movie_response.dart';
import 'package:movies_apps/repository/responses/tv_response.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiServices {
  final String baseUrl = "https://api.themoviedb.org/3";
  final String apiKey = "0660957cec8f0025b897f74fdb89d258";
  final String baseImgUrl = "https://image.tmdb.org/t/p/";

  Dio _dio = Dio();

  // ApiServices({Dio? dio}) {
  //   _dio = dio ?? Dio();
  //   if (kDebugMode) {
  //     _dio.interceptors.add(PrettyDioLogger(
  //       requestHeader: true,
  //       requestBody: true,
  //       responseBody: true,
  //       responseHeader: false,
  //     ));
  //   }
  // }

  Future<MovieResponse?> topRatedMovie(int currentPage) async {
    try {
      Response response = await _dio.get(
          '$baseUrl/movie/top_rated?api_key=$apiKey&language=id-ID&page=$currentPage');
      if (response.statusCode == 200) {
        return MovieResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<MovieResponse?> nowPlayingMovie(int currentPage) async {
    try {
      Response response = await _dio.get(
          '$baseUrl/movie/now_playing?api_key=$apiKey&include_adult=false&page=$currentPage');
      if (response.statusCode == 200) {
        return MovieResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<MovieResponse?> upComingMovie(int currentPage) async {
    try {
      Response response = await _dio.get(
          '$baseUrl/movie/upcoming?api_key=$apiKey&&include_adult=false&page=$currentPage');
      if (response.statusCode == 200) {
        return MovieResponse.fromJson(response.data);
      }

      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<MovieResponse?> discoverMovie(int currentPage) async {
    try {
      Response response = await _dio.get(
          '$baseUrl/discover/movie?api_key=$apiKey&language=id-ID&sort_by=popularity.desc&include_adult=false&include_video=false&page=1',
          options: Options(
              sendTimeout: 60 * 1000, // 60 seconds
              receiveTimeout: 60 * 1000));
      if (response.statusCode == 200) {
        return MovieResponse.fromJson(response.data);
      }

      return null;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<TvResponse?> getPopularTv() async {
    try {
      Response response =
          await _dio.get('$baseUrl/tv/popular?api_key=$apiKey&language=id-ID',
              options: Options(
                  sendTimeout: 60 * 1000, // 60 seconds
                  receiveTimeout: 60 * 1000));
      if (response.statusCode == 200) {
        return TvResponse.fromJson(response.data);
      }
      return null;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<GenreResponse?> getGenres() async {
    try {
      Response response = await _dio.get(
          '$baseUrl/genre/movie/list?api_key=$apiKey&language=id-ID',
          options: Options(
              sendTimeout: 60 * 1000, // 60 seconds
              receiveTimeout: 60 * 1000));
      if (response.statusCode == 200) {
        return GenreResponse.fromJson(response.data);
      }
      return null;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
    // var decodeRes = jsonDecode(res.body);
    // genresList = GenresList.fromJson(decodeRes);
    // return genresList;
  }
}
