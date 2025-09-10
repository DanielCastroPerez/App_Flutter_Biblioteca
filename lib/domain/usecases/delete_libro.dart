import 'package:biblioteca_mejorada/domain/repositories/libros_repository.dart';

class DeleteLibroUseCase {
  final LibrosRepository repository;
  DeleteLibroUseCase({
    required this.repository
  });

  Future <bool> call(int id) async{
    return await repository.deleteLibro(id);
  }
}