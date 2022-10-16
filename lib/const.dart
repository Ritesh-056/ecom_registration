import 'package:flutter/material.dart';

const Color kPrimaryColor = Colors.green;
const Color iconColor = Colors.white;

//item size gap
double itemGapSize = 8.0;
double itemBlocGapSize = 16.0;
String userTokenKey = "KEY_FOR_TOKEN";

var userToken;
String response_str =
    "Dear,users your details have been submitted successfully. Your documents will be verified soon after verification you will got an email";

const create_user_api_base_url = "https://894d-103-94-255-142.in.ngrok.io/";

const List<String> companyList = ['Private', 'Government'];
const List<String> stateList = ['1', '2', '3', '4', '5', '6', '7'];
List<String> districtList = [
  'Taplejung',
  'Phidim',
  'Ilam',
  'Chandragadi',
  'Morang',
  'Inaruwa',
  'Dhankutta',
  'Khandbari',
  'Bhojpur',
  'Terhathum',
  'Okhaldunga',
  'Diktel',
  'Solusalleri',
  'Gaighat',
  'Rajbiraj',
  'Siraha',
  'Dhanusa',
  'Jaleswor',
  'Malangwa',
  'Sindhuligadi',
  'Manthali',
  'Charikot',
  'Sindhupalchauk',
  'Dhulikhel',
  'Lalitpur',
  'Bhaktapur',
  'Kathmandu',
  'Bidur',
  'Dhunche',
  'Dhadingbeshi',
  'Makwanpur',
  'Gaur',
  'Kalaiya',
  'Birgunj',
  'Bharatpur',
  'Gorkha',
  'Beshisahar',
  'Damauli',
  'Putalikhel',
  'Pokhara',
  'Chame',
  'Mustang',
  'Kusma',
  'Baini',
  'Baglung',
  'Gulmi',
  'Tansen',
  'Parasi',
  'Bhairawa',
  'Sandhikarka',
  'Taulihawa',
  'Pyuthan',
  'Libang',
  'Musikot',
  'Muskikot',
  'Salyan',
  'Ghorahi',
  'Bardiya',
  'Birendranagar',
  'Nepalgunj',
  'Jajarkot',
  'Dolpa',
  'Simikot',
  'Manma',
  'Gamgadi',
  'Jumla',
  'Bajura',
  'Chainpur',
  'Mangalsen',
  'Silgadi',
  'Dhangadi',
  'Kanchanpur',
  'Dadeldhura',
  'Baitadi',
  'Darchula'
];
