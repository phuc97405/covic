import 'package:covic/components/my_header.dart';
import 'package:covic/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoScreen extends StatefulWidget {
  InfoScreen({Key? key}) : super(key: key);

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          MyHeader(
              image: 'assets/icons/coronadr.svg',
              textTop: 'Get to know',
              textBottom: 'About Covid-21'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Symptoms',
                  style: kTitleTextStyle,
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SymptomCard(
                      image: 'assets/images/headache.png',
                      title: 'Hedache',
                      isActive: true,
                    ),
                    SymptomCard(
                      image: 'assets/images/caugh.png',
                      title: 'Caugh',
                      isActive: false,
                    ),
                    SymptomCard(
                      image: 'assets/images/fever.png',
                      title: 'Fever',
                      isActive: false,
                    )
                  ],
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Text(
                  'Prevention',
                  style: kTitleTextStyle,
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                PreventCard(
                  image: 'assets/images/wear_mask.png',
                  title: 'Wear face mask',
                  text:
                      'Since the start off the coronavirus outbreak some places have fully embraced wearing facemask',
                ),
                PreventCard(
                  image: 'assets/images/wash_hands.png',
                  title: 'Wear your hands',
                  text:
                      'Since the start off the coronavirus outbreak some places have fully embraced wearing facemask',
                ),
                SizedBox(
                  height: kDefaultPadding * 2,
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCard(
      {Key? key, required this.image, required this.title, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding / 2),
      child: SizedBox(
        height: 156,
        child: Stack(
          children: [
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kDefaultPadding),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 8),
                        blurRadius: 24,
                        color: kShadowColor)
                  ]),
            ),
            Image.asset(image),
            Positioned(
                left: 136,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding, vertical: 15),
                  height: 136,
                  width: MediaQuery.of(context).size.width - 170,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: kTitleTextStyle.copyWith(fontSize: 16),
                      ),
                      Text(
                        text,
                        style: TextStyle(fontSize: 12),
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: SvgPicture.asset('assets/icons/forward.svg'))
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const SymptomCard(
      {Key? key,
      required this.image,
      required this.title,
      this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding / 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            isActive
                ? BoxShadow(
                    offset: Offset(0, 10),
                    color: kActiveShadowColor,
                    blurRadius: kDefaultPadding)
                : BoxShadow(
                    offset: Offset(0, 3), color: kShadowColor, blurRadius: 6)
          ]),
      child: Column(
        children: [
          Image.asset(
            image,
            height: 90,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
