import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:netflix_with_tmdb/src/model/movie_model.dart';

import '../../../core/const.dart';
import 'main_image_card.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({Key? key, required this.title, required this.movieList})
      : super(key: key);

  final List<Movie> movieList;
  final String title;

  @override
  Widget build(BuildContext context) {
    log('called here n.............');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kWidth,
        Padding(
          padding: const EdgeInsets.all(.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        LimitedBox(
          maxHeight: 200,
          child: InkWell(
            onTap: () {},
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  movieList.length,
                  (index) => MainImageCard(
                        indexs: index,
                        movieList: movieList,
                      )),
            ),
          ),
        )
      ],
    );
  }
}