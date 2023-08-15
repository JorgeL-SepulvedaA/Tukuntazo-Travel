import 'package:flutter/material.dart';
import 'package:tukuntazo_travel/auth/login_screen.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
      join(await getDatabasesPath(), 'tukuntazo_travel.db'),
      onCreate: (db, version) {
  return db.execute(
  '''
        CREATE TABLE IF NOT EXISTS usuarios(
          id INTEGER PRIMARY KEY,
          nombre TEXT,
          usuario TEXT,
          correo TEXT,
          contraseña TEXT)
        ''',
  );
  },
  version: 1,
  );
  Future<void> insertUser(Usuarios user) async {
  final db = await database;
  await db.insert(
    'usuarios',
    user.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Usuarios>> users() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('usuarios');

    return List.generate(maps.length, (i) {
      return Usuarios(
      nombre: maps[i]['nombre'],
      usuario: maps[i]['usuario'],
      correo: maps[i]['correo'],
      contrasena: maps[i]['nombre'],
      );
    });
  }

  Future<void> updateUser(Usuarios user) async {
    final db = await database;
    await db.update(
      'usuarios',
      user.toMap(),
      where: 'usuario = ?',
      whereArgs: [user.usuario],
    );
  }

  Future<void> deleteUser(String user) async {
    final db = await database;

    await db.delete(
      'usuarios',
      where: 'usuario = ?',
      whereArgs: [user],
    );
  }

  Future<void> viewUser(String user, String password) async {
    final db = await database;

    await db.rawQuery('''
        select usuario
        from usuarios
        where: usuario = '$user' and contrasena = '$password'
      ''');
  }

  runApp(const MainApp());

  // var fido = const Dog(
  //   id: 0,
  //   name: 'Fido',
  //   age: 35,
  // );
  //
  // await insertDog(fido);
  //
  // print(await dogs());
  //
  // fido = Dog(
  //   id: fido.id,
  //   name: fido.name,
  //   age: fido.age + 7,
  // );
  // await updateDog(fido);
  //
  // print(await dogs());
  //
  // await deleteDog(fido.id);
  //
  // print(await dogs());
}

  class Usuarios {
    final String nombre;
    final String usuario;
    final String correo;
    final String contrasena;

    const Usuarios({
      required this.nombre,
      required this.usuario,
      required this.correo,
      required this.contrasena,
    });

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'usuario': usuario,
      'correo' : correo,
      'contrasena' : contrasena,
    };
  }

  @override
  String toString() {
    return 'usuarios{nombre: $nombre, usuario: $usuario, correo: $correo, contrasena: $contrasena}';
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DominicanTravel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          const LoginScreen(),
    );
  }
}
