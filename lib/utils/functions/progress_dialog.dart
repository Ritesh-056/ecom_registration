import 'package:flutter/material.dart';
import '../../widgets/reusable_widgets.dart';

void GISCircularProgressDialog(
    BuildContext context, String headingMsg, String textBody) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext mContext) {
        return new SimpleDialog(
          contentPadding: EdgeInsets.all(32.0),
          title: Center(
            child: E_comRegistrationDynamicsText(
                text: headingMsg, isHeadings: true),
          ),
          children: [
            Center(child: new CircularProgressIndicator()),
            SizedBox(
              height: 8.0,
            ),
            E_comRegistrationDynamicsText(text: textBody, isHeadings: false),
          ],
        );
      });
}
