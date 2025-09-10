class LibroEntity {
  final int id ;
  final String titulo;
  final int anio;
  final String genero;
  final AutorEntity autor; // es un objeto {nombre:"", apellido:""}, no lista [{nombre:"", apellido:""}]
  final List<CategoriaEntity> categorias;
  final List<ReseniasEntity>resenias;

  LibroEntity({
    required this.id,
    required this.titulo,
    required this.anio,
    required this.genero,
    required this.autor,
    required this.categorias,
    required this.resenias,
  });

}

class AutorEntity{
  final int id;
  final String nombre;
  final String pais;

  AutorEntity({
    required this.id,
    required this.nombre,
    required this.pais,
  });
}

class CategoriaEntity{
  final int id;
  final String nombre;

  CategoriaEntity({
    required this.id,
    required this.nombre,
  });
}

class ReseniasEntity{
  final int id;
  final String usuarios;
  final String comentarios;
  final String calificacion;

  ReseniasEntity({
    required this.id,
    required this.usuarios,
    required this.comentarios,
    required this.calificacion,
  });
}


