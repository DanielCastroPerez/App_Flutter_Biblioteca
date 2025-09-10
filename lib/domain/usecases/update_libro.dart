import 'package:biblioteca_mejorada/domain/entities/libro_entity.dart';
import 'package:biblioteca_mejorada/domain/repositories/libros_repository.dart';

class UpdateLibroUseCase{
  final LibrosRepository repository;

  UpdateLibroUseCase({
    required this.repository,
  });

  Future <LibroEntity> call(int id ,LibroEntity libro) async{
    return await repository.updateLibro(id, libro);
  }
}