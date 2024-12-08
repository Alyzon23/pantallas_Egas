import 'package:flutter/material.dart';
import 'bienvenida.dart';
import 'login.dart';
import 'registro.dart';
import 'descripcion.dart';
import 'opciones.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegabilidad del Proyecto',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        brightness: Brightness.light,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.pink[900]),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.pinkAccent,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => BienvenidaScreen(),
        '/login': (context) => LoginScreen(),
        '/registro': (context) => RegistroScreen(),
        '/descripcion': (context) => DescripcionScreen(),
        '/opciones': (context) => OpcionesScreen(),
      },
    );
  }
}
