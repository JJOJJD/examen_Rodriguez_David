import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_model/asistencia_viewmodel.dart';
import '../widgets/campo_numero.dart';

class AsistenciaPantalla extends StatefulWidget {
  const AsistenciaPantalla({super.key});

  @override
  State<AsistenciaPantalla> createState() => _AsistenciaPantallaState();
}

class _AsistenciaPantallaState extends State<AsistenciaPantalla> {
  final totalClasesController = TextEditingController();
  final asistenciasController = TextEditingController();
  String mensaje = '';

  void limpiar() {
    totalClasesController.clear();
    asistenciasController.clear();
    setState(() {
      mensaje = '';
    });
  }

  void calcular() {
    String totalTexto = totalClasesController.text;
    String asistenciasTexto = asistenciasController.text;

    if (totalTexto.isEmpty || asistenciasTexto.isEmpty) {
      setState(() {
        mensaje = 'Llene todos los campos';
      });
      return;
    }

    int? total = int.tryParse(totalTexto);
    int? asistencias = int.tryParse(asistenciasTexto);

    if (total == null || asistencias == null || total <= 0) {
      setState(() {
        mensaje = 'Ingrese valores validos mayores a 0';
      });
      return;
    }

    if (asistencias > total) {
      setState(() {
        mensaje = 'Las asistencias no pueden superar el total de clases';
      });
      return;
    }

    if (asistencias < 0) {
      setState(() {
        mensaje = 'Las asistencias no pueden ser negativas';
      });
      return;
    }

    final vm = context.read<AsistenciaViewModel>();
    final resultado = vm.calcular(total, asistencias);

    Navigator.pushNamed(context, '/resultados', arguments: resultado);
  }

  @override
  Widget build(BuildContext context) {
    context.watch<AsistenciaViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculo de Asistencia'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            CampoNumero(
              etiqueta: 'Total de clases impartidas',
              controller: totalClasesController,
            ),
            const SizedBox(height: 10),
            CampoNumero(
              etiqueta: 'Numero de asistencias',
              controller: asistenciasController,
            ),
            const SizedBox(height: 10),
            if (mensaje.isNotEmpty)
              Text(
                mensaje,
                style: const TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: calcular,
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: limpiar,
              child: const Text('Limpiar'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Regresar al Inicio'),
            ),
          ],
        ),
      ),
    );
  }
}

