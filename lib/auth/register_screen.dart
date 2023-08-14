import 'package:flutter/material.dart';
import 'package:tukuntazo_travel/auth/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
            const TextField(
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            const SizedBox(height: 24.0),
            const TextField(
              decoration: InputDecoration(labelText: 'Usuario'),
            ),
            const SizedBox(height: 24.0),
            const TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 24.0),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Contraseña'),
            ),
            const SizedBox(height: 24.0),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Confirmar contraseña'),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes agregar la lógica para manejar el inicio de sesión

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const LoginScreen()), // Navega a la pantalla de inicio
                );
              },
              child: const Text('Registrar'),
            ),
            TextButton(
              onPressed: () {
                // Aquí puedes agregar la navegación a la pantalla de registro
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const LoginScreen()), // Navega a la pantalla de inicio de sesion
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
