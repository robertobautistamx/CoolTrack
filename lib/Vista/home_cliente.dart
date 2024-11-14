// ignore_for_file: use_super_parameters, use_build_context_synchronously

import 'package:cool_track/Controlador/login_controller.dart';
import 'package:cool_track/Widgets/common_app.dart';
import 'package:flutter/material.dart';

class HomeCliente extends StatelessWidget {
  const HomeCliente({Key? key}) : super(key: key);

  void _cerrarSesion(BuildContext context) async {
    await LoginController().logout();
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonApp(
        title: 'Cliente',
        onLogout: () => _cerrarSesion(context),
      ),
      body: const Center(
        child: Text(
          'Bienvenido, Cliente',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
