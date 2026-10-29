import 'package:flutter/material.dart';

class InicioPantalla extends StatelessWidget {
  const InicioPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.school,
                color: Colors.blue,
                size: 60,
              ),
              const SizedBox(height: 10),
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text('Sistema de Asistencia'),
                      SizedBox(height: 10),
                      Text('Estudiante: David Rodriguez'),
                      SizedBox(height: 5),
                      Text('Control de Asistencia Estudiantil'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/principal');
                },
                child: const Text('Ingresar al Sistema'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
