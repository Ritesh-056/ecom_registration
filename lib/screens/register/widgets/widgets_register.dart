import 'package:ecom_registration/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';

import '../../../app_const.dart';
import '../../../widgets/master_widgets.dart';
import '../screen_register.dart';


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