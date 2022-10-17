import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_with_tmdb/src/controller/navbar.dart';

class Navbar extends StatelessWidget {
  Navbar({Key? key}) : super(key: key);
  final controller = Get.put<NavbarController>(NavbarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<NavbarController>(
        builder: (controller) => 
         (controller.screens[controller.currentIndex])),
      bottomNavigationBar: GetBuilder<NavbarController>(
        builder: (controller) => BottomNavigationBar(
            onTap: (index) {
              controller.changeIndex(index);
            },
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.collections), label: 'Hot & New'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.download), label: 'Download')
            ]),
      ),
    );
  }
}
