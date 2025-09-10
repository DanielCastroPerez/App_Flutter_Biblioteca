// data/repositories/libros_repository_impl.dart

import 'package:biblioteca_mejorada/domain/entities/libro_entity.dart';
import 'package:biblioteca_mejorada/domain/repositories/libros_repository.dart';
import 'package:biblioteca_mejorada/data/datasources/libros_remote_datasource.dart';
import 'package:biblioteca_mejorada/data/models/libro_model.dart';

class LibrosRepositoryImpl implements LibrosRepository {
  final LibrosRemoteDatasource remoteDatasource;

  LibrosRepositoryImpl({required this.remoteDatasource});

  @override
  Future<List<LibroEntity>> getLibros() async {
    final librosModel = await remoteDatasource.getLibros();
    // LibroModel extiende LibroEntity, por eso se puede retornar así directamente
    return librosModel;
  }

  @override
  Future<LibroEntity> getLibroById(int id) async {
    final libroModel = await remoteDatasource.getLibroById(id);
    return libroModel;
  }

  @override
  Future<LibroEntity> createLibro(LibroEntity libro) async {
    // Como libro es una Entity y el datasource espera un Model,
    // aquí lo casteamos (porque en tu diseño LibroModel extiende LibroEntity)
    final libroModel = libro as LibroModel;
    final newLibro = await remoteDatasource.createLibro(libroModel);
    return newLibro;
  }

  @override
  Future<LibroEntity> updateLibro(int id, LibroEntity libro) async {
    final libroModel = libro as LibroModel;
    final updatedLibro = await remoteDatasource.updateLibro(id, libroModel);
    return updatedLibro;
  }

  @override
  Future<bool> deleteLibro(int id) async {
    await remoteDatasource.deleteLibro(id);
    return true;
  }
}
