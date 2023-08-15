import 'package:flutter/material.dart';
import 'package:tukuntazo_travel/screens/home_screen.dart';
import 'package:tukuntazo_travel/auth/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Iniciar Sesión',
      home: SignIn(),
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

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  final txtUsuario = TextEditingController();
  final txtUsuarioX = TextEditingController();
  final txtContrasena = TextEditingController();
  final txtContrasenaX = TextEditingController();

  @override
  void dispose() {
    txtUsuario.dispose();
    txtUsuarioX.dispose();
    txtContrasena.dispose();
    txtContrasenaX.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar Sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity, // Ocupar el 100% del ancho
              decoration: BoxDecoration(
                color: const Color.fromRGBO(245, 245, 245, 1), // Color de fondo #e3e3e3
                borderRadius: BorderRadius.circular(30.0), // Bordes redondeados
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0), // Espaciado horizontal
              child: const Row(
                children: [
                  Icon(Icons.person, color: Colors.grey), // Icono
                  SizedBox(width: 16.0), // Espacio entre el icono y el texto
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none, // Sin bordes
                        hintText: 'Usuario', // Placeholder
                        hintStyle: TextStyle(
                            color: Colors.grey), // Color del placeholder
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: txtContrasena,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Contraseña'),
            ),
            const SizedBox(height: 24.0),
            Container(
              width: double.infinity,
              height: 50.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 16.0), // Margen vertical
              child: ElevatedButton(
                onPressed: () {
                  getUsuario(txtUsuario.text, txtContrasena.text, txtUsuarioX.text, txtContrasenaX.text);
                  switch(txtUsuario.text == txtUsuarioX.text && txtContrasena.text == txtContrasenaX.text){
                    case true: {
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'Registrar',
                  style: TextStyle(color: Colors.white), // Texto en blanco
                ),
              ),
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
