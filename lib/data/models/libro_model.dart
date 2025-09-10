import 'package:biblioteca_mejorada/domain/entities/libro_entity.dart';

class LibroModel extends LibroEntity {
  LibroModel({
    required super.id,
    required super.titulo,
    required super.anio,
    required super.genero,
    required super.autor,
    required super.categorias,
    required super.resenias,
  });

  factory LibroModel.fromJson(Map<String, dynamic> json) {
    return LibroModel(
      id: json["id"],
      titulo: json["titulo"],
      anio: json["año"],
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
    "año": anio,
    "genero":genero,
    "autor": (autor as AutorModel).toJson(),
    "categorias": categorias.map((c) => (c as CategoriaModel).toJson()).toList(),
    "reseñas": resenias.map((r) => (r as ReseniasModel).toJson()).toList(),
  };
}

class AutorModel extends AutorEntity {
  AutorModel({required super.id, required super.nombre, required super.pais});

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
}

class CategoriaModel extends CategoriaEntity {
  CategoriaModel({required super.id, required super.nombre});

  factory CategoriaModel.fromJson(Map <String,dynamic> json){
    return CategoriaModel(
      id: json["id"],
      nombre:json["nombre"],
    );
  }
  Map <String,dynamic> toJson()=>{
    "id": id,
    "nomnombre":nombre,
  };
}

class ReseniasModel extends ReseniasEntity {
  ReseniasModel({
    required super.id,
    required super.usuarios,
    required super.comentarios,
    required super.calificacion,
  });

  factory ReseniasModel.fromJson(Map<String,dynamic> json){
    return ReseniasModel(
      id:json["id"],
      usuarios: json["usuarios"],
      comentarios: json["comentarios"],
      calificacion: json["calificacion"],
    );
  }

  Map <String,dynamic> toJson()=>{
    "id":id,
    "usuarios":usuarios,
    "comentarios":comentarios,
    "calificacion": calificacion,
  };
}
