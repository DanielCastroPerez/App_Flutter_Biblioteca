import 'package:biblioteca_mejorada/domain/entities/libro_entity.dart';

class LibroModel extends LibroEntity {
  const LibroModel({
    required super.id,
    required super.titulo,
    required super.anioPublicacion,
    required super.genero,
    required super.autor,
    required super.categorias,
    required super.resenias,
  });

  factory LibroModel.fromJson(Map<String, dynamic> json) {
    return LibroModel(
      id: json["id"],
      titulo: json["titulo"],
      anioPublicacion: json["año"],
      genero: json["genero"],

      autor: AutorModel.fromJson(json["autor"]),

      categorias: (json["categorias"] as List)
          .map((e) => CategoriaModel.fromJson(e))
          .toList(),

      resenias: (json["reseñas"] as List)
          .map(
            (e) => ReseniasEntity(
              id: e["id"],
              usuarios: e["usuarios"],
              comentarios: e["comentarios"],
              calificacion: e["calificacion"],
            ),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "titulo": titulo,
    "año": anioPublicacion,
    "genero": genero,
    "autor": (autor as AutorModel).toJson(),
    "categorias": categorias
        .map((c) => (c as CategoriaModel).toJson())
        .toList(),
    "reseñas": resenias.map((r) => (r as ReseniasModel).toJson()).toList(),
  };

  /// Convierte Modelo → Entidad
  LibroEntity toEntity() => LibroEntity(
    id: id,
    titulo: titulo,
    anioPublicacion: anioPublicacion,
    genero: genero,
    autor: autor,
    categorias: categorias,
    resenias: resenias,
  );

  /// Convierte Entidad → Modelo

  factory LibroModel.fromEntity( LibroEntity entity){
    return LibroModel(
      id: entity.id,
      titulo: entity.titulo,
      anioPublicacion:  entity.anioPublicacion,
      genero: entity.genero,
      autor: AutorModel.fromEntity(entity.autor),
      categorias: entity.categorias.map((e)=> CategoriaModel.fromEntity((e))).toList(),
      resenias: entity.resenias.map((e) => ReseniasModel.fromEntity(e)).toList(),
    );
  }
}

class AutorModel extends AutorEntity {
  const AutorModel({
    required super.id,
    required super.nombre,
    required super.pais,
  });

  factory AutorModel.fromJson(Map<String, dynamic> json) {
    return AutorModel(
      id: json["id"],
      nombre: json["nombre"],
      pais: json["pais"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "nombre": nombre, "pais": pais};
  }

  /// Convierte Modelo → Entidad
  AutorEntity toEntity() => AutorEntity(id: id, nombre: nombre, pais: pais); 
  // entiendo que mandamos a llamar a AutorEntity oara convertirlo a entidad con toEntity() y retornaremos una nueva instancia de AutorEntity con sus atributos
  // el id con el id del modelo, nombre con el nombre del modelo 

  /// Convierte Entidad → Modelo
  factory AutorModel.fromEntity(AutorEntity entity) {
    // aqui factory lo usamos para convertri a  modelo y el .fromEntity es de donde lo convertira y le estamos diciendo que de AutorEntity la entidad
    // al igual que en el toEntity() retornamos una nueva instancia de AutorEntity con sus atributos, aqui retornamos una nueva instancia de AutorModel con sus atributos
    return AutorModel(id: entity.id, nombre: entity.nombre, pais: entity.pais);
  }
  /*       autor: AutorModel.fromEntity(entity.autor),
      categorias: entity.categorias.map((e)=> CategoriaModel.fromEntity((e))).toList(),
      resenias: entity.resenias.map((e) => ReseniasModel.fromEntity(e)).toList(),
      y aqui usamos el map porque categorias y reseñas son listas y tenemos un
 */
}

class CategoriaModel extends CategoriaEntity {
  const CategoriaModel({required super.id, required super.nombre});

  factory CategoriaModel.fromJson(Map<String, dynamic> json) {
    return CategoriaModel(id: json["id"], nombre: json["nombre"]);
  }
  Map<String, dynamic> toJson() => {"id": id, "nombre": nombre};

  /// Convierte Modelo → Entidad
  CategoriaEntity toEntity() => CategoriaEntity(id: id, nombre: nombre);

  /// Convierte Entidad → Modelo
  factory CategoriaModel.fromEntity(CategoriaEntity entitiy) {
    return CategoriaModel(id: entitiy.id, nombre: entitiy.nombre);
  }
}

class ReseniasModel extends ReseniasEntity {
  const ReseniasModel({
    required super.id,
    required super.usuarios,
    required super.comentarios,
    required super.calificacion,
  });

  factory ReseniasModel.fromJson(Map<String, dynamic> json) {
    return ReseniasModel(
      id: json["id"],
      usuarios: json["usuarios"],
      comentarios: json["comentarios"],
      calificacion: json["calificacion"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "usuarios": usuarios,
    "comentarios": comentarios,
    "calificacion": calificacion,
  };

  /// Convierte Modelo → Entidad
  ReseniasEntity toEntity() => ReseniasEntity(
    id: id,
    usuarios: usuarios,
    comentarios: comentarios,
    calificacion: calificacion,
  );

  /// Convierte Entidad → Modelo
  factory ReseniasModel.fromEntity(ReseniasEntity entity) {
    return ReseniasModel(
      id: entity.id,
      usuarios: entity.usuarios,
      comentarios: entity.comentarios,
      calificacion: entity.calificacion,
    );
  }
}
