import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PracticeUIScreen extends StatefulWidget {
  const PracticeUIScreen({Key? key}) : super(key: key);

  @override
  State<PracticeUIScreen> createState() => _PracticeUIScreenState();
}

class _PracticeUIScreenState extends State<PracticeUIScreen> {
  Color pKcolor = Color(0xff00b3b3);
  Color backGroundColor = Colors.white;

  TextStyle textStyle = TextStyle(
      color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold);
  TextStyle textStyleNormalText = TextStyle(
      color: Colors.black87, fontSize: 14.0, fontWeight: FontWeight.normal);
  TextStyle textStyleNormalTextGrey = TextStyle(
      color: Colors.black54, fontSize: 12.0, fontWeight: FontWeight.normal);
  TextStyle textStyleNormalTextFontSizeSmall = TextStyle(
      color: Colors.black87, fontSize: 13.0, fontWeight: FontWeight.normal);
  TextStyle textStyleNormalTextFontSizeSmallGrey = TextStyle(
      color: Colors.black54, fontSize: 12.0, fontWeight: FontWeight.normal);

  Widget TopContainer() {
    return Row(
      children: [
        Icon(Icons.arrow_back),
        Spacer(),
        Text(
          'Explore',
          style: textStyle,
        ),
        Spacer(),
        Icon(Icons.favorite_border),
        SizedBox(
          width: 16.0,
        ),
        Icon(Icons.location_on),
      ],
    );
  }

  Widget MiddleContainer() {
    return Container(
      height: 160,
      color: Colors.grey.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width - 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(color: Colors.white54, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('London'),
                  ),
                ),
                SizedBox(width: 8.0),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: pKcolor,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      Icons.search_outlined,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose date',
                      style: textStyleNormalTextGrey,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '12 Dec - 22 Dec ',
                      style: textStyleNormalText,
                    ),
                  ],
                ),
                Spacer(),
                Spacer(),
                Container(
                  color: Colors.black12,
                  height: 45,
                  width: 1,
                ),
                SizedBox(
                  width: 16.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Number of Rooms',
                      style: textStyleNormalTextGrey,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '1 Room - 2 Adults ',
                      style: textStyleNormalText,
                    ),
                  ],
                ),
                SizedBox(
                  width: 16.0,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget MainContainerMiddle(String hotelName, int rate) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16.0, right: 16.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.5),
              border: Border.all(color: Colors.black, width: 0.05),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.05),
                  spreadRadius: 3,
                  blurRadius: 1,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]),
          child: Column(
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/hotel.jpg'),
                  ),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12.5),
                      topLeft: Radius.circular(12.5)),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hotelName,
                          style: textStyle,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Text(
                              'Wembley, London',
                              style: textStyleNormalTextFontSizeSmallGrey,
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Icon(
                              Icons.location_on,
                              color: pKcolor,
                              size: 14.0,
                            ),
                            Text(
                              '2 km to city',
                              style: textStyleNormalTextFontSizeSmallGrey,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star_rate_sharp,
                              color: pKcolor,
                              size: 14.0,
                            ),
                            Icon(
                              Icons.star_rate_sharp,
                              color: pKcolor,
                              size: 14.0,
                            ),
                            Icon(
                              Icons.star_rate_sharp,
                              color: pKcolor,
                              size: 14.0,
                            ),
                            Icon(
                              Icons.star_rate_sharp,
                              color: pKcolor,
                              size: 14.0,
                            ),
                            Icon(
                              Icons.star_outline_sharp,
                              color: pKcolor,
                              size: 14.0,
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              '80 reviews ',
                              style: textStyleNormalTextFontSizeSmallGrey,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "\$${rate}",
                          style: textStyle,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          '/per night ',
                          style: textStyleNormalTextFontSizeSmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
            ],
          ),
        ),
        Positioned(
            top: 25,
            right: 40,
            child: Icon(
              Icons.favorite_border,
              color: pKcolor,
              size: 18.0,
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TopContainer(),
              ),
              SizedBox(
                height: 8.0,
              ),
              MiddleContainer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text(
                      '530 hotels found',
                      style: textStyleNormalTextFontSizeSmall,
                    ),
                    Spacer(),
                    Spacer(),
                    Text(
                      'Filters ',
                      style: textStyleNormalTextFontSizeSmall,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Icon(
                      Icons.sort,
                      color: pKcolor,
                    ),
                  ],
                ),
              ),
              MainContainerMiddle('Grand Royal Hotel', 180),
              SizedBox(
                height: 16.0,
              ),
              MainContainerMiddle('Queen Hotel', 220),
            ],
          ),
        ),
      ),
    );
  }
}
