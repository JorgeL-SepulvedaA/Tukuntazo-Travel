import 'package:flutter/material.dart';
import 'package:tukuntazotravel/UIBusiness/SignUp.dart';
import 'package:tukuntazotravel/UIBusiness/SignIn.dart';

import 'SignIn.dart';

class Auth extends StatelessWidget{
  const Auth({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '¡Hola!',
      home: HomeUI(),
    );
  }
}

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super (key: key);

  @override
  State<HomeUI> createState() => _HomeUI();
}

class _HomeUI extends State<HomeUI> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 1.0),
            Container(
              width: double.infinity,
              height: 300.0,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Image.asset('assets/img/homeui.png'),
            ),

            const SizedBox(height: 28.0),
            Container(
              width: double.infinity,
              height: 50.0,
              margin:
              const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SignIn()),
                  );

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(2, 35, 120, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'Iniciar Sesión',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 28.0),
            Container(
              width: double.infinity,
              height: 50.0,
              margin:
              const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  '¡Quiero unirme!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}