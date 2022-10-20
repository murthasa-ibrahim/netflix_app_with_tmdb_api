import 'package:flutter/material.dart';

import '../../../core/const.dart';
import 'main_image_card.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({Key? key, required this.title, required this.trending})
      : super(key: key);

  final List trending;
  final String title;

  @override
  Widget build(BuildContext context) {
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
                  trending.length,
                  (index) => MainImageCard(
                        indexs: index,
                        trending: trending,
                      )),
            ),
          ),
        )
      ],
    );
  }
}