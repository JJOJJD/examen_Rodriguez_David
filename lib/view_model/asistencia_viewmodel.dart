import 'package:flutter/material.dart';
import '../model/asistencia_model.dart';

class AsistenciaViewModel extends ChangeNotifier {
  String estadoSeleccionado = 'Presencial';

  void cambiarModalidad(String nueva) {
    estadoSeleccionado = nueva;
    notifyListeners();
  }

  AsistenciaModelo calcular(int totalClases, int asistencias) {
    double porcentaje = (asistencias / totalClases) * 100;
    String estado = '';

    if (porcentaje >= 80) {
      estado = 'Habilitado';
    } else if (porcentaje >= 70) {
      estado = 'En advertencia';
    } else {
      estado = 'No habilitado';
    }

    return AsistenciaModelo(
      totalClases: totalClases,
      asistencias: asistencias,
      porcentaje: double.parse(porcentaje.toStringAsFixed(1)),
      estado: estado,
    );
  }
}

