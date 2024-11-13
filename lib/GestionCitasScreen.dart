import 'package:flutter/material.dart';

class GestionCitasScreen extends StatefulWidget {
  @override
  _GestionCitasScreenState createState() => _GestionCitasScreenState();
}

class _GestionCitasScreenState extends State<GestionCitasScreen> {
  List<Map<String, dynamic>> citas = [
    {"id": 1, "titulo": "Mantenimiento AC", "fecha": "2024-01-15", "estado": "Pendiente"},
    {"id": 2, "titulo": "Instalación de AC", "fecha": "2024-01-20", "estado": "En Progreso"},
    {"id": 3, "titulo": "Revisión de sistema", "fecha": "2024-01-22", "estado": "Completada"},
  ];

  void agregarCita(String titulo, String fecha) {
    setState(() {
      citas.add({"id": citas.length + 1, "titulo": titulo, "fecha": fecha, "estado": "Pendiente"});
    });
  }

  void eliminarCita(int id) {
    setState(() {
      citas.removeWhere((cita) => cita['id'] == id);
    });
  }

  void cambiarEstado(int id, String nuevoEstado) {
    setState(() {
      citas.firstWhere((cita) => cita['id'] == id)['estado'] = nuevoEstado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de Citas'),
        backgroundColor: Color(0xFF0277BD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: citas.length,
                itemBuilder: (context, index) {
                  final cita = citas[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: Icon(
                        Icons.calendar_today,
                        color: Color(0xFF0277BD),
                      ),
                      title: Text(
                        cita['titulo'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Fecha: ${cita['fecha']}"),
                          Text("Estado: ${cita['estado']}", style: TextStyle(color: _colorEstado(cita['estado']))),
                        ],
                      ),
                      trailing: PopupMenuButton<String>(
                        onSelected: (String nuevoEstado) {
                          cambiarEstado(cita['id'], nuevoEstado);
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                          const PopupMenuItem<String>(value: "Pendiente", child: Text('Pendiente')),
                          const PopupMenuItem<String>(value: "En Progreso", child: Text('En Progreso')),
                          const PopupMenuItem<String>(value: "Completada", child: Text('Completada')),
                        ],
                      ),
                      onTap: () {
                        // Detalles de la cita o edición de cita
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(cita['titulo']),
                            content: Text("Detalles de la cita:\nFecha: ${cita['fecha']}\nEstado: ${cita['estado']}"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Cerrar"),
                              ),
                              TextButton(
                                onPressed: () {
                                  eliminarCita(cita['id']);
                                  Navigator.pop(context);
                                },
                                child: Text("Eliminar", style: TextStyle(color: Colors.red)),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0277BD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              onPressed: () {
                // Agregar nueva cita
                _mostrarDialogoAgregarCita(context);
              },
              child: Text("Agregar Nueva Cita", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  // Diálogo para agregar una nueva cita
  void _mostrarDialogoAgregarCita(BuildContext context) {
    String titulo = "";
    String fecha = "";

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Nueva Cita"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Título de la Cita"),
              onChanged: (value) => titulo = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Fecha (AAAA-MM-DD)"),
              onChanged: (value) => fecha = value,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              if (titulo.isNotEmpty && fecha.isNotEmpty) {
                agregarCita(titulo, fecha);
                Navigator.pop(context);
              }
            },
            child: Text("Agregar"),
          ),
        ],
      ),
    );
  }

  // Función para asignar color según el estado de la cita
  Color _colorEstado(String estado) {
    switch (estado) {
      case "Pendiente":
        return Colors.orange;
      case "En Progreso":
        return Colors.blue;
      case "Completada":
        return Colors.green;
      default:
        return Colors.black;
    }
  }
}

