
import 'package:shared_preferences/shared_preferences.dart';

class SharePreferencesHelper{

  saveUserPrefString(String userTokenKey,String setUserToken,) async{

    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.setString(userTokenKey,setUserToken);
  }

  Future<String ?> getUserPrefString(String userTokenKey) async{
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    return  _sharedPreferences.getString(userTokenKey)  ?? "" ;

  }



}