import 'package:flutter/material.dart';
import 'package:tukuntazo_travel/auth/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Register();
  }
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  final txt = TextEditingController();
  final txtNombre = TextEditingController();
  final txtUsuario = TextEditingController();
  final txtEmail = TextEditingController();
  final txtContrasena = TextEditingController();
  final txtContrasenaa = TextEditingController();

  @override
  void dispose() {
    txt.dispose();
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
