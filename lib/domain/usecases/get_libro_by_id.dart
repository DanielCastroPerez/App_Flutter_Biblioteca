import 'package:biblioteca_mejorada/domain/entities/libro_entity.dart';
import 'package:biblioteca_mejorada/domain/repositories/libros_repository.dart';

class GetLibroByIdUseCase {
  final LibrosRepository repository;
  // es como python en la variable repositories se trae todo lo de LibrosRepository en este caso sus metodos
  // y cuando usamos repository.getLibroById(id) mandamos a llamar ese metodo y le pasamos su parametro
  GetLibroByIdUseCase({required this.repository});

  Future<LibroEntity> call(int id) async { // El call del Use Case es un [método nuevo], pero su implementación usa métodos del contrato del repositorio.
    // LibroEntity porque domain no debe saber nada de la capa data
    // LibroEntity poruqe es el que tiene toda la informacion
    return await repository.getLibroById(id);
  }
}
