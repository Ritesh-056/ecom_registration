import 'package:flutter/material.dart';

void jumpToNextScreen(BuildContext _mContext,String _navigationStr){
  Navigator.pushNamed(_mContext, _navigationStr);
}


void jumpToPreviousScreen(BuildContext _mContext){
  Navigator.of(_mContext).pop();
}