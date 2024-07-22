import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/register.dart';
import 'pages/preference.dart';
import 'pages/splash.dart';
import 'pages/map.dart';
import 'pages/profile.dart';
// void main() {
//   runApp(const RegisterPage());
// }
void main() => runApp(
  MaterialApp(
    theme: ThemeData(fontFamily: 'SanFrancisco'),
    initialRoute: '/profile',
    routes: {
      '/splash' : (context) => Splash(),
      '/preference' : (context) => Preference(),
      '/login' : (context) => LoginPage(),
      '/register' : (context) => RegisterPage(),
      '/map' : (context) => Map(),
      '/profile' : (context) => ProfilePage(),
    },
  )
);


// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }




