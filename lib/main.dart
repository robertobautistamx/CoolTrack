import 'package:flutter/material.dart';
import 'PantallaInicioSesion.dart'; // Asegúrate de importar la pantalla de inicio de sesión.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicación de Refrigeración',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PantallaInicioSesion(), // Establece PantallaInicioSesion como pantalla inicial.
      debugShowCheckedModeBanner: false, // Opcional, para quitar la etiqueta de debug
    );
  }
}
