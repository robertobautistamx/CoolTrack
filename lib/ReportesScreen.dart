// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';

class ReportesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reportes'),
        backgroundColor: Color(0xFF0277BD),
      ),
      body: Center(
        child: Text(
          'Aquí puedes ver los reportes.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
