
import 'package:get/get.dart';
import 'package:netflix_with_tmdb/src/view/screen/downloads.dart';
import 'package:netflix_with_tmdb/src/view/screen/home.dart';
import 'package:netflix_with_tmdb/src/view/screen/hot_and_new.dart';
import 'package:netflix_with_tmdb/src/view/screen/search.dart';

class NavbarController extends GetxController{
  final screens = [const Home(), const HotAndNew(), const Search(),  Downloads()];

  int currentIndex = 0;
  void changeIndex(int index){
    currentIndex = index;
    update();
  }
}