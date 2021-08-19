import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class Counter extends StatelessWidget {
  final int number;
  final Color color;
  final String title;
  const Counter(
      {Key? key,
      required this.number,
      required this.color,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.all(6),
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(.26),
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(color: color, width: 2),
              ),
            )),
        SizedBox(
          height: kDefaultPadding / 2,
        ),
        Text(
          number.toString(),
          style: TextStyle(fontSize: kDefaultPadding * 1.5, color: color),
        ),
        SizedBox(
          height: kDefaultPadding / 2,
        ),
        Text(
          title,
          style: kSubTextStyle,
        )
      ],
    );
  }
}

