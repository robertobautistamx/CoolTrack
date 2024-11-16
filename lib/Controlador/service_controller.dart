import 'package:flutter/material.dart';
import 'package:cool_track/Modelo/service.dart';

class ServicioController {
  List<Service> servicios = [
    Service(titulo: "Instalación de aire acondicionado", estado: "Pendiente"),
    Service(titulo: "Revisión de sistema", estado: "En progreso"),
    Service(titulo: "Mantenimiento preventivo", estado: "Completado"),
  ];

  void cambiarEstado(int index) {
    if (servicios[index].estado == "Pendiente") {
      servicios[index].estado = "En progreso";
    } else if (servicios[index].estado == "En progreso") {
      servicios[index].estado = "Completado";
    }
  }

  void agregarServicio(String titulo) {
    servicios.add(Service(titulo: titulo, estado: "Pendiente"));
  }

  void eliminarServicio(int index) {
    servicios.removeAt(index);
  }

  // Método para obtener el color del estado
  static Color colorEstado(String estado) {
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
}
