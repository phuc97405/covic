import 'package:covic/info_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../constant.dart';
import 'counter.dart';

class MyHeader extends StatelessWidget {
  final String image;
  final String textTop;
  final String textBottom;
  const MyHeader(
      {Key? key,
      required this.image,
      required this.textTop,
      required this.textBottom})
      : super(key: key);

  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(
            left: kDefaultPadding * 2,
            top: kDefaultPadding * 2.5,
            right: kDefaultPadding),
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xFf3383CD), Color(0xFF11249F)]),
            image:
                DecorationImage(image: AssetImage('assets/images/virus.png'))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                    onTap: () {
                      Get.to(InfoScreen());
                    },
                    child: SvgPicture.asset('assets/icons/menu.svg'))),
            SizedBox(
              height: kDefaultPadding,
            ),
            Expanded(
                child: Stack(
              children: [
                SvgPicture.asset(
                  image,
                  width: 230,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
                Positioned(
                    top: 20,
                    left: 150,
                    child: Text(
                      '$textTop \n$textBottom',
                      style: kHeadingTextStyle,
                    )),
                Container()
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
