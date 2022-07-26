import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecom_registration/utils/functions/navigation_context.dart';
import 'package:ecom_registration/utils/functions/resuable_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

import '../app_const.dart';

void getFileFromRemote(BuildContext context, String file) async {
  var _dio = Dio();
  var _baseUrlPath = "${base_url}files/$file";

  final headers = {
    "Accept": "*/*",
    "Accept-Encoding": "gzip, deflate, br",
    "Connection": "keep-alive",
  };

  try {
    var responseJson = await _dio.get(_baseUrlPath,
        options: Options(headers: headers, responseType: ResponseType.bytes));
    if (responseJson.statusCode == 200) {
       openFileFromResponse(context, responseJson.data);
    }
  } catch (ex) {
    jumpToPreviousScreen(context);
    E_comRegistrationToastFunction(context, '');
    throw Exception(ex.toString());
  }
}

void openFileFromResponse(BuildContext context, dynamic response) async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  File file = await File('${appDocPath}.pdf').create();
  file.writeAsBytesSync(response);
  jumpToPreviousScreen(context);
  OpenFilex.open(file.path);
}