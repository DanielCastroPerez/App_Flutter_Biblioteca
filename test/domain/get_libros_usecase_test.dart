import 'package:biblioteca_mejorada/domain/entities/libro_entity.dart';
import 'package:biblioteca_mejorada/domain/usecases/get_libros.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('GetLibrosUseCase debería devolver lista de libros', () {
    final useCase = GetLibrosUseCase();
    final libros = useCase();

    expect(libros, isA<List<LibroEntity>>());
  });
}
