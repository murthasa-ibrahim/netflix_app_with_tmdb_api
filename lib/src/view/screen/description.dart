import 'package:flutter/material.dart';
import 'package:netflix_with_tmdb/core/const.dart';

import '../../model/movie_model.dart';

class Description extends StatelessWidget {
  const Description(
      {Key? key,
      required this.moveList, 
    })
      : super(key: key);
  final Movie moveList;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final item =  moveList;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              SizedBox(
                height: size.height * .7,
                child: Stack(
                  children: [
                    Positioned(
                      child: SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500/${item.posterPath}',
                          // widget.bannerUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      child: ColoredBox(
                        color: kWhite,
                        child: Text(
                          '🌟 Average Rating${item.voteAverage}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.releaseDate?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      item.overview,
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Image.network(
                        'https://image.tmdb.org/t/p/w500/${item.backdropPath}')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
