import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Inicio de sesión',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.pink.shade200,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/flor.jpg',
                  height: 180, // Ajuste de tamaño de la imagen
                ),
                SizedBox(height: 40),
                _buildTextField(
                  label: 'Nombre',
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 20),
                _buildTextField(
                  label: 'Email',
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                _buildTextField(
                  label: 'Contraseña',
                  obscureText: true,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/'); // Acción de inicio de sesión
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade200,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text('Iniciar sesión', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/registro'); // Acción de registrarse
                  },
                  child: Text('¿No tienes cuenta? Regístrate',
                      style: TextStyle(color: Colors.pink.shade200, fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, required bool obscureText, required TextInputType keyboardType}) {
    return Container(
      width: 300,
      child: TextField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.pink.shade200),
          hintText: 'Ingresa tu $label',
          hintStyle: TextStyle(color: Colors.grey.shade400),
          filled: true,
          fillColor: Colors.pink.shade50,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.pink.shade200, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.pink.shade300, width: 2),
          ),
        ),
      ),
    );
  }
}
