import 'package:ecom_registration/screens/submit_details/details_constant.dart';
import 'package:flutter/material.dart';

Widget ImageContainer() {
  return Container(
      decoration: BoxDecoration(
    color: Colors.transparent,
    image: DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage(
        'assets/screen_back.jpg',
      ),
    ),
  ));
}

Widget ItemsContainer() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Spacer(),
        MiddleElementsOfContainerCompany(),
        SizedBox(height: 32,),
        MiddleElementsOfContainerImageProgress(),
        Spacer(),
        FooterElementsOfContainer(),
        Spacer(),
      ],
    ),
  );
}

Widget MiddleElementsOfContainerCompany() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text('Welcome to ', style: TextStyle(fontSize: 25)),
      SizedBox(
        height: 8,
      ),
      Text(
        'E-COM',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        'REGISTRATION',
        style: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ],
  );
}

Widget MiddleElementsOfContainerImageProgress() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        'assets/loader.gif',
        height: 100,
        width: 60,
      ),
      SizedBox(height: 32,),
      Center(
        child: Image.asset(
          'assets/logo_nepal.png',
          height: 100,
          width: 80,
        ),
      ),
      Center(
        child: Text(
          SubmittedDetailConstant.NepalGovernmentStr,
          style: TextStyle(color:Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),

    ],
  );
}

Widget FooterElementsOfContainer() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Center(
        child: Text(
          SubmittedDetailConstant.projectByTop,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Center(
        child: Text(
          SubmittedDetailConstant.projectByBelow,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
