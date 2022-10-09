import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecom_registration/const.dart';
import 'package:ecom_registration/resources/functions/resuable_functions.dart';
import 'package:flutter/widgets.dart';

void approveCompany(BuildContext context, int companyId) async {
  try {
    var endPoints ='${create_user_api_base_url}companyRegistration/approve/$companyId';
    var dio = Dio();
    dio.options.headers["Authorization"] = "Bearer ${userToken}";
    var response = await dio.put(endPoints);
    if (response.statusCode == 200) {
      E_comRegistrationToastFunction(context, 'Approved successful');
      Navigator.pushNamed(context, '/approve_company');
    }
  } catch (ex) {
    log("Approved company failed"+ ex.toString());
    return E_comRegistrationToastFunction(context, "Company approve failed! ");
  }
}
