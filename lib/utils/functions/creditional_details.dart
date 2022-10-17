import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecom_registration/app_const.dart';
import 'package:ecom_registration/helper/persistance_helper.dart';
import 'package:ecom_registration/model%20/user.dart';
import 'package:ecom_registration/utils/functions/navigation_context.dart';
import 'package:ecom_registration/utils/functions/resuable_functions.dart';
import 'package:flutter/material.dart';



void loginDetails(BuildContext context, User user) async {

  try {
    var dio = Dio();
    var sharePreferenceHelperObj =  SharePreferencesHelper();
    var endUrlEndPoints = "${base_url}users/login";

    var response = await dio.post(endUrlEndPoints,
        data: {'email': user.email, 'password': user.password});

    if (response.statusCode == 200) {
      //save token to local storage.
      sharePreferenceHelperObj.saveUserPrefString(userTokenKey,response.data["token"]);
      E_comRegistrationToastFunction(context, 'Login successful');
      jumpToPreviousScreen(context);
      jumpToNextScreen(context,'/company');
    }
  } catch (ex) {
    log("Error while logging! : "+ex.toString());
    Navigator.of(context).pop();
    return E_comRegistrationToastFunction(context, "Login failed! Check user credentials");
  }
}



void registerUser(BuildContext context, User user) async {
  try {
    var dio = Dio();

    var endUrlEndPoints = "${base_url}users/create";
    var response = await dio.post(endUrlEndPoints, data: {
      'name': user.name,
      'email': user.email,
      'password': user.password
    });
    if (response.statusCode == 200) {
      E_comRegistrationToastFunction(context, 'User registered successful');
      jumpToPreviousScreen(context);
      jumpToNextScreen(context,'/home');
    } else {
      jumpToPreviousScreen(context);
      E_comRegistrationToastFunction(context, 'User registration failed');
    }
  } catch (ex) {
    jumpToPreviousScreen(context);
    E_comRegistrationToastFunction(context, 'User registration failed');
    log("Register failed ! "+ex.toString());
  }
}


//forget password block
void sendPasswordChangeRequest(BuildContext context, User user) async {
  try {
    var dio = Dio();
    var response = await dio.put(base_url, data: {
      'password': user.password
    });
    if (response.statusCode == 200) {
      E_comRegistrationToastFunction(context, 'Password changed successful');
      jumpToNextScreen(context,  '/login');
    } else {
      E_comRegistrationToastFunction(context, 'Password changed failed');
    }
  } catch (ex) {
    E_comRegistrationToastFunction(context, 'Password changed failed');
    log("Password changed failed ! "+ex.toString());
  }
}
