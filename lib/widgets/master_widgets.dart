import 'package:flutter/material.dart';

import '../../const.dart';
import '../utils/functions/navigation_context.dart';

Widget ImageContainer() {
  return Container(
    color: Colors.white,
  );
}

Widget TopGreenContainer(BuildContext context) {
  return Container(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(64.0),
            bottomRight: Radius.circular(64.0)),
        color: Colors.transparent,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/screen_back.jpg',
          ),
        ),
      ));
}

Widget TopElementsOfContainer(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GestureDetector(
        onTap: (){
          jumpToPreviousScreen(context);

        },
        child: Icon(
          Icons.arrow_back_ios,
          color: iconColor,
        ),
      ),
      Icon(
        Icons.more_vert,
        color: iconColor,
      ),
    ],
  );
}
