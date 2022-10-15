import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecom_registration/const.dart';
import 'package:ecom_registration/helper/shared_preferences_datas.dart';
import 'package:ecom_registration/model%20/user.dart';
import 'package:ecom_registration/resources/functions/resuable_functions.dart';
import 'package:flutter/material.dart';



void loginDetails(BuildContext context, User user) async {

  try {
    var dio = Dio();
    var sharePreferenceHelperObj =  SharePreferencesHelper();
    var endUrlEndPoints = "${create_user_api_base_url}users/login";

    var response = await dio.post(endUrlEndPoints,
        data: {'email': user.email, 'password': user.password});

    if (response.statusCode == 200) {
      //save token to local storage.
      sharePreferenceHelperObj.saveUserPrefString(userTokenKey,response.data["token"]);
      E_comRegistrationToastFunction(context, 'Login successful');
      Navigator.pushNamed(context, '/company');
    }
  } catch (ex) {
    log("Error while logging! : "+ex.toString());
    return E_comRegistrationToastFunction(context, "Login failed! Check user credentials");
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
      Navigator.pushNamed(context, '/home');
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
