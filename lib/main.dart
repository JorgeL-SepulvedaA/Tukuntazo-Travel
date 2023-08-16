import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tukuntazo_travel/auth/login_screen.dart';
import 'package:tukuntazo_travel/firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TukuntazoTravel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          const LoginScreen(),
    );
  }
}
