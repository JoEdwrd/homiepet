import 'package:flutter/material.dart';
import 'component/Pet.dart';
import 'pages/add_pet.dart';
import 'pages/detail_pet.dart';
import 'pages/edit_pet.dart';
import 'pages/my_pets.dart';
import 'pages/login.dart';
import 'pages/register.dart';
import 'pages/preference.dart';
import 'pages/splash.dart';
import 'pages/map.dart';
import 'pages/profile.dart';
import 'pages/edit_profile.dart';
import 'pages/change_password.dart';
import 'pages/homepage.dart';
import 'pages/conversation.dart';

void main() => runApp(
  MaterialApp(
    theme: ThemeData(fontFamily: 'SanFrancisco'),
    initialRoute: '/splash',
    routes: {
      '/splash' : (context) => Splash(),
      '/preference' : (context) => Preference(),
      '/login' : (context) => LoginPage(),
      '/register' : (context) => RegisterPage(),
      '/map' : (context) => Map(
        onShareLocation: (location) {
          Navigator.pop(context, location); // Return the location to the previous page
        },
      ),
      '/profile' : (context) => ProfilePage(),
      '/edit_profile' : (context) => EditProfilePage(),
      '/change_password' : (context) => ChangePasswordPage(),
      '/homepage' : (context) => HomePage(),
      '/conversation': (context) => Conversation(),
      '/mypets' : (context) => MyPetsPage(),
      '/addPet' : (context) => AddPetPage(),
    },
    onGenerateRoute: (settings) {
      if (settings.name == '/detailPet') {
        final Pet petData = settings.arguments as Pet;
        return MaterialPageRoute(
          builder: (context) => DetailPetPage(petData: petData),
        );
      } else if (settings.name == '/editPet') {
        final Pet petData = settings.arguments as Pet;
        return MaterialPageRoute(
          builder: (context) => EditPetPage(petData: petData),
        );
      }
      return null;
    },
  )
);


