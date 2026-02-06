import 'package:biblioteca_mejorada/domain/entities/libro_entity.dart';
/// Contratos que vienen de la capa de dominio [Future LibroEntity]
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

// Repositories (contratos)
// Los repositories en domain son contratos abstractos.
// Definen qué se puede hacer, no cómo se hace.