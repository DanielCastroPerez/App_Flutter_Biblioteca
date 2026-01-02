import 'package:biblioteca_mejorada/domain/entities/libro_entity.dart';
import 'package:biblioteca_mejorada/domain/repositories/libros_repository.dart';

class GetLibrosUseCase {
  final LibrosRepository repository;
  GetLibrosUseCase({required this.repository});

  Future<List<LibroEntity>> call() async {
    return await repository.getAllLibros();
  }
}

