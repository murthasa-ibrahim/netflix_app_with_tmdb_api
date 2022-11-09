import 'package:flutter/material.dart';
import 'package:netflix_with_tmdb/src/model/movie_model.dart';

import '../../../core/const.dart';
import 'number_card.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({Key? key, required this.trending}) : super(key: key);
  final List<Movie> trending;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kWidth,
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Top 10 Movies',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                10, (index) => NumberCard(index: index, trending: trending)),
          ),
        )
      ],
    );
  }
}