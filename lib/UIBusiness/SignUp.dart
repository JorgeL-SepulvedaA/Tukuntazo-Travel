import 'package:flutter/material.dart';

import 'SignIn.dart';

class JoinUp extends StatelessWidget{
  const JoinUp({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Únete a nosotros',
      home: SignUp(),
    );
  }
}

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super (key: key);

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _username.dispose();
    _password.dispose();
  }

  bool _showPassword = false;

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
              child: Image.asset('assets/img/signup.png'),
            ),

            const SizedBox(height: 24.0),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(245, 245, 245, 1),
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0),
              child: const Row(
                children: [
                  Icon(Icons.person, color: Colors.red),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Usuario',
                        hintStyle: TextStyle(
                            color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24.0),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(245, 245, 245, 1),
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const Icon(Icons.lock, color: Colors.red),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: TextField(
                      obscureText:
                      !_showPassword,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Contraseña',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        _showPassword =
                        !_showPassword;
                      });
                    },
                  ),
                ],
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
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(2, 35, 120, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'Registrar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const SignIn(),
                  )
                );
              },
              child: const Text(
                  '¿Ya tienes cuenta? Inicia',
                  style: TextStyle(color: Color.fromRGBO(2, 35, 120, 1))),
            ),
          ],
        ),
      ),
    );
  }
}