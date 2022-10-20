
import 'package:flutter/material.dart';

import '../../../core/const.dart';

class MainImageCard extends StatelessWidget {
  const MainImageCard({Key? key, required this.indexs, required this.trending})
      : super(key: key);
  final List trending;
  final int indexs;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 140,
        height: 250,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500/${trending[indexs]['poster_path']}'),
              fit: BoxFit.cover),
          borderRadius: radius10,
        ),
      ),
    );
  }
}