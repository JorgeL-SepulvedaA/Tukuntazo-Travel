import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tukuntazo_travel/auth/login_screen.dart';
import 'package:tukuntazo_travel/auth/FirestoreLogic.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Regístrate',
      home: Register(),
    );
  }
}

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Advertencia'),
          content: const Text('Algunos datos no coinciden'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignIn()),
                );
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Register()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  final txtEmail = TextEditingController();
  final txtContrasena = TextEditingController();
  final txtNombre = TextEditingController();

  @override
  void dispose() {
    txtNombre.dispose();
    txtEmail.dispose();
    txtContrasena.dispose();
    super.dispose();
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
              child: Image.asset('assets/images/signup.png'),
            ),

            // const SizedBox(height: 24.0), // textField de Contraseña
            // Container(
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     color: const Color.fromRGBO(245, 245, 245, 1),
            //     borderRadius: BorderRadius.circular(30.0),
            //   ),
            //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
            //   child: Row(
            //     children: [
            //       const Icon(Icons.person, color: Colors.red),
            //       const SizedBox(width: 16.0),
            //       Expanded(
            //         child: TextField(
            //           controller: txtNombre,
            //           decoration: const InputDecoration(
            //             border: InputBorder.none,
            //             hintText: 'Nombre',
            //             hintStyle: TextStyle(color: Colors.grey),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

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
                  const Icon(Icons.email, color: Colors.red),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: TextField(
                      controller: txtEmail,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Nombre de usuario',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24.0), // textField de Contraseña
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
                      controller: txtContrasena,
                      obscureText:
                      !_showPassword,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Ingresa una contraseña',
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
                      signUp(txtEmail.text, txtContrasena.text);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const SignIn()),
                      );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(2, 35, 120, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'Registrar mi usuario',
                  style: TextStyle(color: Colors.white), // Texto en blanco
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const SignIn()),
                );
              },
              child: const Text(
                  '¿Tienes tu cuenta? Inicia sesion',
                  style: TextStyle(color: Color.fromRGBO(2, 35, 120, 1))),
            ),
          ],
        ),
      ),
    );
  }
  // Sign up with email and password
  Future<void> signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print('Error: $e');
    }
  }
}
