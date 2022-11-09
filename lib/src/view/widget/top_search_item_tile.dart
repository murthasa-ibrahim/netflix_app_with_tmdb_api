import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_with_tmdb/services/api_endpoints/api_end_points.dart';
import 'package:netflix_with_tmdb/src/model/movie_model.dart';
import 'package:netflix_with_tmdb/src/view/screen/description.dart';

import '../../../core/const.dart';

class TopSeaechItemTile extends StatelessWidget {
  const TopSeaechItemTile({Key? key, required this.item}) : super(key: key);
  final Movie item;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        InkWell(
          onTap: () => Get.to(Description(moveList: item,)),
          child: Container(
            height: 80,
            width: screenWidth * 0.4,
            decoration: const BoxDecoration(),
            child: FadeInImage(
              fit: BoxFit.cover,
              placeholder: const AssetImage(
                'assets/images/A_black_image.jpg',
              ),
              image: NetworkImage(ApiEndPoints.imageUrl + item.posterPath),
              imageErrorBuilder: (context, _, __) {
                return Container(
                  color: Colors.grey,
                  height: 80,
                  width: screenWidth * 0.4,
                );
              },
            ),
          ),
        ),
       const SizedBox(width: 20,),
        Expanded(
            child: Text(
          item.title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )),
        const Icon(
          CupertinoIcons.play,
          color: kWhite,
        )
      ],
    );
  }
}
