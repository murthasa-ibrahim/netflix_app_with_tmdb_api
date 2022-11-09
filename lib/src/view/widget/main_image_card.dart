
import 'package:flutter/material.dart';
import 'package:netflix_with_tmdb/src/model/movie_model.dart';
import 'package:netflix_with_tmdb/src/view/screen/description.dart';

import '../../../core/const.dart';

class MainImageCard extends StatelessWidget {
  const MainImageCard({Key? key, required this.indexs, required this.movieList})
      : super(key: key);
  final List<Movie> movieList;
  final int indexs;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Description(moveList: movieList[indexs]),)),
        child: Container(
          width: 140,
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500/${movieList[indexs].posterPath}'),
                fit: BoxFit.cover),
            borderRadius: radius10,
          ),
        ),
      ),
    );
  }
}