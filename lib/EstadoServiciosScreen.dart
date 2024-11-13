import 'package:flutter/material.dart';

class EstadoServiciosScreen extends StatefulWidget {
  const EstadoServiciosScreen({Key? key}) : super(key: key); // Agregado 'key' en el constructor

  @override
  _EstadoServiciosScreenState createState() => _EstadoServiciosScreenState();
}

class _EstadoServiciosScreenState extends State<EstadoServiciosScreen> {
  List<Map<String, String>> servicios = [
    {"titulo": "Instalación de aire acondicionado", "estado": "Pendiente"},
    {"titulo": "Revisión de sistema", "estado": "En progreso"},
    {"titulo": "Mantenimiento preventivo", "estado": "Completado"},
  ];

  void _cambiarEstado(int index) {
    setState(() {
      if (servicios[index]["estado"] == "Pendiente") {
        servicios[index]["estado"] = "En progreso";
      } else if (servicios[index]["estado"] == "En progreso") {
        servicios[index]["estado"] = "Completado";
      }
    });
  }

  void _agregarServicio(String titulo) {
    setState(() {
      servicios.add({"titulo": titulo, "estado": "Pendiente"});
    });
  }

  void _eliminarServicio(int index) {
    setState(() {
      servicios.removeAt(index);
    });
  }

  void _mostrarDialogoAgregarServicio() {
    String tituloNuevoServicio = "";

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Agregar Nuevo Servicio"),
        content: TextField(
          decoration: const InputDecoration(labelText: "Título del servicio"),
          onChanged: (value) => tituloNuevoServicio = value,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              if (tituloNuevoServicio.isNotEmpty) {
                _agregarServicio(tituloNuevoServicio);
              }
              Navigator.pop(context);
            },
            child: const Text("Agregar"),
          ),
        ],
      ),
    );
  }

  Color _colorEstado(String estado) {
    switch (estado) {
      case "Pendiente":
        return Colors.orange;
      case "En progreso":
        return Colors.blue;
      case "Completado":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estado de Servicios'),
        backgroundColor: const Color(0xFF0277BD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: servicios.length,
                itemBuilder: (context, index) {
                  final servicio = servicios[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: Icon(
                        Icons.build,
                        color: _colorEstado(servicio["estado"]!),
                      ),
                      title: Text(
                        servicio["titulo"]!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "Estado: ${servicio["estado"]}",
                        style: TextStyle(color: _colorEstado(servicio["estado"]!)),
                      ),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'Cambiar estado') {
                            _cambiarEstado(index);
                          } else if (value == 'Eliminar') {
                            _eliminarServicio(index);
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                          const PopupMenuItem<String>(value: 'Cambiar estado', child: Text('Cambiar estado')),
                          const PopupMenuItem<String>(value: 'Eliminar', child: Text('Eliminar')),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _mostrarDialogoAgregarServicio,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0277BD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text(
                "Agregar Nuevo Servicio",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
