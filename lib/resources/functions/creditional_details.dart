import 'dart:math';

import 'package:dio/dio.dart';
import 'package:ecom_registration/const.dart';
import 'package:ecom_registration/model%20/user.dart';
import 'package:ecom_registration/resources/functions/resuable_functions.dart';
import 'package:ecom_registration/screens/user_details_page.dart';
import 'package:flutter/material.dart';

void loginDetails(BuildContext context, User user) async {

  try {
    var dio = Dio();
    // dio.options.headers["Authorization"] = "Bearer ${token}";
    var endUrlEndPoints = "${create_user_api_base_url}users/login";

    var response = await dio.post(endUrlEndPoints,
        data: {'email': user.email, 'password': user.password});
    if (response.statusCode == 200) {
      E_comRegistrationToastFunction(context, 'Login successful');
      Navigator.pushNamed(context, '/user_details');
    } else {
      E_comRegistrationToastFunction(context, 'Login failed');
    }
  } catch (ex) {
    // E_comRegistrationToastFunction(context, ex.toString());
    print(ex.toString());
  }
}



void registerUser(BuildContext context, User user) async {
  try {
    var dio = Dio();

    var endUrlEndPoints = "${create_user_api_base_url}users/create";
    var response = await dio.post(endUrlEndPoints, data: {
      'name': user.name,
      'email': user.email,
      'password': user.password
    });
    if (response.statusCode == 200) {
      E_comRegistrationToastFunction(context, 'User registered successful');
      Navigator.pushNamed(context, '/login');
    } else {
      E_comRegistrationToastFunction(context, 'User registration failed');
    }
  } catch (ex) {
    // E_comRegistrationToastFunction(context, ex.toString());
    print(ex.toString());
  }
}


//forget password block
void sendPasswordChangeRequest(BuildContext context, User user) async {
  try {
    var dio = Dio();
    var response = await dio.put(create_user_api_base_url, data: {
      'password': user.password
    });
    if (response.statusCode == 200) {
      E_comRegistrationToastFunction(context, 'Password changed successful');
      Navigator.pushNamed(context, '/login');
    } else {
      E_comRegistrationToastFunction(context, 'Password changed failed');
    }
  } catch (ex) {
    // E_comRegistrationToastFunction(context, ex.toString());
    print(ex.toString());
  }
}
