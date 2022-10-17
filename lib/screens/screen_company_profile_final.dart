import 'dart:developer';
import 'dart:io';

import 'package:ecom_registration/model%20/company.dart';
import 'package:ecom_registration/utils/functions/navigation_context.dart';
import 'package:ecom_registration/utils/functions/progress_dialog.dart';
import 'package:ecom_registration/utils/functions/resuable_functions.dart';
import '../../widgets/reusable_widgets.dart';
import '../widgets/master_widgets.dart';
import 'package:ecom_registration/state/provider/file_provider.dart';
import 'package:ecom_registration/state/provider/general_func_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../const.dart';
import '../helper/user_details_post.dart';

class UserLocationDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> getUserDetailMap;

  const UserLocationDetailsScreen({
    Key? key,
    required this.getUserDetailMap,
  }) : super(key: key);

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
  var _inputPostalCodeController = new TextEditingController();
  var _inputWardNoController = new TextEditingController();
  bool check_district = false;
  bool check_state = false;

  @override
  void initState() {
    print(widget.getUserDetailMap);
    districtList.sort();
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
                ItemsContainer(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget ItemsContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TopElementsOfContainer(context),
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
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //username block
            E_comRegistrationTextHeading('State :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationInputField(_inputStateController),

            DropdownButton<String>(
              value: check_state ? _inputStateController.text : stateList[0],
              items: stateList.map((String value) {
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
              value: check_district
                  ? _inputDistrictController.text
                  : districtList[0],
              items: districtList.map((String value) {
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
            E_comRegistrationInputField(_inputPostalCodeController,
                inputTypeNumber: true),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            E_comRegistrationTextHeading('Ward No:'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationInputField(_inputWardNoController,
                inputTypeNumber: true),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize * 2),

            E_comRegistrationTextHeading('Documents Required :'),
            E_comRegistrationSizedVerticalBox(8.0),

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: InteractiveViewer(
                  panEnabled: false, // Set it to false
                  // boundaryMargin: EdgeInsets.all(100),
                  minScale: 0.10,
                  maxScale: 8,
                  child: Image.asset(
                    'assets/documents_required.png',
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    fit: BoxFit.fill,
                  )),
            ),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                E_comRegistrationTextHeading('Attach Documents :'),
                Consumer<FilePickerProvider>(
                  builder: (context, filesData, child) =>
                      filesData.files.length > 0
                          ? IconButton(
                              onPressed: () {
                                context
                                    .read<FilePickerProvider>()
                                    .getFileFromStorage();
                              },
                              icon: Icon(
                                Icons.upload_outlined,
                                color: Colors.black,
                              ),
                            )
                          : Container(),
                )
              ],
            ),
            E_comRegistrationSizedVerticalBox(8.0),
            Consumer<FilePickerProvider>(
              builder: (context, fileData, child) => fileData.files.length > 0
                  ? FileSelectedView(fileData.files)
                  : ElevatedButton(
                      onPressed: () {
                        context.read<FilePickerProvider>().getFileFromStorage();
                      },
                      child: Text('Choose File')),
            ),
            E_comRegistrationSizedVerticalBox(itemBlocGapSize * 2),
            Consumer<GeneralFuncProvider>(
                builder: (context, generalProvider, child) =>
                    generalProvider.isRegistrationChargePaid
                        ? E_comRegistrationLoginOrRegisterButton(
                            'Pay fee', context, isPaid: false)
                        : GestureDetector(
                            onTap: () {
                              E_comRegistrationShowModelFunction(context);
                            },
                            child: E_comRegistrationLoginOrRegisterButton(
                                'Pay fee', context))),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),
            Consumer<GeneralFuncProvider>(
              builder: (context, generalProvider, child) => generalProvider
                      .isRegistrationChargePaid
                  ? GestureDetector(
                      onTap: () {
                        checkUserDetails();
                      },
                      child: E_comRegistrationLoginOrRegisterButton(
                          'Submit', context))
                  : E_comRegistrationLoginOrRegisterButton('Submit', context,
                      isPaid: false),
            )
          ],
        ),
      ),
    );
  }

  void checkUserDetails() {
    var files = Provider.of<FilePickerProvider>(context, listen: false).files;

    if (_inputStateController.text.isEmpty) {
      return E_comRegistrationToastFunction(context, 'please select state ');
    }

    if (_inputDistrictController.text.isEmpty) {
      return E_comRegistrationToastFunction(context, 'please select district ');
    }

    if (_inputMunicipalityController.text.isEmpty) {
      return E_comRegistrationToastFunction(
          context, 'please insert municipality');
    }

    if (_inputPostalCodeController.text.isEmpty) {
      return E_comRegistrationToastFunction(
          context, 'please postal code number');
    }

    if (_inputWardNoController.text.isEmpty) {
      return E_comRegistrationToastFunction(
          context, 'please insert ward number');
    }

    if (files.length == 0) {
      return E_comRegistrationToastFunction(context, 'please select files');
    } else {
      GISCircularProgressDialog(
          context, ' Uploading data', 'Please wait uploading to database.');

      String name = widget.getUserDetailMap['name'];
      String email = widget.getUserDetailMap['email'];
      String fieldOfBusiness = widget.getUserDetailMap['fieldOfBusiness'];
      String fax = widget.getUserDetailMap['fax'];
      String telephone = widget.getUserDetailMap['telephone'];

      Company company = new Company(
          telephone: telephone,
          fieldOfBusiness: fieldOfBusiness,
          email: email,
          name: name,
          fax: fax,
          district: _inputDistrictController.text,
          state: _inputStateController.text,
          wardNo: _inputWardNoController.text,
          municipality: _inputMunicipalityController.text,
          postalCode: _inputPostalCodeController.text,
      );

      var files = context.read<FilePickerProvider>().files;

      ApiPostService().uploadData(context,files,company).then((value) {
        print("Status code: ${value.statusCode.toString()}");
        if(value.statusCode == 200){
          E_comRegistrationToastFunction(context, 'Data Uploaded Successful');
          jumpToNextScreen(context,'/user_response_screen');
        }else{
          jumpToPreviousScreen(context);
          log("Error uploading");
        }
      }).catchError((err) {
        jumpToPreviousScreen(context);
        E_comRegistrationToastFunction(context, 'Failed to register! ');
      });
    }
  }

  Widget FileSelectedView(List<File> file) {
    return Column(
      children: attachFile(file),
    );
  }

  List<Widget> attachFile(List<File> file) {
    List<Widget> fileWidget = [];
    for (int i = 0; i < file.length; i++) {

      fileWidget.add(
        Row(
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
              file[i].path.split('/').last,
            )),
            E_comRegistrationSizedHorizontalBox(8.0),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  context.read<FilePickerProvider>().deleteSelectedFile(i);
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      );
    }
    return fileWidget;
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
