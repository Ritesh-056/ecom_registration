import 'dart:async';
import 'dart:io';

import 'package:ecom_registration/resources/functions/progressdialog.dart';
import 'package:ecom_registration/resources/widgets/reusable_widgets.dart';
import 'package:ecom_registration/state/provider/general_func_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

late Timer timer ;

bool checkValidMailOrNot(BuildContext context, String email) {
  bool validResponse;
  int dotPosition = email.indexOf('.');
  int atPosition = email.indexOf('@');

  if (atPosition < 1 && dotPosition - atPosition < 2) {
    validResponse = false;
  } else {
    validResponse = true;
  }

  return validResponse;
}


void E_comRegistrationToastFunction(BuildContext context, String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16.0);
}


void E_comRegistrationShowModelFunction(BuildContext context) {
  showModalBottomSheet(
      isDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payout',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
                E_comRegistrationSizedVerticalBox(4.0),
                Text(
                  'Pay out your balance now',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black45),
                ),
                E_comRegistrationSizedVerticalBox(16.0),
                Center(
                    child: Image.asset(
                  'assets/esewa_logo.png',
                  height: 80,
                  width: MediaQuery.of(context).size.width / 2,
                )),
                E_comRegistrationSizedVerticalBox(16.0),
                CompanyTypeWidget(),
                E_comRegistrationSizedVerticalBox(32.0),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      GISCircularProgressDialog(context,'Payment processing','Please wait a moment to make a payment');
                      timer = Timer(
                          Duration(seconds: 5), () {
                        E_comRegistrationToastFunction(context, 'Payment Successful');
                        Provider.of<GeneralFuncProvider>(context,listen: false).checkFinePaidOrNot();
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                      },
                    child: E_comRegistrationLoginOrRegisterButton(
                        'Pay to Bank Account', context),
                  ),
                ),
                E_comRegistrationSizedVerticalBox(16.0),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: E_comRegistrationCloseButton('Close', context)),
                ),
              ],
            ),
          ),
        );
      });
}



class CompanyTypeWidget extends StatefulWidget {
  const CompanyTypeWidget({Key? key}) : super(key: key);

  @override
  State<CompanyTypeWidget> createState() => _CompanyTypeWidgetState();
}

class _CompanyTypeWidgetState extends State<CompanyTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Company Type: ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            Consumer<GeneralFuncProvider>(
              builder: (context, generalFunc, child) => DropdownButton<String>(
                value: generalFunc.isPrivateCompany ? 'Private' : 'Government',
                items: <String>['Private', 'Government'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (val) {
                  generalFunc.changTypeOfCompany();
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16.0,
        ),
        Consumer<GeneralFuncProvider>(
          builder:(context,generalFunc,child) =>Text(
            generalFunc.isPrivateCompany ? 'Rs. 500' : 'Rs.15000',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ),
        E_comRegistrationSizedVerticalBox(4.0),
        Text(
          'Will be paid to Nepal Government',
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.black45),
        ),
      ],
    );
  }
}


void E_comRegistrationShowAlertDialog(BuildContext context) {

  // set up the buttons
  Widget noButton = TextButton(
    child: Text("NO"),
    onPressed:  () {
      Navigator.pop(context);
    },
  );

  Widget yesButton = TextButton(
    child: Text("YES"),
    onPressed:  () {
      exit(0);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Center(child: Text('Quit App')),
    content: Text("Are you sure want to close the app ?"),
    actions: [
      noButton,
      yesButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}