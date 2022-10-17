import 'package:ecom_registration/model%20/user.dart';
import 'package:ecom_registration/utils/functions/creditional_details.dart';
import 'package:ecom_registration/utils/functions/navigation_context.dart';
import 'package:ecom_registration/utils/functions/progress_dialog.dart';
import 'package:ecom_registration/utils/functions/resuable_functions.dart';
import '../../widgets/reusable_widgets.dart';
import '../widgets/master_widgets.dart';
import 'package:flutter/material.dart';

import '../const.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key})
      : super(
    key: key,
  );

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _inputEmailController = new TextEditingController();
  var _inputPasswordController = new TextEditingController();

  @override
  void initState() {
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
        ));
  }

  Widget ItemsContainer() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TopElementsOfContainer(context),
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
      margin: EdgeInsets.symmetric(
        vertical: 34.0,
        horizontal: 8,
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                jumpToNextScreen(context,
                  '/forget_password');
              },
              child: E_comRegistrationNormalText(
                'Forgot password',
                TextDecoration.none,
              ),
            ),
            E_comRegistrationSizedVerticalBox(itemBlocGapSize * 2),

            //login button
            GestureDetector(
              onTap: passLoginDetails,
              child: E_comRegistrationLoginOrRegisterButton(
                'Login',
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

  void passLoginDetails() {
    GISCircularProgressDialog(
        context, "User login", "Please wait a minute user is logging");
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
      User user = User(
          email: _inputEmailController.text,
          password: _inputPasswordController.text);
      loginDetails(context, user);
    }
  }

  @override
  void dispose() {
    _inputEmailController.dispose();
    _inputPasswordController.dispose();
    super.dispose();
  }
}
