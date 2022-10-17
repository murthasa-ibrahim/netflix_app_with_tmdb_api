import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_with_tmdb/src/controller/download.dart';

import '../../../core/const.dart';
import '../widget/appbar_widget.dart';
import '../widget/download_image_widget.dart';
import '../widget/smart_downlaods.dart';

class Downloads extends StatelessWidget {
   Downloads({Key? key}) : super(key: key);
   final controller = Get.put<DownloadController>(DownloadController());
   List imageList = [
    "https://www.themoviedb.org/t/p/w220_and_h330_face/bnfTPTTytrZZ9Aw6hoOQdojiaKo.jpg",
    "https://www.themoviedb.org/t/p/w220_and_h330_face/74kkM7E5IymHl7ZS4XugP6YT3zU.jpg",
    "https://www.themoviedb.org/t/p/w220_and_h330_face/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: AppBarWidget(
                title: 'Downloads',
              )),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              kheight,
              const SmartDownloads(),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Indroducing Downloads For You',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
              kheight,
              const Text(
                "we will download a personalized selection of \n movies and shows for you,so there's \n always something to watchon your \n device ",
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              kheight,
              SizedBox(
                width: size.width,
                height: size.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(.3),
                      radius: size.width * 0.36,
                    ),
                    DownloadImageWidget(
                      image: imageList[0],
                      margin: const EdgeInsets.only(left: 170, bottom: 50),
                      angle: 20,
                      size: Size(size.width * 0.35, size.height * 0.25),
                    ),
                    DownloadImageWidget(
                      image: imageList[1],
                      margin: const EdgeInsets.only(right: 170, bottom: 50),
                      angle: -20,
                      size: Size(size.width * 0.35, size.height * 0.25),
                    ),
                    DownloadImageWidget(
                      image: imageList[2],
                      margin: const EdgeInsets.only(bottom: 12),
                      size: Size(size.width * 0.4, size.height * 0.29),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () {},
                  color: kBlue,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Text(
                      'Setup',
                      style: TextStyle(
                          color: kWhite, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () {},
                  color: kWhite,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Text(
                      'See What You Can Download',
                      style: TextStyle(
                          color: kBlack, fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
