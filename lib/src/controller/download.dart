import 'package:get/get.dart';
import 'package:netflix_with_tmdb/services/downloads/downloads.dart';

class DownloadController extends GetxController{
  @override
  void onInit() {

    DownloadService().getDownloads();
    super.onInit();
  }
}