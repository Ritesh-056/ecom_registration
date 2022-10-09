import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecom_registration/const.dart';
import 'package:ecom_registration/model%20/company.dart';

class ApprovedCompanyDetailsApiRepository{
   Future<List<Company>?> getApprovedCompaniesList() async{
     List<Company> company = [];
     var endpoints = '${create_user_api_base_url}companyRegistration/approved';
      try{
        var dio = Dio();
        dio.options.headers["Authorization"] = "Bearer ${userToken}";
        var response = await dio.get(endpoints);
        if(response.statusCode == 200){
          for(var  x in response.data['data']){
            company.add(Company.fromJson(x));
          }
          log(company[0].name);
        }else{
          log('Error fetching api!');
        }
      }catch(ex){
        log(ex.toString());
      }
    return company;
  }
}
