import 'dart:io';

import 'package:ecom_registration/const.dart';
import 'package:ecom_registration/model%20/company.dart';
import 'package:ecom_registration/resources/functions/approve_company_functions.dart';
import 'package:ecom_registration/resources/widgets/master_widgets.dart';
import 'package:ecom_registration/resources/widgets/reusable_widgets.dart';
import 'package:ecom_registration/state/provider/file_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class CompanyRegistrationDetailScreen extends StatefulWidget {
  final Company company;
  final int? companyRegisteredId;

  const CompanyRegistrationDetailScreen({
    Key? key,
    required this.company,
    required this.companyRegisteredId,
  }) : super(key: key);

  @override
  _CompanyRegistrationDetailScreenState createState() =>
      _CompanyRegistrationDetailScreenState();
}

class _CompanyRegistrationDetailScreenState
    extends State<CompanyRegistrationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
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
          RegistrationContainer(context, widget.company),
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
  

  Widget RegistrationContainer(BuildContext context, Company company) {
    return Container(
      width: MediaQuery.of(context).size.width,
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
            E_comRegistrationTextHeading('Company Name :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationDynamicsText(text: company.name, isHeadings: false,),
            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            //email block
            E_comRegistrationTextHeading('Email :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationDynamicsText(text: company.email, isHeadings: false,),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            //password block
            E_comRegistrationTextHeading('Telephone :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationDynamicsText(text: company.telephone, isHeadings: false,),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),


            // confirm password block
            E_comRegistrationTextHeading('FAX :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationDynamicsText(text: company.fax, isHeadings: false,),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            E_comRegistrationTextHeading('Field of Business :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationDynamicsText(text: company.fieldOfBusiness, isHeadings: false,),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            E_comRegistrationTextHeading('State :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationDynamicsText(text: company.state, isHeadings: false,),



            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            //email block
            E_comRegistrationTextHeading('District :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationDynamicsText(text: company.district, isHeadings: false,),


            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            //password block
            E_comRegistrationTextHeading('Municipality :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationDynamicsText(text: company.municipality, isHeadings: false,),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            // confirm password block
            E_comRegistrationTextHeading('Postal Code :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationDynamicsText(text: company.postalCode, isHeadings: false,),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),


            E_comRegistrationTextHeading('Ward No:'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comRegistrationDynamicsText(text: company.wardNo, isHeadings: false,),


            E_comRegistrationSizedVerticalBox(itemBlocGapSize ),
            E_comRegistrationTextHeading('Documents Added :'),
            E_comRegistrationSizedVerticalBox(8.0),

            Consumer<FilePickerProvider>(
              builder: (context, fileData, child) => fileData.files.length > 0
                  ? FileSelectedView(fileData.files)
                  : Container(),
            ),
            E_comRegistrationSizedVerticalBox(itemBlocGapSize),
            ElevatedButton(onPressed: (){
             approveCompany(context, widget.companyRegisteredId!);
            }, child: Text('Approved Company')
            )
          ]),
        ));
  }

  Widget FileSelectedView(List<File> file) {
    return Column(
      children: attachFile(file),
    );
  }

  List<Widget> attachFile(List<File> file) {
    List<Widget> fileWidget = [];
    for (int i = 0; i < file.length; i++) {
      fileWidget.add(Row(
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
          IconButton(onPressed: (){

          }, icon: Icon(Icons.arrow_forward_ios))
        ],
      ));
    }
    return fileWidget;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
