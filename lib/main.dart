import 'package:ecom_registration/screens/forget_password/forget_password_screen.dart';
import 'package:ecom_registration/screens/company_profile/screen_company_profile.dart';
import 'package:ecom_registration/screens/login/screen_login.dart';
import 'package:ecom_registration/screens/register/screen_register.dart';
import 'package:ecom_registration/screens/splash/screen_splash.dart';
import 'package:ecom_registration/state/provider/file_provider.dart';
import 'package:ecom_registration/state/provider/general_func_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/company_detail/screen_com_list.dart';
import 'screens/home/screen_home.dart';
import 'screens/submit_details/screen_submitted_response.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => FilePickerProvider()),
      ChangeNotifierProvider(create: (_) => GeneralFuncProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'E-com Registration',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/home':(context) => const HomeScreen(),
          '/login':(context) => const LoginScreen(),
          '/register': (context) => const RegistrationScreen(),
          '/company': (context) => const CompanyRegistrationListScreen(),
          '/user_details': (context) => const UserDetailsScreen(),
          '/forget_password': (context) => const ForgetPasswordScreen(),
          '/user_response_screen': (context) => const UserDetailResponseScreen(),
        },
      );
  }
}
