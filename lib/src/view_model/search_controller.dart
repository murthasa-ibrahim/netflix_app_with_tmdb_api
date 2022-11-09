import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:netflix_with_tmdb/services/Movie_services/search_movie.dart';
import 'package:netflix_with_tmdb/src/model/movie_model.dart';
import 'package:netflix_with_tmdb/src/model/search_model.dart';

class SearchController extends GetxController{
  final searchInput = TextEditingController();
  List<Movie> searchResults = [];
  void filterSearch(String query)async{
    // String query = searchInput.text;
    if(query.isNotEmpty){
      
      await SearchMovieService().searchQueryApi(query).then((value){
        log(value.toString());
        searchResults = value;
        update();
      } ).onError((error, stackTrace){
         log(error.toString());
      });
    }
  }
}