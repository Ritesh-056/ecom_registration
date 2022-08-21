import 'package:ecom_registration/resources/functions/resuable_functions.dart';
import 'package:ecom_registration/resources/widgets/master_widgets.dart';
import 'package:ecom_registration/resources/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'registration_page.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  double itemGapSize = 8.0;
  double itemBlocGapSize = 16.0;

  var _inputNameController = new TextEditingController();
  var _inputEmailController = new TextEditingController();
  var _inputTelePhoneController = new TextEditingController();
  var _inputFaxController = new TextEditingController();
  var _inputFieldOfBusinessController = new TextEditingController();
  var _inputCompanyNameController = new TextEditingController();


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
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //username block
            E_comRegistrationTextHeading('Name :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationInputField(_inputNameController),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            //email block
            E_comRegistrationTextHeading('Email :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationInputField(_inputEmailController),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            //password block
            E_comRegistrationTextHeading('Telephone :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationInputField(_inputTelePhoneController,inputTypeNumber: true),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

                // confirm password block
                E_comRegistrationTextHeading('Company Name :'),
                E_comRegistrationSizedVerticalBox(itemGapSize),
                E_comRegistrationInputField(_inputCompanyNameController),

                E_comRegistrationSizedVerticalBox(itemBlocGapSize),



            // confirm password block
            E_comRegistrationTextHeading('FAX :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationInputField(_inputFaxController),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            E_comRegistrationTextHeading('Field of Business :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationInputField(_inputFieldOfBusinessController),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                  onPressed: validateField,
                  child: Text('Next'.toUpperCase())),
            ),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),
          ]),
        ));
  }


  void validateField(){

    if(_inputNameController.text.isEmpty){
      return E_comRegistrationToastFunction(context, 'Please insert user name');
    }
    if(_inputEmailController.text.isEmpty){
      return E_comRegistrationToastFunction(context, 'Please insert email name');
    }

    if(_inputTelePhoneController.text.isEmpty){
      return E_comRegistrationToastFunction(context, 'Please insert telephone number');
    }

    if(_inputCompanyNameController.text.isEmpty){
      return E_comRegistrationToastFunction(context, 'Please insert company name ');
    }

    if(_inputFaxController.text.isEmpty){
      return E_comRegistrationToastFunction(context, 'Please insert fax ');
    }

    if(_inputFieldOfBusinessController.text.isEmpty){
      return E_comRegistrationToastFunction(context, 'Please insert field of business');
    }

    if(!checkValidMailOrNot(context, _inputEmailController.text)){
      return E_comRegistrationToastFunction(context, 'Please email');
    }
    else{
      Navigator.pushNamed(context, '/user_details_address');
    }
  }


  @override
  void dispose() {
    _inputEmailController.dispose();
    _inputNameController.dispose();
    _inputFieldOfBusinessController.dispose();
    _inputFaxController.dispose();
    _inputCompanyNameController.dispose();
    _inputTelePhoneController.dispose();

    super.dispose();
  }
}
