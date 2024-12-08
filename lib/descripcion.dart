import 'package:flutter/material.dart';

class DescripcionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Descripción del Proyecto'),
        backgroundColor: Colors.teal[300],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal[50]!, Colors.teal[200]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Descripción del Proyecto',
                  style: TextStyle(fontSize: 24, color: Colors.teal[900]),
                ),
                SizedBox(height: 20),
                Text(
                  'Este proyecto tiene como objetivo desarrollar una aplicación móvil de 5 pantallas donde contenga rutas de navegacion de manera rápida y eficiente. La aplicación está diseñada para ser intuitiva y fácil de usar, proporcionando resultados precisos y confiables.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 1, 16, 15)),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/opciones');
                  },
                  child: Text('Ir a Opciones'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
