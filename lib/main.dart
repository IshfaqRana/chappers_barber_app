import 'package:chappers/screens/available_slots.dart';
import 'package:chappers/screens/booking.dart';
import 'package:chappers/screens/chat.dart';
import 'package:chappers/screens/client_histoy_screen.dart';
import 'package:chappers/screens/confirm_request.dart';
import 'package:chappers/screens/home_page.dart';
import 'package:chappers/screens/intl_code_picker.dart';
import 'package:chappers/screens/main_screen.dart';
import 'package:chappers/screens/new_password.dart';
import 'package:chappers/screens/notifications.dart';
import 'package:chappers/screens/otp_screen.dart';
import 'package:chappers/screens/profile.dart';
import 'package:chappers/screens/profile_screen.dart';
import 'package:chappers/screens/registration_screen.dart';
import 'package:chappers/screens/reset_screen.dart';
import 'package:chappers/screens/set_date_and_slots.dart';
import 'package:chappers/screens/sign_up_screen.dart';
import 'package:chappers/screens/signup_new.dart';
import 'package:chappers/screens/stylist_profile.dart';
import 'package:chappers/screens/stylist_profiles.dart';
import 'package:chappers/screens/upcoming_request_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'screens/cleint_request_details.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return const Text('SomethingWentWrong');
          }
      if (snapshot.connectionState == ConnectionState.done) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        fontFamily: 'MetroPolis'

      ),
      home: const SignUpScreen(index: 0),
      routes: {
        Login.routeName: (context) => Login(),
        SignUp.routeName: (context) => SignUp(),
        StylistProfileScreen.routeName: (context)=>const StylistProfileScreen(),
        StylistProfilesScreen.routeName: (context)=>const StylistProfilesScreen(),
        NotificationScreen.routeName: (context)=>const NotificationScreen(),
        SlotsScreen.routeName: (context)=>const SlotsScreen(),
        EditProfileScreen.routeName: (context)=> EditProfileScreen(),
        ProfileScreen.routeName: (context)=>const ProfileScreen(),
        UserScreen.routeName: (context)=>const UserScreen(),

      },
    );
      }
      return CircularProgressIndicator();
        }

        );
  }
}
