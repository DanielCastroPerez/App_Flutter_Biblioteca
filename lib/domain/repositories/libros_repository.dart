import 'package:biblioteca_mejorada/domain/entities/libro_entity.dart';

abstract class LibrosRepository {
  Future<List<LibroEntity>> getAllLibros(); // recibo una lista de LibroEntity [{ ... libro 1 ... },{ ... libro 2 ... }]
  Future<LibroEntity> getLibroById(int id); // [ LibroEntity(), LibroEntity(), LibroEntity() ]
  Future<LibroEntity> createLibro(LibroEntity libro);
  Future<LibroEntity> updateLibro(int id, LibroEntity libro);
  Future<bool> deleteLibro(int id);
}

// En el FUTURO (por eso es Future)
// Cuando se ejecute este método
// Debo devolver una lista (List)
// De entidades (LibroEntity)
