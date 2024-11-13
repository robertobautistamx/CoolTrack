import 'package:flutter/material.dart';

class EstadisticasGeneralesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estadísticas Generales'),
        backgroundColor: Color(0xFF0277BD),
      ),
      body: Center(
        child: Text(
          'Aquí puedes ver las estadísticas generales.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
