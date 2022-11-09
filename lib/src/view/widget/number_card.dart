
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_with_tmdb/src/model/movie_model.dart';

import '../../../core/const.dart';
import '../screen/description.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({Key? key, required this.moveList}) : super(key: key);
  final List<Movie> moveList;

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
                10, (index) => NumberCard(index: index, trending: moveList)),
          ),
        )
      ],
    );
  }
}

//         Number Card
//        *****************/

class NumberCard extends StatelessWidget {
  const NumberCard({Key? key, required this.index, required this.trending})
      : super(key: key);

  final int index;
  final List<Movie> trending;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => Description(
                  moveList: trending[index],
                )),
          ),
        );
      },
      child: Stack(
        children: [
          Row(children: [
            const SizedBox(
              height: 250,
              width: 40,
            ),
            Container(
              width: 140,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500/${trending[index].posterPath}'),
                    fit: BoxFit.cover),
                borderRadius: radius10,
              ),
            ),
          ]),
          Positioned(
            left: 10,
            bottom: -26,
            child: BorderedText(
              strokeWidth: 10,
              strokeColor: const Color.fromARGB(255, 226, 215, 215),
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 130,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w900),
                textAlign: TextAlign.end,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
