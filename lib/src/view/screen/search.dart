import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_with_tmdb/src/view_model/search_controller.dart';

import '../../../core/const.dart';
import '../widget/top_search_item_tile.dart';



class Search extends GetView {
   Search({Key? key}) : super(key: key);
  final scontroller =  Get.put<SearchController>(SearchController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                controller:scontroller.searchInput ,
                 onSubmitted: (String value)=> scontroller.filterSearch(value),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                backgroundColor: Colors.grey.withOpacity(.3),
              ),
              kheight,
              const Text(
                'Top Searches',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kheight,
              Expanded(
                child: GetBuilder<SearchController>(
                       builder: (controller) => 
                   ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                     final item = scontroller.searchResults[index];
                      return  TopSeaechItemTile(item: item,);
                    }),
                    separatorBuilder: (ctx, index) => kheight20,
                    itemCount:scontroller.searchResults.length ,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
