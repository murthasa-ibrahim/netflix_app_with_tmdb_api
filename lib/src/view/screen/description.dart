import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  const Description(
      {Key? key,
      required this.name,
      required this.bannerUrl,
      required this.description,
      required this.launchOn,
      required this.vote,
      required this.posterUrl})
      : super(key: key);
  final String name, description, bannerUrl, posterUrl, vote, launchOn;
  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(
      children: [
        SizedBox(
          height: 250,
          child: Stack(
            children: [
              Positioned(
                  child: SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.bannerUrl,
                  fit: BoxFit.cover,
                ),
              )),
              Positioned(
                  bottom: 10,
                  child: Text(
                    '🌟 Average Rating${widget.vote}',
                    style: const  TextStyle(fontSize: 18),
                  ))
            ],
          ),
        )
      ],
    )));
  }
}
