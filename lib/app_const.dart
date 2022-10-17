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
  'Bhojpur',
  'Dhankuta',
  'Illam',
  'Jhapa',
  'Khotang',
  'Morang',
  'Okhaldhunga',
  'Panchthar',
  'Sankhuwasabha',
  'Solukhumbu',
  'Sunsari',
  'Taplejung',
  'Solusalleri',
  'Therathum',
  'Udayapur',
  'Parsa',
  'Bara',
  'Rautahat',
  'Danusa',
  'Siraha',
  'Mahottari',
  'Saptari',
  'Sindhuli',
  'Ramechhap',
  'Dolakha',
  'Bhaktapur',
  'Kathmandu',
  'Dhading',
  'Kavrepalanchok',
  'Lalitpur',
  'Nuwakot',
  'Rasuwa',
  'Sindupalchowk',
  'Chitwan',
  'Makwanpur',
  'Baglung',
  'Gorkha',
  'Kaski',
  'Lamjung',
  'Manang',
  'Myagdi',
  'Nawalpur',
  'Parbat',
  'Syangja',
  'Tanahun',
  'Kapilvastu',
  'Parasi',
  'Runpandehi',
  'Arghakhanchi',
  'Gulmi',
  'Palpa',
  'Dang',
  'Pyuthan',
  'Rolpa',
  'Eastern Rukum',
  'Banke ',
  'Bardiya',
  'Western Rukum ',
  'Salyan ',
  'Dolpa',
  'Humla',
  'Jumla',
  'Kalikot',
  'Mugu',
  'Surkhet',
  'Dailekh',
  'Kailali',
  'Achham',
  'Doti',
  'Bajhang',
  'Bajura',
  'Kanchanpur',
  'Dadeldhura',
  'Baitadi'
  'Darchula'
];
