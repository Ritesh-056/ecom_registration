import 'package:ecom_registration/resources/functions/navigation_context.dart';
import 'package:ecom_registration/resources/widgets/master_widgets.dart';
import 'package:ecom_registration/resources/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Container(
          child: Stack(
            children: [
              ImageContainer(),
              TopGreenContainer(context),
              ItemsContainer()
            ],
          ),
        ),
      ),
    ));
  }

  Widget ItemsContainer() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          MiddleElementsOfContainerCompany(),
          LoginContainer(),
        ],
      ),
    );
  }

  Widget MiddleElementsOfContainerCompany() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        E_comRegistrationSizedVerticalBox(itemBlocGapSize),
        E_comRegistrationHeadings('E-COM'),
        E_comRegistrationHeadings('REGISTRATION'),
      ],
    );
  }

  Widget LoginContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12, width: 1),
        borderRadius: BorderRadius.all(
          Radius.circular(
            20.0,
          ),
        ),
      ),
      margin: EdgeInsets.symmetric(vertical: 34.0, horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0,horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/logo_nepal.png',
                height: 100,
                width: 80,
              ),
            ),
            SizedBox(
              width: 8.0,
            ),
            Center(
              child: Text(
                'Nepal Government',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            SizedBox(
              height: 64,
            ),
            GestureDetector(
              onTap: () {
                jumpToNextScreen(context, '/login');
              },
              child: E_comRegistrationLoginOrRegisterButton(
                'Admin login',
                context,
              ),
            ),
            E_comRegistrationSizedVerticalBox(itemBlocGapSize),
            GestureDetector(
              onTap: () {
                jumpToNextScreen(context, '/user_details');
              },
              child: E_comRegistrationLoginOrRegisterButton(
                'Continue as User',
                context,
              ),
            ),
            E_comRegistrationSizedVerticalBox(itemBlocGapSize * 2),
            GestureDetector(
              onTap: () {
                jumpToNextScreen(context, '/register');
              },
              child: Center(
                child: E_comRegistrationNormalText(
                  "Don't Have Account Click here",
                  TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
