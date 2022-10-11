import 'package:ecom_registration/model%20/user.dart';
import 'package:ecom_registration/resources/functions/creditional_details.dart';
import 'package:ecom_registration/resources/functions/resuable_functions.dart';
import 'package:ecom_registration/resources/widgets/master_widgets.dart';
import 'package:ecom_registration/resources/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  double itemGapSize = 8.0;
  double itemBlocGapSize = 16.0;
  bool isAdmin = false;

  var _inputUserNameController = new TextEditingController();
  var _inputEmailController = new TextEditingController();
  var _inputPasswordController = new TextEditingController();
  var _inputConfirmPasswordController = new TextEditingController();

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
    )));
  }

  Widget ItemsContainer() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TopElementsOfContainer(context),
          MiddleElementsOfContainerCompany(),
          RegistrationContainer(),
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

  Widget RegistrationContainer() {
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
            //username block
            E_comRegistrationTextHeading('User name :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationInputField(_inputUserNameController),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

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

            // confirm password block
            E_comRegistrationTextHeading('Confirm Password :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationInputField(_inputConfirmPasswordController,
                isPassword: true),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),
            

            GestureDetector(
                onTap: passRegisterData,
                child: E_comRegistrationLoginOrRegisterButton(
                    'Register', context)),
            E_comRegistrationSizedVerticalBox(itemBlocGapSize * 2),

            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child: Center(
                  child: E_comRegistrationNormalText(
                      "Already Have an Account ?", TextDecoration.underline)),
            ),
          ]),
        ));
  }

  void passRegisterData() {
    if (_inputUserNameController.text.isEmpty) {
      return E_comRegistrationToastFunction(context, 'Please insert user name');
    }

    if (_inputEmailController.text.isEmpty) {
      return E_comRegistrationToastFunction(context, 'Please insert email');
    }

    if (_inputPasswordController.text.isEmpty) {
      return E_comRegistrationToastFunction(context, 'Please insert password');
    }

    if (_inputConfirmPasswordController.text.isEmpty) {
      return E_comRegistrationToastFunction(
          context, 'Please insert confirmation password');
    }

    if (!checkValidMailOrNot(context, _inputEmailController.text)) {
      return E_comRegistrationToastFunction(
          context, 'Please insert valid email');
    }

    if (_inputPasswordController.text != _inputConfirmPasswordController.text) {
      return E_comRegistrationToastFunction(
          context, 'Input password and confirmation password don\'t match');
    } else {
      User user = User(
          email: _inputEmailController.text,
          name: _inputUserNameController.text,
          password: _inputPasswordController.text);
      registerUser(context, user);
    }
  }

  @override
  void dispose() {
    _inputEmailController.dispose();
    _inputPasswordController.dispose();
    _inputConfirmPasswordController.dispose();
    super.dispose();
  }
}
