import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/register.dart';
import 'pages/preference.dart';
import 'pages/splash.dart';
import 'pages/map.dart';
// void main() {
//   runApp(const RegisterPage());
// }
void main()=>runApp(MaterialApp(
  initialRoute: '/map',
  routes: {
    '/splash':(context)=>Splash(),
    '/preference':(context)=>Preference(),
    '/login':(context)=>LoginPage(),
    '/register':(context)=>RegisterPage(),
    '/map':(context)=>Map()
  },
));


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




