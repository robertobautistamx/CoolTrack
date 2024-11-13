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
