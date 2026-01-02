import 'package:biblioteca_mejorada/data/models/autor_model.dart';
import 'package:biblioteca_mejorada/data/models/categoria_moder.dart';
import 'package:biblioteca_mejorada/data/models/libro_model.dart';
import 'package:biblioteca_mejorada/data/models/resenias_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Tester LibroModel", () {
    test("LibroModel: tiene que devolver un modelo (objeto)", () {
      //arrange (simulo un json que viene del backend )
      final model = {
        "id": 1,
        "titulo": "Clean Code",
        "año": 2022,
        "genero": "Programación",
        "autor": {"id": 1, "nombre": "Robert", "pais": "USA"},
        "categorias": [
          {"id": 1, "nombre": "Dev"},
          {"id": 2, "nombre": "Desarrollo"},
        ],
        "reseñas": [
          {
            "id": 1,
            "usuario": "Luis",
            "comentario": "Buen libro",
            "calificacion": 5,
          },
          {
            "id": 2,
            "usuario": "Erend",
            "comentario": "Exelente libro para aprender",
            "calificacion": 10,
          },
        ],
      };

      // ACT( creo instancia para convertirlo a objeto)
      final libro = LibroModel.fromJson(model);

      // assert (Valido datos del objeto)
      // LibroModel
      expect(libro.id, 1);
      expect(libro.titulo, "Clean Code");
      expect(libro.anio, 2022);
      expect(libro.genero, "Programación");
      // Autor
      expect(libro.autor.id, 1);
      expect(libro.autor.nombre, "Robert");
      expect(libro.autor.pais, "USA");
      // Categorias
      expect(libro.categorias.length, 2);
      expect(libro.categorias[0].id, 1);
      expect(libro.categorias[0].nombre, "Dev");
      expect(libro.categorias[1].nombre, "Desarrollo");
      //Reseñas
      expect(libro.resenias.length, 2);
      expect(libro.resenias[0].id, 1);
      expect(libro.resenias[0].usuario, "Luis");
      expect(libro.resenias[0].comentario, "Buen libro");
      expect(libro.resenias[0].calificacion, 5);

      expect(libro.resenias[1].id, 2);
      expect(libro.resenias[1].usuario, "Erend");
      expect(libro.resenias[1].comentario, "Exelente libro para aprender");
      expect(libro.resenias[1].calificacion, 10);
    });

    test("toJson Se testea de json a modelo", () {
      final model_2 = LibroModel(
        id: 1,
        titulo: "Clean Code",
        anio: 2022,
        genero: "Programación",
        autor: AutorModel(id: 1, nombre: "Robert", pais: "USA"),
        categorias: [CategoriaModel(id: 1, nombre: "Dev")],
        resenias: [
          ReseniasModel(
            id: 1,
            usuario: "Luis",
            comentario: "Buen libro",
            calificacion: 9,
          ),
          ReseniasModel(
            id: 2,
            usuario: "Erend",
            comentario: "Exelente libro para aprender",
            calificacion: 10,
          ),
        ],
      );

      final json = model_2.toJson(); //
      expect(json["id"], 1);
      expect(json["titulo"], "Clean Code");
      expect(json["autor"]["nombre"], "Robert");
      expect((json["categorias"] as List).length, 1);
      expect((json["reseñas"] as List).first["usuario"], "Luis");
    });
  });
}