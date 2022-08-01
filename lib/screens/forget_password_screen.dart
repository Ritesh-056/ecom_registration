import 'package:ecom_registration/resources/functions/resuable_functions.dart';
import 'package:ecom_registration/resources/functions/creditional_details.dart';
import 'package:ecom_registration/resources/widgets/master_widgets.dart';
import 'package:ecom_registration/resources/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../const.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  var _inputEmailController = new TextEditingController();


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
          TopElementsOfContainer(),
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
            
            
            //login button
            GestureDetector(
                onTap: verifyEmail,
                child:
                E_comRegistrationLoginOrRegisterButton('Send email', context)),
            E_comRegistrationSizedVerticalBox(itemBlocGapSize * 2),

          ]),
        ));
  }

  void verifyEmail() {
    if (_inputEmailController.text.isEmpty) {
      return E_comRegistrationToastFunction(context, 'Please insert email');
    } else {
      sendEmailForPasswordRecovery(_inputEmailController.text);
    }
  }

  @override
  void dispose() {
    _inputEmailController.dispose();
    super.dispose();
  }
}
