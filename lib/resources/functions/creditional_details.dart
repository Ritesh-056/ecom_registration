import 'dart:math';

import 'package:dio/dio.dart';
import 'package:ecom_registration/const.dart';
import 'package:ecom_registration/model%20/user.dart';
import 'package:ecom_registration/resources/functions/resuable_functions.dart';
import 'package:ecom_registration/screens/user_details_page.dart';
import 'package:flutter/material.dart';

void loginDetails(String email, String password) {
  //login functions
}

void registerDetails(BuildContext context, User user) async {
  try{
    var dio = Dio();
    var response = await dio
        .post(create_user_api_base_url, data: {'name': user.name, 'email': user.email, 'password':user.password});
    if(response.statusCode == 200){
      E_comRegistrationToastFunction(context, 'User registered successful');
      Navigator.pushNamed(context, '/login');
    }else{
      E_comRegistrationToastFunction(context, 'User registration failed');
    }
  }catch(ex){
    E_comRegistrationToastFunction(context, ex.toString());
    print(ex.toString());
  }
}

//forget password block
void sendEmailForPasswordRecovery(String email) {}
