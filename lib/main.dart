import 'package:flutter/material.dart';
import 'package:homiepet/pages/add_pet.dart';
import 'package:homiepet/pages/detail_pet.dart';
import 'package:homiepet/pages/edit_pet.dart';
import 'package:homiepet/pages/my_pets.dart';
import 'component/Pet.dart';
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
    initialRoute: '/splash',
    routes: {
      '/splash' : (context) => Splash(),
      '/preference' : (context) => Preference(),
      '/login' : (context) => LoginPage(),
      '/register' : (context) => RegisterPage(),
      '/map' : (context) => Map(),
      '/profile' : (context) => ProfilePage(),
      '/mypets' : (context) => MyPetsPage(),
      '/addPet' : (context) => AddPetPage(),
    },
    onGenerateRoute: (settings) {
      if (settings.name == '/detailPet') {
        final Pet petData = settings.arguments as Pet;
        return MaterialPageRoute(
          builder: (context) => DetailPetPage(petData: petData),
        );
      }else if(settings.name == '/editPet'){
        final Pet petData = settings.arguments as Pet;
        return MaterialPageRoute(
          builder: (context) => EditPetPage(petData: petData),
        );
      }
      return null;
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




