import 'package:flutter/material.dart';
import 'GestionCitasScreen.dart'; // Importa la pantalla de gestión de citas.
import 'EstadoServiciosScreen.dart'; // Asegúrate de que es el archivo que contiene tu clase completa de EstadoServiciosScreen

class PantallaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F7FA),
      appBar: AppBar(
        title: const Text('Pantalla Principal - Administrador'),
        backgroundColor: const Color(0xFF0277BD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  CardItem(
                    title: 'Gestión de Citas',
                    description: 'Ver, agregar, eliminar o reprogramar citas.',
                    icon: Icons.event,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GestionCitasScreen()),
                      );
                    },
                  ),
                  CardItem(
                    title: 'Estado de Servicios',
                    description: 'Ver el estado de todos los servicios.',
                    icon: Icons.build,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EstadoServiciosScreen()),
                      );
                    },
                  ),
                  CardItem(
                    title: 'Reportes',
                    description: 'Acceso a reportes de ingresos y rentabilidad.',
                    icon: Icons.bar_chart,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReportesScreen()),
                      );
                    },
                  ),
                  CardItem(
                    title: 'Gestión de Empleados',
                    description: 'Ver, editar, eliminar o agregar empleados.',
                    icon: Icons.group,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GestionEmpleadosScreen()),
                      );
                    },
                  ),
                  CardItem(
                    title: 'Estadísticas Generales',
                    description: 'Ver estadísticas de servicios e ingresos.',
                    icon: Icons.insert_chart,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EstadisticasGeneralesScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget de Tarjeta Reutilizable con estilo y colores frescos
class CardItem extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const CardItem({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(20),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF0277BD).withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: const Color(0xFF0277BD), size: 30),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xFF0277BD),
          ),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(
            color: Colors.black54,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFF0277BD)),
        onTap: onTap,
      ),
    );
  }
}

// Pantallas de ejemplo sin la clase EstadoServiciosScreen, ya que la estás importando externamente
class ReportesScreen extends StatelessWidget {
  const ReportesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reportes')),
      body: const Center(child: Text('Aquí puedes ver los reportes.')),
    );
  }
}

class GestionEmpleadosScreen extends StatelessWidget {
  const GestionEmpleadosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gestión de Empleados')),
      body: const Center(child: Text('Aquí puedes gestionar los empleados.')),
    );
  }
}

class EstadisticasGeneralesScreen extends StatelessWidget {
  const EstadisticasGeneralesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Estadísticas Generales')),
      body: const Center(child: Text('Aquí puedes ver las estadísticas generales.')),
    );
  }
}



