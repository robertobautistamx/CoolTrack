// ignore_for_file: use_super_parameters, library_private_types_in_public_api, unnecessary_nullable_for_final_variable_declarations

import 'package:cool_track/Controlador/service_controller.dart';
import 'package:cool_track/Modelo/service.dart';
import 'package:flutter/material.dart';

class EstadoServicios extends StatefulWidget {
  const EstadoServicios({Key? key}) : super(key: key);

  @override
  _EstadoServiciosState createState() => _EstadoServiciosState();
}

class _EstadoServiciosState extends State<EstadoServicios> {
  final ServicioController _controller = ServicioController();

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
                setState(() {
                  _controller.agregarServicio(tituloNuevoServicio);
                });
              }
              Navigator.pop(context);
            },
            child: const Text("Agregar"),
          ),
        ],
      ),
    );
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
                itemCount: _controller.servicios.length,
                itemBuilder: (context, index) {
                  final Service servicio = _controller.servicios[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: Icon(
                        Icons.build,
                        color: ServicioController.colorEstado(servicio.estado),
                      ),
                      title: Text(
                        servicio.titulo,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "Estado: ${servicio.estado}",
                        style: TextStyle(
                            color: ServicioController.colorEstado(
                                servicio.estado)),
                      ),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          setState(() {
                            if (value == 'Cambiar estado') {
                              _controller.cambiarEstado(index);
                            } else if (value == 'Eliminar') {
                              _controller.eliminarServicio(index);
                            }
                          });
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          const PopupMenuItem<String>(
                              value: 'Cambiar estado',
                              child: Text('Cambiar estado')),
                          const PopupMenuItem<String>(
                              value: 'Eliminar', child: Text('Eliminar')),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
