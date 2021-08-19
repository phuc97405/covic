import 'package:covic/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';

import 'components/counter.dart';
import 'components/my_header.dart';
import 'info_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covic 21',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: 'Merri',
        textTheme: TextTheme(body1: TextStyle(color: kPrimaryColor)),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyHeader(
              image: 'assets/icons/Drcorona.svg',
              textTop: 'All you nedd',
              textBottom: 'is stay at home',
            ),
            Container(
              height: 60,
              padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black38,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/maps-and-flags.svg'),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Expanded(
                      child: DropdownButton(
                    isExpanded: true,
                    underline: SizedBox(),
                    icon: SvgPicture.asset('assets/icons/dropdown.svg'),
                    value: 'VietNam',
                    items: ['Indonesia', 'VietNam', 'Lao', 'Campuchia']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (value) {},
                  ))
                ],
              ),
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                children: [
                  Row(
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: 'Case Update\n',
                          style: kTitleTextStyle,
                        ),
                        TextSpan(
                            text: 'Newst update Aug 19',
                            style: TextStyle(color: kTitleTextColor))
                      ])),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.to(InfoScreen());
                        },
                        child: Text(
                          'See details',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Container(
                    padding: EdgeInsets.all(kDefaultPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kDefaultPadding),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: kDefaultPadding * 1.5,
                            color: kShadowColor)
                      ],
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Counter(
                          number: 1074,
                          color: kInfectedColor,
                          title: 'Infected',
                        ),
                        Counter(
                          number: 12,
                          color: kDeathColor,
                          title: 'Deaths',
                        ),
                        Counter(
                          number: 700,
                          color: kRecoverColor,
                          title: 'Recovered',
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Spead of Virus',
                        style: kTitleTextStyle,
                      ),
                      GestureDetector(
                          onTap: () {
                            Get.to(InfoScreen());
                          },
                          child: Text(
                            'See details',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w600),
                          ))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: kDefaultPadding),
                    padding: EdgeInsets.all(kDefaultPadding),
                    height: 178,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kDefaultPadding),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 30,
                              color: kShadowColor)
                        ]),
                    child: Image.asset('assets/images/map.png'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
