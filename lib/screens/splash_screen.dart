import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const Color iconColor = Colors.white;
  late Timer timer;

  void startTimer() {
    timer = Timer(
        Duration(seconds: 5), () => Navigator.pushNamed(context, '/home'));
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [ImageContainer(), ItemsContainer()],
    )));
  }

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TopElementsOfContainer(),
          MiddleElementsOfContainerCompany(),
          MiddleElementsOfContainerImageProgress(),
          SizedBox(),
          FooterElementsOfContainer()
        ],
      ),
    );
  }

  Widget TopElementsOfContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/menu.png',
          height: 20,
          width: 20,
        ),
        SizedBox(
          width: 230,
        ),
        Image.asset(
          'assets/english.webp',
          height: 20,
          width: 20,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          'English',
          style: TextStyle(color: Colors.white),
        ),
        Icon(
          Icons.expand_more,
          color: iconColor,
        ),
      ],
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
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
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
                'Project By: Ritesh Baral, Heena Shrestha, Yojan Shakya,',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ),
          Center(
            child: Text('Ronish bajracharya',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ),
        ]);
  }

  @override
  void dispose() {
    //close timer
    timer.cancel();
    super.dispose();
  }
}
