import 'dart:async';

import 'package:get/get.dart';
import 'package:netflix_with_tmdb/src/view/screen/navbar.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    navigation();
    super.onInit();
  }

  navigation() {
    Timer(const Duration(seconds: 2), () => Get.to(() =>  Navbar()));
  }
}
