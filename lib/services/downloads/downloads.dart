
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:netflix_with_tmdb/services/api_endpoints/api_end_points.dart';
import 'package:netflix_with_tmdb/services/api_key/api_key.dart';
import 'package:netflix_with_tmdb/src/model/movie_model.dart';

class DownloadService {
 Future<List<MovieModel>> getMovies() async {
  final endPoint = ApiEndPoints.endPoints['Popular'];
  log(endPoint);
    final uri =
        "${ApiEndPoints.baseUrl+endPoint}?api_key=${ApiKey.apiKey}";
    try {
      final response = await Dio().get(
        uri,
      );
      if (response.statusCode == 200) {
        log("successfully completed the task");
        List<Map<String,dynamic>> results = response.data["results"];
        // log(results.toString());
        // log(response.data["results"].toString());
        return movieModelFromJson(results);
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
