import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecom_registration/const.dart';
import 'package:ecom_registration/resources/functions/resuable_functions.dart';
import 'package:flutter/widgets.dart';

void approveCompany(BuildContext context, int companyId) async {

  try {
    var endPoints =' ${create_user_api_base_url}/approve/';

    var dio = Dio();
    dio.options.headers["Authorization"] = "Bearer ${token}";
    var response = await dio.put(endPoints);
    if (response.statusCode == 200) {
      E_comRegistrationToastFunction(context, 'Approved successful');
    } else {
      E_comRegistrationToastFunction(context, 'Login failed');
    }
  } catch (ex) {
    // E_comRegistrationToastFunction(context, ex.toString());
    Navigator.pushNamed(context, '/approve_company');

    log(ex.toString());
  }
}
