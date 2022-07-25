import 'package:flutter/material.dart';

Widget E_comRegistrationInputField(TextEditingController _textController,
    {bool isPassword = false}) {
  return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 0.5),
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child:  isPassword ? TextField(
          obscureText: true,
          controller: _textController,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
        ):TextField(
          obscureText: false,
          controller: _textController,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ));
}

Widget E_comRegistrationSizedHorizontalBox(double mWidth) {
  return SizedBox(
    width: mWidth,
  );
}

Widget E_comRegistrationSizedVerticalBox(double mHeight) {
  return SizedBox(
    height: mHeight,
  );
}

Widget E_comRegistrationHeadings(String strText) {
  return Text(
    strText,
    style: TextStyle(
        color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
  );
}

Widget E_comRegistrationTextHeading(String strText) {
  return Text(
    strText,
    style: TextStyle(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
  );
}

Widget E_comRegistrationNormalText(String strText, TextDecoration decoration) {
  return Text(
    strText,
    style: TextStyle(
        color: Color(0xff3366ff),
        fontSize: 14,
        fontWeight: FontWeight.bold,
        decoration: decoration),
  );
}

Widget E_comRegistrationLoginOrRegisterButton(String txtString,BuildContext context) {
  return Container(
    // margin: EdgeInsets.only(left: 8, right: 8),
    decoration: BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
    width: MediaQuery.of(context).size.width,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(txtString,
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    ),
  );
}


Widget E_comRegistrationCloseButton(String txtString,BuildContext context) {
  return Container(
    // margin: EdgeInsets.only(left: 8, right: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.black54,width: 0.2),
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
    width: MediaQuery.of(context).size.width,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(txtString,
            style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.bold)),
      ),
    ),
  );
}