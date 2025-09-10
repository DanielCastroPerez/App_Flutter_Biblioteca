import 'package:biblioteca_mejorada/domain/entities/libro_entity.dart';

abstract class LibrosRepository {

  Future <List<LibroEntity>> getLibros();// recibo una lista de entidades [nombre:{}]
  Future <LibroEntity> getLibroById(int id); // recibo una entidad {nombre:"",apellido:""}
  Future <LibroEntity> createLibro(LibroEntity libro);
  Future <LibroEntity> updateLibro(int id ,LibroEntity libro);
  Future <bool> deleteLibro(int id);
}