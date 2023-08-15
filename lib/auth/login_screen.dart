import 'package:flutter/material.dart';
import 'package:tukuntazo_travel/screens/home_screen.dart';
import 'package:tukuntazo_travel/auth/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Iniciar Sesión',
      home: Register(),
    );
  }
}

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  final txtUsuario = TextEditingController();
  final txtContrasena = TextEditingController();

  @override
  void dispose() {
    txtUsuario.dispose();
    txtContrasena.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar Sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: txtUsuario,
              decoration: const InputDecoration(labelText: 'Usuario'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: txtContrasena,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Contraseña'),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes agregar la lógica para manejar el inicio de sesión
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const HomeScreen()), // Navega a la pantalla de inicio
                );
              },
              child: const Text('Iniciar Sesión'),
            ),
            TextButton(
              onPressed: () {
                // Aquí puedes agregar la navegación a la pantalla de registro
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const SignUpScreen()), // Navega a la pantalla de inicio
                );
              },
              child: const Text('¿No tienes cuenta? Regístrate'),
            ),
          ],
        ),
      ),
    );
  }
}