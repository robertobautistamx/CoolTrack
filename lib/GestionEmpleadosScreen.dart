// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';

class GestionEmpleadosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de Empleados'),
        backgroundColor: Color(0xFF0277BD),
      ),
      body: Center(
        child: Text(
          'Aquí puedes gestionar los empleados.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
