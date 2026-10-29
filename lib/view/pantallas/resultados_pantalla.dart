import 'package:flutter/material.dart';
import '../../model/asistencia_model.dart';

class ResultadosPantalla extends StatelessWidget {
  const ResultadosPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    final resultado = ModalRoute.of(context)!.settings.arguments as AsistenciaModelo;

    Widget dato(String titulo, String valor) {
      return ListTile(
        title: Text(titulo),
        trailing: Text(valor),
      );
    }

    IconData icono = Icons.check_circle;
    Color colorIcono = Colors.green;

    if (resultado.estado == 'En advertencia') {
      icono = Icons.warning;
      colorIcono = Colors.orange;
    } else if (resultado.estado == 'No habilitado') {
      icono = Icons.cancel;
      colorIcono = Colors.red;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(
              icono,
              color: colorIcono,
              size: 60,
            ),
            const SizedBox(height: 10),
            Card(
              child: Column(
                children: [
                  dato('Total de clases', '${resultado.totalClases}'),
                  dato('Asistencias', '${resultado.asistencias}'),
                  dato('Porcentaje', '${resultado.porcentaje}%'),
                  dato('Estado final', resultado.estado),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Regresar'),
            ),
          ],
        ),
      ),
    );
  }
}
