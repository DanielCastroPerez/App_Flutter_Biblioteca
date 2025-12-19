import 'package:biblioteca_mejorada/domain/entities/autor.dart';
import 'package:biblioteca_mejorada/domain/entities/categoria.dart';
import 'package:biblioteca_mejorada/domain/entities/resenias.dart';

class LibroEntity {
  final int id;
  final String titulo;
  final int anio;
  final String genero;
  final AutorEntity autor;
  final List<CategoriaEntity> categorias;
  final List<ReseniasEntity> resenias;

  const LibroEntity({
    required this.id,
    required this.titulo,
    required this.anio,
    required this.genero,
    required this.autor,
    required this.categorias,
    required this.resenias,
  });
}
