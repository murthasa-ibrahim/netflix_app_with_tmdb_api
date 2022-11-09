
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_with_tmdb/src/view_model/splash.dart';


class Splash extends StatelessWidget {
   Splash({Key? key}) : super(key: key);
final controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child:Image.asset("assets/images/netflixlogo.png",height: 120,width: 120,) ,),
    );
  }
}