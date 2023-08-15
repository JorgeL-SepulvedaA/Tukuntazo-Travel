import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tukuntazo_travel/auth/login_screen.dart';
import 'package:tukuntazo_travel/main.dart';
import 'package:tukuntazo_travel/screens/home_screen.dart';
import 'package:tukuntazo_travel/main.dart';


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
                  MaterialPageRoute(
                      builder: (context) =>
                      const SignIn()),
                );
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const Register()),
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
  final txtNombre = TextEditingController();
  final txtUsuario = TextEditingController();
  final txtEmail = TextEditingController();
  final txtContrasena = TextEditingController();
  final txtContrasenaa = TextEditingController();

  @override
  void dispose() {
    txtNombre.dispose();
    txtUsuario.dispose();
    txtEmail.dispose();
    txtContrasena.dispose();
    txtContrasenaa.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Regístrate'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: txtNombre,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            const SizedBox(height: 24.0),
            TextField(
              controller: txtUsuario,
              decoration: const InputDecoration(labelText: 'Usuario'),
            ),
            const SizedBox(height: 24.0),
            TextField(
              controller: txtEmail,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 24.0),
            TextField(
              controller: txtContrasena,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Contraseña'),
            ),
            const SizedBox(height: 24.0),
            TextField(
              controller: txtContrasenaa,
              obscureText: true,
              decoration:
                  const InputDecoration(labelText: 'Confirmar contraseña'),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () async {
                switch(txtContrasena.text == txtContrasenaa.text){
                  case true: {
                    var user = Usuarios(nombre: txtNombre.text, usuario: txtUsuario.text, correo: txtEmail.text, contrasena: txtContrasena.text);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const HomeScreen()),
                    );
                  }
                  break;
                  case false: {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const ErrorDialog()),
                    );
                  }
                  break;

                  default: {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const SignIn()),
                    );
                  }
                  break;
                }
              },
              child: const Text('Registrar'),
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
              child: const Text('¿Tienes tu cuenta? Inicia sesion'),
            ),
          ],
        ),
      ),
    );
  }
}
