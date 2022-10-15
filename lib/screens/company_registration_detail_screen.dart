import 'dart:io';
import 'dart:math';

import 'package:ecom_registration/const.dart';
import 'package:ecom_registration/model%20/company.dart';
import 'package:ecom_registration/resources/functions/approve_company_functions.dart';
import 'package:ecom_registration/resources/widgets/master_widgets.dart';
import 'package:ecom_registration/resources/widgets/reusable_widgets.dart';
import 'package:ecom_registration/state/provider/file_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'document_view_screen.dart';

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
  List<File> pdfFilesList = [];

  @override
  void initState() {
    fileSelected();
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
    )));
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

            //password block
            E_comRegistrationTextHeading('Telephone :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comCompanyDetailDocumentTextBoxContainer(
                context, company.telephone),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            // confirm password block
            E_comRegistrationTextHeading('FAX :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comCompanyDetailDocumentTextBoxContainer(context, company.fax),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            E_comRegistrationTextHeading('Field of Business :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comCompanyDetailDocumentTextBoxContainer(
                context, company.fieldOfBusiness),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            E_comRegistrationTextHeading('State :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comCompanyDetailDocumentTextBoxContainer(context, company.state),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            //email block
            E_comRegistrationTextHeading('District :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comCompanyDetailDocumentTextBoxContainer(
                context, company.district),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            //password block
            E_comRegistrationTextHeading('Municipality :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comCompanyDetailDocumentTextBoxContainer(
                context, company.municipality),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            // confirm password block
            E_comRegistrationTextHeading('Postal Code :'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comCompanyDetailDocumentTextBoxContainer(
                context, company.postalCode),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),

            E_comRegistrationTextHeading('Ward No:'),
            E_comRegistrationSizedVerticalBox(itemGapSize),
            E_comCompanyDetailDocumentTextBoxContainer(context, company.wardNo),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),
            E_comRegistrationTextHeading('Documents Added :'),
            E_comRegistrationSizedVerticalBox(8.0),

            FileSelectedView(company.files!),

            E_comRegistrationSizedVerticalBox(itemBlocGapSize),
            widget.isVerified
                ? InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: E_comRegistrationLoginOrRegisterButton(
                        'Close', context),
                  )
                : InkWell(
                    onTap: () {
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

  // Future<File> generatedFileFromBuffer(List<int> bufferData) async {
  //   final tempDir = await getTemporaryDirectory();
  //   File file =
  //       await File('${tempDir.path}/${widget.company.name}.pdf').create();
  //   file.writeAsBytesSync(bufferData);
  //   return file;
  // }

  void fileSelected() async {
    var arrayFiles = widget.company.files;
    for (int i = 0; i < arrayFiles!.length; i++) {
      final tempDir = await getTemporaryDirectory();
      File file =
          await File('${tempDir.path}/${widget.company.name}_document.pdf')
              .create();
      file.writeAsBytesSync(arrayFiles[i].data);
      setState(() => pdfFilesList.add(file));
    }
  }

  Widget FileSelectedView(List<FileElement> file) {
    return (pdfFilesList.isNotEmpty)
        ? Column(
            children: attachFile(pdfFilesList),
          )
        : Container(
            color: Colors.red,
          );
  }

  List<Widget> attachFile(List<File>? file) {
    List<Widget> fileWidget = [];
    for (int i = 0; i < file!.length; i++) {
      fileWidget.add(fileShowingWidget(file[i]));
    }
    return fileWidget;
  }

  Widget fileShowingWidget(File fileItem) {
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
            fileItem.path.split('/').last,
          ),
        ),
        E_comRegistrationSizedHorizontalBox(8.0),
        IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) =>
              //         SelectedDocumentViewScreen(file: fileItem),
              //   ),
              // );
              OpenFilex.open(fileItem.path);

            },
            icon: Icon(
              Icons.arrow_forward_ios,
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
