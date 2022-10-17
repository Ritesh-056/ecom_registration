import 'package:ecom_registration/model%20/user.dart';
import 'package:ecom_registration/utils/functions/creditional_details.dart';
import 'package:ecom_registration/utils/functions/navigation_context.dart';
import 'package:ecom_registration/utils/functions/resuable_functions.dart';
import '../../widgets/reusable_widgets.dart';
import '../widgets/master_widgets.dart';
import 'package:flutter/material.dart';

import '../const.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  var _inputEmailController = new TextEditingController();
  var _inputPasswordController = new TextEditingController();

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
      ),
    );
  }

  Widget ItemsContainer() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TopElementsOfContainer(context),
          MiddleElementsOfContainerCompany(),
          ForgetPasswordContainer(),
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

  Widget ForgetPasswordContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black12,
          width: 1,
        ),
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
        padding: const EdgeInsets.all(
          18.0,
        ),
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
            E_comRegistrationInputField(_inputEmailController),
            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            Text(
              '* Please check your email to change your password *',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            //login button
            GestureDetector(
              onTap: verifyEmail,
              child: E_comRegistrationLoginOrRegisterButton(
                'Send email',
                context,
              ),
            ),
            E_comRegistrationSizedVerticalBox(itemBlocGapSize * 2),
          ],
        ),
      ),
    );
  }

  void verifyEmail() {
    if (_inputEmailController.text.isEmpty) {
      return E_comRegistrationToastFunction(context, 'Please insert email');
    }

    if (!checkValidMailOrNot(context, _inputEmailController.text)) {
      return E_comRegistrationToastFunction(
          context, 'Please insert valid email');
    }
    if (_inputPasswordController.text.isEmpty) {
      return E_comRegistrationToastFunction(context, 'Please insert password');
    } else {
      jumpToNextScreen(context, '/login');
      User user = User(
          email: _inputEmailController.text,
          password: _inputPasswordController.text);
      sendPasswordChangeRequest(context, user);
    }
  }

  @override
  void dispose() {
    _inputEmailController.dispose();
    super.dispose();
  }
}
