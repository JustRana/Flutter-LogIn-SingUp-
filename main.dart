import 'package:flutter/material.dart';
import 'package:login_page/Pages/home_page.dart';
import 'package:login_page/Pages/singup_page.dart';
import 'Pages/Auth.dart';
import 'Pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  
   await Firebase.initializeApp(
    options:  FirebaseOptions(
      apiKey: "AIzaSyBhSc5gsx5WV_LnxvKqk5V6PY-mFFCRIiU",
      appId: "1:605982109876:android:266233f8f491009b80e7e1",
      messagingSenderId: "605982109876",
      projectId: "verify-login-registration",
      ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //delete Banner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 125, 124, 124),
      ),
    routes: {
      '/':(context) => Auth(),
      'Home Page':(context) => HomePage(),
      'SingUp Page':(context) => SingUpPage(),
      'Login Page':(context) => LoginPage(),
    },
    );
  }
}
