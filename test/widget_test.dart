import 'package:flutter_test/flutter_test.dart';
import 'package:examen_rodriguez_david/view_model/asistencia_viewmodel.dart';

void main() {
  test('Calculo de asistencia - Habilitado (>= 80%)', () {
    final vm = AsistenciaViewModel();
    // 20 clases, 18 asistencias = 90%
    final res = vm.calcular(20, 18);
    expect(res.porcentaje, 90.0);
    expect(res.estado, 'Habilitado');
  });

  test('Calculo de asistencia - En advertencia (70% - 79%)', () {
    final vm = AsistenciaViewModel();
    // 20 clases, 15 asistencias = 75%
    final res = vm.calcular(20, 15);
    expect(res.porcentaje, 75.0);
    expect(res.estado, 'En advertencia');
  });

  test('Calculo de asistencia - No habilitado (< 70%)', () {
    final vm = AsistenciaViewModel();
    // 20 clases, 12 asistencias = 60%
    final res = vm.calcular(20, 12);
    expect(res.porcentaje, 60.0);
    expect(res.estado, 'No habilitado');
  });
}
