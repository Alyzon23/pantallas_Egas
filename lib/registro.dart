import 'package:flutter/material.dart';

class RegistroScreen extends StatefulWidget {
  @override
  _RegistroScreenState createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fechaNacimientoController = TextEditingController();

  String? _cedula, _nombres, _apellidos, _estadoCivil;
  DateTime? _fechaNacimiento;
  int? _edad;
  String _genero = 'Masculino';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de Registro'),
        backgroundColor: Colors.purple[300],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Registro de Usuario',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[700],
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildTextFormField('Cédula', (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese su cédula';
                    }
                    return null;
                  }, (value) {
                    _cedula = value;
                  }),
                  SizedBox(height: 10),
                  _buildTextFormField('Nombres', (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese sus nombres';
                    }
                    return null;
                  }, (value) {
                    _nombres = value;
                  }),
                  SizedBox(height: 10),
                  _buildTextFormField('Apellidos', (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese sus apellidos';
                    }
                    return null;
                  }, (value) {
                    _apellidos = value;
                  }),
                  SizedBox(height: 10),
                  _buildDatePicker('Fecha de nacimiento', _fechaNacimientoController, (pickedDate) {
                    setState(() {
                      _fechaNacimiento = pickedDate;
                      _fechaNacimientoController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                      _edad = DateTime.now().year - pickedDate.year;
                    });
                  }),
                  SizedBox(height: 10),
                  _buildTextFormField('Edad', null, null, readOnly: true, controller: TextEditingController(text: _edad != null ? _edad.toString() : '')),
                  SizedBox(height: 10),
                  _buildDropdown('Género', _genero, ['Masculino', 'Femenino', 'Otro'], (newValue) {
                    setState(() {
                      _genero = newValue!;
                    });
                  }),
                  SizedBox(height: 10),
                  _buildDropdown('Estado Civil', _estadoCivil, ['Soltero', 'Casado', 'Divorciado', 'Viudo'], (newValue) {
                    setState(() {
                      _estadoCivil = newValue!;
                    });
                  }),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            // Aquí puedes manejar el envío de los datos.
                          }
                        },
                        child: Text('Siguiente'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Salir'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(String label, String? Function(String?)? validator, void Function(String?)? onSaved, {bool readOnly = false, TextEditingController? controller}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.purple),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.purple),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.purple, width: 2.0),
        ),
      ),
      validator: validator,
      onSaved: onSaved,
      readOnly: readOnly,
      controller: controller,
    );
  }

  Widget _buildDatePicker(String label, TextEditingController controller, Function(DateTime) onDateSelected) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.purple),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.purple),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.purple, width: 2.0),
        ),
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          onDateSelected(pickedDate);
        }
      },
    );
  }

  Widget _buildDropdown(String label, String? value, List<String> items, Function(String?)? onChanged) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.purple),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.purple),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.purple, width: 2.0),
        ),
      ),
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
  
  DateFormat(String s) {}
}
