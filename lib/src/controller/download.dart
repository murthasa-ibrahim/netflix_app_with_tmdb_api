import 'package:get/get.dart';
import 'package:netflix_with_tmdb/services/downloads/downloads.dart';

import '../model/movie_model.dart';

class DownloadController extends GetxController {
  @override
  void onInit() {
    DownloadService().getMovies();
    super.onInit();
  }

  List<MovieModel> movieList = [];
}
