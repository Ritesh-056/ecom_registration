import 'package:flutter/material.dart';

class GeneralFuncProvider extends ChangeNotifier {

  bool isRegistrationChargePaid  =false;
  bool isPrivateCompany  = true;
  int count = 0;

  void checkFinePaidOrNot(){
    isRegistrationChargePaid  = true ;
    notifyListeners();
  }

  void changTypeOfCompany(){
    count++;
    count % 2 == 0 ? isPrivateCompany = false : isPrivateCompany = true ;
    notifyListeners();
  }

}
