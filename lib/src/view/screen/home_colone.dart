import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_with_tmdb/src/view_model/fetch_movie_controller.dart';
import 'package:netflix_with_tmdb/src/view/widget/app_bar_widget.dart';

import '../../../core/const.dart';
import '../widget/main_title_card.dart';
import '../widget/number_card.dart';

class Home extends GetView<FetchMovieController> {
  Home({Key? key}) : super(key: key);
  final moviController = Get.put(FetchMovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              GetBuilder<FetchMovieController>(
                builder: (controller) =>
                    // log('builder called............');
                    moviController.trendingList.isNotEmpty
                        ? Column(
                            children: [
                              const AppBarWidget(title: "Netflix"),
                              Stack(children: [
                                Container(
                                  width: double.infinity,
                                  height: 460,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://image.tmdb.org/t/p/w500/${controller.trendingList[4].posterPath}'),
                                          fit: BoxFit.cover)),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: const [
                                          Icon(
                                            Icons.add,
                                            color: kWhite,
                                            size: 30,
                                          ),
                                          Text(
                                            'My List',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      _playButton(),
                                      Column(
                                        children: const [
                                          Icon(
                                            Icons.info_outline,
                                            color: kWhite,
                                          ),
                                          Text(
                                            'Info',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ]),
                              MainTitleCard(
                                title: 'Trending Movies',
                                movieList: moviController.trendingList,
                              ),
                              MainTitleCard(
                                  title: 'Top Rated Movies',
                                  movieList: moviController.topRatedList),
                              NumberTitleCard(
                                  moveList: moviController.popularList),
                              MainTitleCard(
                                title: 'Top Tv Shows',
                                movieList: moviController.upcomingList,
                              )
                            ],
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                              color: Colors.red,
                            ),
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
      onPressed: () {},
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kWhite)),
      icon: const Icon(
        Icons.play_arrow_sharp,
        color: kBlack,
        size: 30,
      ),
      label: const Padding(
        padding: EdgeInsets.only(right: 20),
        child: Text(
          'Play',
          style: TextStyle(
              color: kBlack, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
