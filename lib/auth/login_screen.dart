import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tukuntazo_travel/auth/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';

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

  bool _showPassword = false;
  bool _keepLoggedIn = false; // Estado para controlar la selección del checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 1.0), // Imagen del logo
            Container(
              width: double.infinity,
              height: 300.0,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Image.asset('assets/images/logo.png'),
            ),

            const SizedBox(height: 24.0), // textField de Usuario
            Container(
              width: double.infinity, // Ocupar el 100% del ancho
              decoration: BoxDecoration(
                color: const Color.fromRGBO(
                    245, 245, 245, 1), // Color de fondo #e3e3e3
                borderRadius: BorderRadius.circular(30.0), // Bordes redondeados
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0), // Espaciado horizontal
              child: const Row(
                children: [
                  Icon(Icons.person, color: Colors.red), // Icono
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
                      obscureText:
                          !_showPassword, // Mostrar u ocultar contraseña según el estado
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
                            !_showPassword; // Cambiar estado de visibilidad
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10.0), // textField de Contraseña
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              
              child: Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor:
                  const Color.fromRGBO(2, 35, 120, 1), // Color del checkbox no seleccionado
                  checkboxTheme: CheckboxThemeData(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(2.0), // Bordes redondeados de 2px
                    ),
                  ),
                ),
                child: CheckboxListTile(
                  title: const Text(
                    'Mantener sesión iniciada',
                    style: TextStyle(
                      color: Color.fromRGBO(2, 35, 120, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                    ),
                  ),
                  dense: true, // Reducir el espacio entre el título y el checkbox
                  value: _keepLoggedIn,
                  onChanged: (newValue) {
                    setState(() {
                      _keepLoggedIn = newValue!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),

            const SizedBox(height: 28.0), // ElevatedButton de Iniciar Sesión
            Container(
              width: double.infinity,
              height: 50.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 16.0), // Margen vertical
              child: ElevatedButton(
                onPressed: () {
                  signIn(txtUsuario.text, txtContrasena.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(2, 35, 120, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'Iniciar Sesión',
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
              child: const Text(
                  '¿No tienes cuenta? Regístrate',
                  style: TextStyle(color: Color.fromRGBO(2, 35, 120, 1))),
            ),
          ],
        ),
      ),
    );
  }
  // Sign in with email and password
  Future<void> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print('Error: $e');
    }
  }
}
