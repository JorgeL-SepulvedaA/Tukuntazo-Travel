import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tukuntazotravel/UIBusiness/HomeUI.dart';
import 'package:tukuntazotravel/UIBusiness/SignUp.dart';

class LogIn extends StatelessWidget{
  const LogIn({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Inicio de sesion',
      home: SignIn(),
    );
  }
}

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super (key: key);

  @override
  State<SignIn> createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _username.dispose();
    _password.dispose();
  }

  bool _showPassword = false;
  bool _keepLoggedIn = false;

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
              child: Image.asset('assets/img/signin.png'),
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
                      controller: _username,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Usuario',
                        hintStyle: TextStyle(color: Colors.grey),
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
                      controller: _password,
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

            const SizedBox(height: 10.0),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),

              child: Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor:
                  const Color.fromRGBO(2, 35, 120, 1),
                  checkboxTheme: CheckboxThemeData(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(2.0),
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
                  dense: true,
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

            const SizedBox(height: 28.0),
            Container(
              width: double.infinity,
              height: 50.0,
              margin:
              const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () async {
                  final correct = await getUser(_username.text, _password.text);
                  if(correct) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const HomeUI()), // Navega a la pantalla de inicio
                    );
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const SignUp()), // Navega a la pantalla de inicio
                    );
                  }
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
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const SignUp()),
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
  Future<bool> getUser(String username, String password) async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? items = prefs.getStringList('items');
    final pssword = items?.elementAt(1);

    return pssword == null ? false : password == pssword ? true : false;
  }
}