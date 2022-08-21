import 'dart:io';
import 'dart:convert';
import 'package:async/async.dart';
import 'package:ecom_registration/const.dart';
import 'package:ecom_registration/resources/functions/resuable_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../../model /company.dart';
import 'package:path/path.dart';


class ApiPostService {

  uploadData(BuildContext context, Company company) async {
    var endpoints = '${create_user_api_base_url}companyRegistration';


    Map<String, String> headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };


    var request = http.MultipartRequest(
      "POST",
      Uri.parse(endpoints),
    );

    List<MultipartFile> newList = <MultipartFile>[];
    for (int i = 0; i < company.files!.length; i++) {
      File imageFile = File(company.files![i].path);
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
    request.fields['telephone'] = company.telephone ;
    request.fields['fax']  = company.fax ;
    request.fields['fieldOfBusiness'] = company.fieldOfBusiness;
    request.fields['state'] = company.state;
    request.fields['district'] = company.district;
    request.fields['municipality'] = company.municipality;
    request.fields['postalCode'] = company.postalCode ;
    request.fields['wardNo'] = company.wardNo ;

    var response = await http.Response.fromStream(await request.send());
    try {
      if (response.statusCode == 200) {
        Navigator.pop(context);
        return true;
      } else {
        Navigator.pop(context);
        return false;
      }
    } catch (ex) {
      Navigator.pop(context);
      print(ex.toString());
      throw Exception(ex.toString());
    }
  }
}
