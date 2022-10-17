import 'dart:async';
import 'package:ecom_registration/utils/functions/navigation_context.dart';
import 'package:flutter/material.dart';
import 'widgets/widgets_splash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;

  void startTimer() {
    timer = Timer(
      Duration(seconds: 5),
      () =>jumpToNextScreen(context, '/home'),
    );
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
          children: [
            ImageContainer(),
            ItemsContainer(),
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
