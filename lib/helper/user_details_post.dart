import 'dart:io';

import 'package:async/async.dart';
import 'package:ecom_registration/app_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:path/path.dart';

import '../model /company.dart';


class ApiPostService {

  Future<http.Response> uploadData(BuildContext context,List<File> files, Company company) async {
    var endpoints = "${create_user_api_base_url}companyRegistration";
    Map<String, String> headers = {
      "Content-Type": "application/x-www-form-urlencoded",
    };


    var request = http.MultipartRequest(
      "POST",
      Uri.parse(endpoints),
    );

    List<MultipartFile> newList = <MultipartFile>[];
    for (int i = 0; i < files.length; i++) {
      File imageFile = File(files[i].path);
      var stream =
      new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
      var length = await imageFile.length();
      var multipartFile = new http.MultipartFile("files", stream, length,
          filename: basename(imageFile.path));
      newList.add(multipartFile);
    }


    request.headers.addAll(headers);
    request.files.addAll(newList);
    request.fields['name'] = company.name;
    request.fields['email'] = company.email;
    request.fields['telephone'] = company.telephone;
    request.fields['fax'] = company.fax;
    request.fields['fieldOfBusiness'] = company.fieldOfBusiness;
    request.fields['state'] = company.state;
    request.fields['district'] = company.district;
    request.fields['municipality'] = company.municipality;
    request.fields['postalCode'] = company.postalCode;
    request.fields['wardNo'] = company.wardNo;



    var  response = await http.Response.fromStream(await request.send());
    print("Status code: ${response.statusCode.toString()}");
    return response;
  }
}