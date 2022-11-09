import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:netflix_with_tmdb/services/api_endpoints/api_end_points.dart';
import 'package:netflix_with_tmdb/services/api_key/api_key.dart';
import 'package:netflix_with_tmdb/src/model/movie_model.dart';

class ApiService {
  Future<List<Movie>> getMovies(String epKey) async {
    final endPoint = ApiEndPoints.endPoints[epKey];
    log(endPoint);
    final uri = "${ApiEndPoints.baseUrl + endPoint}?api_key=${ApiKey.apiKey}";
    try {
      final response = await Dio().get(
        uri,
      );
      if (response.statusCode == 200) {
        return moviesFromJson(jsonEncode(response.data["results"]));
      }
      throw 'something went wrong';
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          if (e.response?.data == null) {
            throw "somthing went wrong!";
          }
          throw "No internet";
        }
      }
      log(e.toString());
      throw "something went wrong!!";
    }
  }
}
