import 'package:flutter/material.dart';

import '../../../core/const.dart';

class SmartDownloads extends StatelessWidget {
  const SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kWidth,
        Icon(
          Icons.settings,
          size: 30,
          color: kWhite,
        ),
        kWidth,
        Text(
          'Samrt Downloads',
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}