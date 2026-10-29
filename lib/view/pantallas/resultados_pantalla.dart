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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.blue,
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
