import 'package:ecom_registration/resources/widgets/master_widgets.dart';
import 'package:ecom_registration/resources/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'registration_page.dart';

class UserLocationDetailsScreen extends StatefulWidget {
  const UserLocationDetailsScreen({Key? key}) : super(key: key);

  @override
  _UserLocationDetailsScreenState createState() =>
      _UserLocationDetailsScreenState();
}

class _UserLocationDetailsScreenState extends State<UserLocationDetailsScreen> {
  double itemGapSize = 8.0;
  double itemBlocGapSize = 16.0;

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
          TopElementsOfContainer(),
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
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //username block
            E_comRegistrationTextHeading('State :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationInputField(_inputUserNameController),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            //email block
            E_comRegistrationTextHeading('District :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationInputField(_inputEmailController),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            //password block
            E_comRegistrationTextHeading('Municipality :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationInputField(_inputPasswordController),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            // confirm password block
            E_comRegistrationTextHeading('Postal Code :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationInputField(_inputConfirmPasswordController),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            E_comRegistrationTextHeading('Ward No:'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationInputField(_inputConfirmPasswordController),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            E_comRegistrationTextHeading('Insert Identity Card :'),
            ElevatedButton(onPressed: () {}, child: Text('Choose File')),
            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            E_comRegistrationLoginOrRegisterButton('Submit'),
            E_comRegistrationSizedVerticalBox(itemBlocGapSize * 2),
          ]),
        ));
  }

  @override
  void dispose() {
    _inputEmailController.dispose();
    _inputPasswordController.dispose();
    super.dispose();
  }
}
