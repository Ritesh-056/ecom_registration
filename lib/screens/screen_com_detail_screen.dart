import 'package:ecom_registration/const.dart';
import 'package:ecom_registration/model%20/company.dart';
import 'package:ecom_registration/resources/functions/approve_company_functions.dart';
import 'package:ecom_registration/resources/functions/navigation_context.dart';
import 'package:ecom_registration/resources/functions/progressdialog.dart';
import 'package:ecom_registration/resources/widgets/master_widgets.dart';
import 'package:ecom_registration/resources/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';

import '../helper/file_getter_api.dart';

class CompanyRegistrationDetailScreen extends StatefulWidget {
  final Company company;
  final int? companyRegisteredId;
  final bool isVerified;

  const CompanyRegistrationDetailScreen({
    Key? key,
    required this.company,
    required this.companyRegisteredId,
    required this.isVerified,
  }) : super(key: key);

  @override
  _CompanyRegistrationDetailScreenState createState() =>
      _CompanyRegistrationDetailScreenState();
}

class _CompanyRegistrationDetailScreenState
    extends State<CompanyRegistrationDetailScreen> {
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
          RegistrationContainer(
            context,
            widget.company,
          ),
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
            Center(
              child: Image.asset(
                'assets/logo_nepal.png',
                height: 100,
                width: 80,
              ),
            ),
            Center(
              child: Text(
                'Nepal Government',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            //username block
            E_comRegistrationTextHeading('Company Name :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comCompanyDetailDocumentTextBoxContainer(context, company.name),
            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            //email block
            E_comRegistrationTextHeading('Email :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comCompanyDetailDocumentTextBoxContainer(context, company.email),
            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            //telephone block
            E_comRegistrationTextHeading('Telephone :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comCompanyDetailDocumentTextBoxContainer(
                context, company.telephone),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            // fax block
            E_comRegistrationTextHeading('FAX :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comCompanyDetailDocumentTextBoxContainer(context, company.fax),
            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            //field of business block
            E_comRegistrationTextHeading('Field of Business :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comCompanyDetailDocumentTextBoxContainer(
                context, company.fieldOfBusiness),
            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            //state block
            E_comRegistrationTextHeading('State :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comCompanyDetailDocumentTextBoxContainer(context, company.state),
            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            //district block
            E_comRegistrationTextHeading('District :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comCompanyDetailDocumentTextBoxContainer(
                context, company.district),
            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            //municipality block
            E_comRegistrationTextHeading('Municipality :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comCompanyDetailDocumentTextBoxContainer(
                context, company.municipality),
            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            //postal code block
            E_comRegistrationTextHeading('Postal Code :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comCompanyDetailDocumentTextBoxContainer(
                context, company.postalCode),
            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            //ward no block
            E_comRegistrationTextHeading('Ward No:'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comCompanyDetailDocumentTextBoxContainer(context, company.wardNo),
            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            //documents block
            E_comRegistrationTextHeading('Documents Added :'),
            E_comRegistrationSizedVerticalBox(8.0),
            FileHolderWidget(company.files),
            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            widget.isVerified
                ? InkWell(
                    onTap: () {
                      jumpToPreviousScreen(context);
                    },
                    child: E_comRegistrationLoginOrRegisterButton(
                        'Close', context),
                  )
                : InkWell(
                    onTap: () {
                      GISCircularProgressDialog(context, "Approve Company",
                          "Please a wait a moment company approving.");
                      approveCompany(context, widget.companyRegisteredId!);
                    },
                    child: E_comRegistrationLoginOrRegisterButton(
                        'Approve Company', context),
                  )
          ],
        ),
      ),
    );
  }

  Widget FileHolderWidget(List<String>? list) {
    return Column(
      children: attachFile(list!),
    );
  }

  List<Widget> attachFile(List<String> file) {
    List<Widget> fileWidget = [];
    for (int i = 0; i < file.length; i++) {
      fileWidget.add(fileShowingWidget(file[i]));
    }
    return fileWidget;
  }

  Widget fileShowingWidget(String fileItem) {
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
          child: Text(fileItem
              ),
        ),
        E_comRegistrationSizedHorizontalBox(8.0),
        IconButton(
            onPressed: () {
              GISCircularProgressDialog(context, "File Opening ",
                  "Please wait a moment file loading");
              getFileFromRemote(context, fileItem);
            },
            icon: Icon(
              Icons.open_in_new,
              size: 20.0,
            ))
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
