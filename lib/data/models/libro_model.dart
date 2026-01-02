import 'package:biblioteca_mejorada/data/models/autor_model.dart';
import 'package:biblioteca_mejorada/data/models/categoria_moder.dart';
import 'package:biblioteca_mejorada/data/models/resenias_model.dart';
import 'package:biblioteca_mejorada/domain/entities/libro_entity.dart';

class LibroModel extends LibroEntity {
  const LibroModel({
    required super.id,
    required super.titulo,
    required super.anio,
    required super.genero,
    required super.autor,
    required super.categorias,
    required super.resenias,
  });

  // factory es un tipo especial de constructor que nos permite crear un objeto de una forma personalizada
  // .fromJson convierte datos en formato JSON (que viene de internet) en un objeto LibroModel que podemos usar en la app
  factory LibroModel.fromJson(Map<String, dynamic> json) {
    // Retorna una nueva instancia (copia) de LibroModel con los datos del JSON organizados
      return LibroModel(
      id: json["id"],
      titulo: json["titulo"],
      anio: json["año"], // el JSON dice "año" pero nosotros lo guardamos como "anio" en la app
      genero: json["genero"],
      // autor es un objeto dentro del JSON, así que usamos AutorModel.fromJson para convertirlo en un objeto AutorModel
      autor: AutorModel.fromJson(json["autor"]),

      // categorias es una lista de objetos en el JSON
      // "as List" le dice: "trata esto como una lista"
      // .map() recorre cada elemento (e) de la lista
      // CategoriaModel.fromJson(e) convierte cada elemento en un objeto CategoriaModel
      // .toList() convierte el resultado de vuelta a una lista normal
      categorias: (json["categorias"] as List)
          .map((e) => CategoriaModel.fromJson(e))
          .toList(),
          
      // resenias es también una lista de objetos, pero aquí lo hacemos de forma diferente
      // "as List" convierte a lista
      // .map() recorre cada elemento (d) de la lista
      // Para cada elemento d, creamos un objeto ReseniasModel extrayendo sus propiedades individuales (id, usuario, comentario, calificacion)
      // .toList() al final convierte todo a una lista normal
      resenias: (json["reseñas"] as List)
          .map(
            (d) => ReseniasModel(
              id: d["id"],
              usuario: d["usuario"],
              comentario: d["comentario"],
              calificacion: d["calificacion"],
            ),
          )
          .toList(),
    );
  }

  // toJson() es lo contrario a fromJson: convierte un objeto LibroModel en un mapa JSON
  // Esto es útil cuando queremos enviar datos a internet o guardarlos
  Map<String, dynamic> toJson() => {
    "id": id,
    "titulo": titulo,
    "año": anio,
    "genero": genero,
    // Convertimos el objeto autor a JSON usando el método toJson() de AutorModel
    "autor": (autor as AutorModel).toJson(),
    // Recorremos la lista de categorias, convertimos cada una a JSON, y guardamos todo en una lista
    // "as CategoriaModel" le dice: trata cada elemento (c) como un objeto CategoriaModel
    // .toJson() convierte ese objeto a un formato que entienda JSON
    // .toList() al final devuelve una lista con todos los objetos convertidos
    "categorias": categorias
        .map((c) => (c as CategoriaModel).toJson()) // Los paréntesis aseguran que primero conviertas "c" a CategoriaModel, y solo después apliques .toJson()
        .toList(),
    // Lo mismo con resenias: convertimos cada reseña a JSON y las guardamos todas en una lista
    "reseñas": resenias.map((r) => (r as ReseniasModel).toJson()).toList(),
  };
}