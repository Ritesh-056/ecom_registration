import 'dart:io';

import 'package:ecom_registration/resources/functions/resuable_functions.dart';
import 'package:ecom_registration/resources/widgets/master_widgets.dart';
import 'package:ecom_registration/resources/widgets/reusable_widgets.dart';
import 'package:ecom_registration/state/provider/file_provider.dart';
import 'package:ecom_registration/state/provider/file_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

import '../const.dart';
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


  var _inputStateController = new TextEditingController();
  var _inputDistrictController = new TextEditingController();
  var _inputMunicipalityController = new TextEditingController();
  var _inputPostalCodeController  = new TextEditingController();
  var _inputWardNoController  = new TextEditingController();
  bool check_district = false;
  bool check_state = false;


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
            ItemsContainer(context)
          ],
        ),
      ),
    )));
  }

  Widget ItemsContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TopElementsOfContainer(),
          MiddleElementsOfContainerCompany(),
          RegistrationContainer(context),
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

  Widget RegistrationContainer(BuildContext context) {
    final fileData = context
        .select((FilePickerProvider pickerProvider) => pickerProvider.file);

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
            E_comRegistrationTextHeading('State :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationInputField(_inputStateController),

                DropdownButton<String>(
                  value: check_state ? _inputStateController.text :stateList[0],
                  items:stateList.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (val) {
                      _inputStateController.text = val!;
                      setState(() {
                        check_state = true;
                      });
                  },
                ),

                E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            //email block
            E_comRegistrationTextHeading('District :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationInputField(_inputDistrictController),

                DropdownButton<String>(
                  value: check_district ? _inputDistrictController.text:districtList[0],
                  items:districtList.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (val) {
                    _inputDistrictController.text = val!;
                    setState(() {
                      check_district = true;
                    });
                  },
                ),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            //password block
            E_comRegistrationTextHeading('Municipality :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationInputField(_inputMunicipalityController),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            // confirm password block
            E_comRegistrationTextHeading('Postal Code :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationInputField(_inputPostalCodeController,inputTypeNumber: true),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            E_comRegistrationTextHeading('Ward No:'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationInputField(_inputWardNoController,inputTypeNumber: true),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            E_comRegistrationTextHeading('Attach Documents:'),
            E_comRegistrationSizedVerticalBox(8.0),
            fileData != null
                ? FileSelectedView(fileData)
                : ElevatedButton(
                    onPressed: () {
                      context.read<FilePickerProvider>().getFileFromStorage();
                    },
                    child: Text('Choose File')),
            E_comRegistrationSizedVerticalBox(itemBlocGapSize * 2),
            GestureDetector(
                onTap: () {
                  checkUserDetails();
                },
                child:
                    E_comRegistrationLoginOrRegisterButton('Submit and Pay', context)),
          ]),
        ));
  }



  void checkUserDetails(){

     if(_inputStateController.text.isEmpty){
       return E_comRegistrationToastFunction(context, 'please select state ');
     }

     if(_inputDistrictController.text.isEmpty){
       return E_comRegistrationToastFunction(context, 'please select district ');
     }

     if(_inputMunicipalityController.text.isEmpty){
       return E_comRegistrationToastFunction(context, 'please insert municipality');
     }

     if(_inputPostalCodeController.text.isEmpty){
       return E_comRegistrationToastFunction(context, 'please postal code number');
     }

     if(_inputWardNoController.text.isEmpty){
       return E_comRegistrationToastFunction(context, 'please insert ward number');
     }
     else{
       E_comRegistrationShowModelFunction(context);
     }
  }

  Widget FileSelectedView(File file) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.description_outlined,
          color: Colors.red,
        ),
        E_comRegistrationSizedHorizontalBox(8.0),
        Expanded(
            child: Text(
          file.path.split('/').last,
        )),
        E_comRegistrationSizedHorizontalBox(8.0),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {
              context.read<FilePickerProvider>().getFileFromStorage();
            },
            icon: Icon(
              Icons.file_upload_outlined,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _inputStateController.dispose();
    _inputWardNoController.dispose();
    _inputDistrictController.dispose();
    _inputMunicipalityController.dispose();
    _inputPostalCodeController.dispose();
    super.dispose();
  }
}
