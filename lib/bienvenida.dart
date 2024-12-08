import 'package:flutter/material.dart';

class BienvenidaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenida'),
        backgroundColor: Colors.pink[300],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink[300],
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Bienvenida'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Login'),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text('Registro de Usuarios'),
              onTap: () {
                Navigator.pushNamed(context, '/registro');
              },
            ),
            ListTile(
              leading: Icon(Icons.description),
              title: Text('Descripción del Proyecto'),
              onTap: () {
                Navigator.pushNamed(context, '/descripcion');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Opciones'),
              onTap: () {
                Navigator.pushNamed(context, '/opciones');
              },
            ),
          ],
        ),
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
                    '¡Bienvenido mi App!',
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
