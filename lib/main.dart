import 'package:ecom_registration/screens/document_list_screen.dart';
import 'package:ecom_registration/screens/login_page.dart';
import 'package:ecom_registration/screens/registration_page.dart';
import 'package:ecom_registration/screens/user_details_page.dart';
import 'package:ecom_registration/state/file_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';
import 'screens/user_details__location_page.dart';

void main() {
  runApp(

    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => FilePickerProvider()),
        ],
      child: const MyApp()
    ,
    )
  );
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
        // '/': (context) => const SplashScreen(),
        '/' : (context) => const DocumentListScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegistrationScreen(),
        '/user_details': (context) => const UserDetailsScreen(),
        '/user_details_address': (context) => const UserLocationDetailsScreen(),
        // '/document_list_screen' : (context) => const DocumentListScreen()
      },
    );
  }
}
