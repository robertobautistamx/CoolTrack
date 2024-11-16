// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:cool_track/Controlador/login_controller.dart';
import 'package:cool_track/Vista/home_admin.dart';
import 'package:cool_track/Vista/home_cliente.dart';
import 'package:cool_track/Vista/home_empleado.dart';
import 'package:flutter/material.dart';

class RolHome extends StatefulWidget {
  const RolHome({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RolHomeState createState() => _RolHomeState();
}

class _RolHomeState extends State<RolHome> {
  final LoginController _loginController = LoginController();
  String? _rolUsuario;
  bool _cargando = true;

  @override
  void initState() {
    super.initState();
    _obtenerRol();
  }

  void _obtenerRol() async {
    String? uid = _loginController.currentUser?.uid;
    if (uid != null) {
      String? rol = await _loginController.getUserRole(uid);
      setState(() {
        _rolUsuario = rol;
        _cargando = false;
      });
    } else {
      // Si no hay usuario, redirige al login
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_cargando) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_rolUsuario == 'Administrador') {
      return const HomeAdmin();
    } else if (_rolUsuario == 'Empleado') {
      return const HomeEmpleado();
    } else {
      return const HomeCliente();
    }
  }
}
