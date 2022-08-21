import 'package:ecom_registration/const.dart';
import 'package:ecom_registration/resources/post_data%20/user_details_post.dart';
import 'package:ecom_registration/resources/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
                      // insertDetailsToDatabase();
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
  var companyType;
  bool check_company = false;

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
            DropdownButton<String>(
              value: check_company ? companyType : companyList[0],
              items: <String>['Private', 'Government'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  companyType = val!;
                  check_company = true;
                });
              },
            ),
          ],
        ),
        SizedBox(
          height: 16.0,
        ),
        Text(
          companyType == companyList[0] ? 'Rs. 500' : 'Rs.15000',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
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
