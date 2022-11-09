import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:netflix_with_tmdb/services/api_endpoints/api_end_points.dart';
import 'package:netflix_with_tmdb/services/api_key/api_key.dart';
import 'package:netflix_with_tmdb/src/model/movie_model.dart';

class SearchMovieService {
  
    Future<List<Movie>> searchQueryApi(String query) async {
      log('search query = $query');
      final uri ="${ApiEndPoints.baseUrl + ApiEndPoints.searchMovie}?api_key=${ApiKey.apiKey}&query=$query";
      try {
        final response = await Dio().get(
          uri,
        );
        if (response.statusCode == 200) {
          log("successfully completed the task");
          // final results = response.data["results"];
          log(response.data.toString());
          // log(results.toString());
          // log(response.data["results"].toString());
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

