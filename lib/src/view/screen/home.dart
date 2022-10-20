import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_with_tmdb/src/view/widget/app_bar_widget.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../core/const.dart';
import '../widget/main_title_card.dart';
import '../widget/number_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(false);

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendignMovies = [];
  List topRatedMovies = [];
  List trendingToday = [];
  List tv = [];
  final String apiKey = 'b3ffe86c641bb7eacf67bfbf2e3cd8f0';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiM2ZmZTg2YzY0MWJiN2VhY2Y2N2JmYmYyZTNjZDhmMCIsInN1YiI6IjYyYjU0ODEwYjc3ZDRiMDA1MmFjY2U2OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.scPLq8OtwHYW5u3IxXraIqNo5fKNTodmgfEHNQxkJkA';

  loadMovies() async {
    TMDB tmdbWithCustomLog = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingResults = await tmdbWithCustomLog.v3.trending
        .getTrending(timeWindow: TimeWindow.week);
    Map topRatedResults = await tmdbWithCustomLog.v3.movies.getTopRated();

    Map trendingTodayResult = await tmdbWithCustomLog.v3.trending.getTrending();
    Map tvResults = await tmdbWithCustomLog.v3.tv.getPopular();

    setState(() {
      trendignMovies = trendingResults['results'];
      topRatedMovies = topRatedResults['results'];
      trendingToday = trendingTodayResult['results'];
      tv = tvResults['results'];
    });
    //  print(trendignMovies);
    // print(trendignMovies);
  }

  @override
  void initState() {
    // loadMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: SafeArea(
            child: ValueListenableBuilder(
                valueListenable: scrollNotifier,
                builder: (ctx, ind, _) {
                  return NotificationListener<UserScrollNotification>(
                    onNotification: (notification) {
                      final ScrollDirection direction = notification.direction;
                      if (direction == ScrollDirection.reverse) {
                        scrollNotifier.value = false;
                      } else if (direction == ScrollDirection.forward) {
                        scrollNotifier.value = true;
                      }
                      return true;
                    },
                    child: SingleChildScrollView(
                      child: Stack(children: [
                        Column(
                          children: [
                           const AppBarWidget(title:"Netflix" ),
                            Stack(children: [
                              Container(
                                width: double.infinity,
                                height: 460,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/u6Pg9eTklhg6Aa7kXaxrfdE1Chi.jpg'),
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
                              trending: trendignMovies,
                            ),
                            MainTitleCard(
                                title: 'Top Rated Movies',
                                trending: topRatedMovies),
                            NumberTitleCard(trending: trendingToday),
                            MainTitleCard(
                              title: 'Top Tv Shows',
                              trending: tv,
                            )
                          ],
                        ),
                        scrollNotifier.value == true
                            ? Container(
                                height: 60,
                                width: double.infinity,
                                color: Colors.transparent,
                              )
                            : kheight
                      ]),
                    ),
                  );
                })));
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
