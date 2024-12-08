
import 'package:flutter/material.dart';

class BienvenidaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenida'),
        backgroundColor: Colors.pink[300],
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            tooltip: 'Bienvenida',
          ),
          IconButton(
            icon: Icon(Icons.description),
            onPressed: () {
              Navigator.pushNamed(context, '/descripcion');
            },
            tooltip: 'Descripción',
          ),
          IconButton(
            icon: Icon(Icons.login),
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            tooltip: 'Login',
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/opciones');
            },
            tooltip: 'Opciones',
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink[50]!, Colors.pink[200]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/flor.jpg',
                height: 180,
              ),
              SizedBox(width: 20), // Espacio entre la imagen y el texto
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '¡Bienvenido a Nuestra App!',
                    style: TextStyle(fontSize: 24, color: Colors.pink[900]),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text('Ir a Login'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
