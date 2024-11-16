// ignore_for_file: use_super_parameters, use_build_context_synchronously

import 'package:cool_track/Controlador/login_controller.dart';
import 'package:cool_track/Vista/estado_servicios.dart';
import 'package:cool_track/Widgets/common_app.dart';
import 'package:flutter/material.dart';

class HomeAdmin extends StatelessWidget {
  const HomeAdmin({Key? key}) : super(key: key);

  void _cerrarSesion(BuildContext context) async {
    await LoginController().logout();
    Navigator.pushReplacementNamed(context, '/');
  }

  Widget _buildCard({
    required BuildContext context,
    required String title,
    required String description,
    required IconData icon,
    required Widget screen,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF0277BD), size: 30),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFF0277BD)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonApp(
        title: 'Administrador',
        onLogout: () => _cerrarSesion(context),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildCard(
            context: context,
            title: 'Gestión de Citas',
            description: 'Ver, agregar, eliminar o reprogramar citas.',
            icon: Icons.event,
            screen: const EstadoServicios(),
          ),
          _buildCard(
            context: context,
            title: 'Estado de Servicios',
            description: 'Ver el estado de todos los servicios.',
            icon: Icons.build,
            screen: const EstadoServicios(),
          ),
          _buildCard(
            context: context,
            title: 'Reportes',
            description: 'Acceso a reportes de ingresos y rentabilidad.',
            icon: Icons.bar_chart,
            screen: const EstadoServicios(),
          ),
          _buildCard(
            context: context,
            title: 'Gestión de Empleados',
            description: 'Ver, editar, eliminar o agregar empleados.',
            icon: Icons.group,
            screen: const EstadoServicios(),
          ),
          _buildCard(
            context: context,
            title: 'Estadísticas Generales',
            description: 'Ver estadísticas de servicios e ingresos.',
            icon: Icons.insert_chart,
            screen: const EstadoServicios(),
          ),
        ],
      ),
    );
  }
}
