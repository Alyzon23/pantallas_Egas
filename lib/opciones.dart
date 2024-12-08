import 'package:flutter/material.dart';

class OpcionesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opciones'),
        backgroundColor: Colors.orange[300],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange[50]!, Colors.orange[200]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Opciones',
                style: TextStyle(fontSize: 24, color: Colors.orange[900]),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                child: Text('Volver a Bienvenida'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
