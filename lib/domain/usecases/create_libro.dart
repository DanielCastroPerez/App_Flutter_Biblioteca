import 'package:biblioteca_mejorada/domain/entities/libro_entity.dart';
import 'package:biblioteca_mejorada/domain/repositories/libros_repository.dart';

class CreateLibroUseCase{
  final LibrosRepository repository;
  CreateLibroUseCase({
    required this.repository
  });

  Future <LibroEntity> call(LibroEntity libro) async{
    return await repository.createLibro(libro);

  }
}


// Use Cases

// Los casos de uso orquestan una acción del negocio.
// Cada caso de uso representa una intención clara.
