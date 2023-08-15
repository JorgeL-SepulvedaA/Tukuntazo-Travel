import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<void> dbStructureOpen() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'tukuntazo_travel.db'),
  );
}

Future<void> dbStructureCreateTable() async {
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

Future<void> insertUsuario(Usuarios _usuario) async {
  final database = openDatabase(
    join(await getDatabasesPath(), 'tukuntazo_travel.db'),
  );
  final db = await database;

  await db.insert(
    'usuarios',
    _usuario.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

// A method that retrieves all the dogs from the dogs table.
Future<List<Usuarios>> getUsuarios() async {
  final database = openDatabase(
    join(await getDatabasesPath(), 'tukuntazo_travel.db'),
  );
  final db = await database;

  final List<Map<String, dynamic>> maps = await db.query('dogs');


  return List.generate(maps.length, (i) {
    return Usuarios(
      nombre: maps[i]['nombre'],
      usuario: maps[i]['usuario'],
      correo: maps[i]['correo'],
      contrasena: maps[i]['nombre'],
    );
  });
}

Future<void> getUsuario(String username, String password, String user, String pass) async {
  final database = openDatabase(
    join(await getDatabasesPath(), 'tukuntazo_travel.db'),
  );
  final db = await database;

  var usuario = await db.rawQuery('''
  SELECT usuario FROM usuarios WHERE usuario = '$username' and password = '$password'
  ''');

  var contrasena = await db.rawQuery('''
  SELECT contrasena FROM usuarios WHERE usuario = '$username' and password = '$password'
  ''');

  user = usuario.toString();
  pass = contrasena.toString();
}