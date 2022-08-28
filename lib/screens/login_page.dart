import 'dart:developer';

import 'package:ecom_registration/company_repositary/companies_repo.dart';
import 'package:ecom_registration/model%20/user.dart';
import 'package:ecom_registration/resources/functions/resuable_functions.dart';
import 'package:ecom_registration/resources/functions/creditional_details.dart';
import 'package:ecom_registration/resources/widgets/master_widgets.dart';
import 'package:ecom_registration/resources/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../const.dart';

import 'registration_page.dart';
import 'user_details_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _inputEmailController = new TextEditingController();
  var _inputPasswordController = new TextEditingController();

  @override
  void initState() {
    CompanyDetailsApiRepository().getCompanyDataList() ;
    super.initState();
  }

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          log("From login page btn clicked");
          CompanyDetailsApiRepository().getCompanyDataList() ;
        },
        child: Icon(Icons.add),
      ),
    ));
  }

  Widget ItemsContainer() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TopElementsOfContainer(),
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
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        margin: EdgeInsets.symmetric(vertical: 34.0, horizontal: 8),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //email block
            E_comRegistrationTextHeading('Email :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationInputField(_inputEmailController),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            //password block
            E_comRegistrationTextHeading('Password :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationInputField(_inputPasswordController,
                isPassword: true),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            //forgot password block
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/forget_password');
                },
                child: E_comRegistrationNormalText(
                    'Forgot password', TextDecoration.none)),
            E_comRegistrationSizedVerticalBox(itemBlocGapSize * 2),

            //login button
            GestureDetector(
                onTap: passLoginDetails,
                child:
                    E_comRegistrationLoginOrRegisterButton('Login', context)),
            E_comRegistrationSizedVerticalBox(itemBlocGapSize * 2),

            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Center(
                  child: E_comRegistrationNormalText(
                      "Don't Have Account Click here",
                      TextDecoration.underline)),
            ),
          ]),
        ));
  }

  void passLoginDetails() {
    if (_inputEmailController.text.isEmpty) {
      return E_comRegistrationToastFunction(context, 'Please insert email');
    }
    if (_inputPasswordController.text.isEmpty) {
      return E_comRegistrationToastFunction(context, 'Please insert password');
    }

    if (!checkValidMailOrNot(context, _inputEmailController.text)) {
      return E_comRegistrationToastFunction(
          context, 'Please insert valid email');
    } else {
      Navigator.pushNamed(context, '/user_details');

      // User user = User(
      //     email: _inputEmailController.text,
      //     password: _inputPasswordController.text);
      // loginDetails(context, user);
    }
  }

  @override
  void dispose() {
    _inputEmailController.dispose();
    _inputPasswordController.dispose();
    super.dispose();
  }
}
