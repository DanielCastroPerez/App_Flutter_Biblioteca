import 'package:equatable/equatable.dart';

class LibroEntity extends Equatable {
  final int id;
  final String titulo;
  final int? anioPublicacion;
  // Puede ser nulo porque no siempre se conoce el año de publicación,
  // y no afecta la lógica de negocio.
  final String? genero;
  final AutorEntity autor;
  // Es un objeto único {id, nombre, pais}, no una lista.
  final List<CategoriaEntity> categorias;
  final List<ReseniasEntity> resenias;

  const LibroEntity({
    required this.id,
    required this.titulo,
    this.anioPublicacion,
    this.genero,
    required this.autor,
    required this.categorias,
    required this.resenias,
  });
  
  LibroEntity copyWith({
    int? id,
    String? titulo,
    int? anioPublicacion,
    String? genero,
    AutorEntity? autor,
    List<CategoriaEntity>? categorias,
    List<ReseniasEntity>? resenias,
  }) {
    // Si no se pasa un parámetro, conserva el valor original
    return LibroEntity(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      anioPublicacion: anioPublicacion ?? this.anioPublicacion,
      genero: genero ?? this.genero,
      autor: autor ?? this.autor,
      categorias: categorias ?? this.categorias,
      resenias: resenias ?? this.resenias,
    );
  }

  @override
  List<Object?> get props => [
    id,
    titulo,
    autor,
    anioPublicacion,
    genero,
    categorias,
    resenias,
  ];
}

class AutorEntity extends Equatable {
  final int id;
  final String nombre;
  final String? pais;
  // Puede ser nulo si no se conoce el país, no afecta la lógica.

  const AutorEntity({required this.id, required this.nombre, this.pais});

  AutorEntity copyWith({int? id, String? nombre, String? pais}) {
    return AutorEntity(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      pais: pais ?? this.pais,
    );
  }

  @override
  List<Object?> get props => [id, nombre, pais];
}

class CategoriaEntity extends Equatable {
  final int id;
  final String nombre;

  const CategoriaEntity({required this.id, required this.nombre});

  CategoriaEntity copyWith({int? id, String? nombre}) {
    return CategoriaEntity(id: id ?? this.id, nombre: nombre ?? this.nombre);
  }

  @override
  List<Object?> get props => [id, nombre];
}

class ReseniasEntity extends Equatable {
  final int id;
  final String usuarios;
  final String? comentarios; // Opcional, puede que solo haya calificación
  final String? calificacion; // Opcional, puede que solo haya comentario

  const ReseniasEntity({
    required this.id,
    required this.usuarios,
    this.comentarios,
    this.calificacion,
  });

  ReseniasEntity copyWith({
    int? id,
    String? usuarios,
    String? comentarios,
    String? calificacion,
  }) {
    return ReseniasEntity(
      id: id ?? this.id,
      usuarios: usuarios ?? this.usuarios,
      comentarios: comentarios ?? this.comentarios,
      calificacion: calificacion ?? this.calificacion,
    );
  }

  @override
  List<Object?> get props => [id, usuarios, comentarios, calificacion];
}
