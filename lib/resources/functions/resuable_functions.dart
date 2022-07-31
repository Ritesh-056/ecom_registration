import 'package:ecom_registration/resources/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
                Text(
                  'Rs. 500',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                E_comRegistrationSizedVerticalBox(4.0),
                Text(
                  'Will be paid to Nepal Government',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black45),
                ),
                E_comRegistrationSizedVerticalBox(32.0),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: GestureDetector(
                    onTap: () {},
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
