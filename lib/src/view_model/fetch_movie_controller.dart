import 'dart:developer';

import 'package:get/get.dart';

import '../../services/Movie_services/movie_services.dart';
import '../model/movie_model.dart';

class FetchMovieController extends GetxController {

  Future<void> fetchMovie() async {
    upcomingList = await ApiService().getMovies('Up Coming');
    topRatedList = await ApiService().getMovies('Top Rated');
    popularList = await ApiService().getMovies('Popular');
    trendingList = await ApiService().getMovies('Now Playing');
    log("completed......");
    update();
  }
  
   List<Movie> upcomingList = [];
   List<Movie> topRatedList = [];
   List<Movie> trendingList = [];
   List<Movie> popularList = [];

  @override
  void onInit() {
    fetchMovie();
    super.onInit();
  }
}
