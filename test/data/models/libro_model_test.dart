import 'package:biblioteca_mejorada/data/models/libro_model.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('LibroModel', () {
    test('fromJson crea un objeto válido con autor, categorias y reseñas', () {
      final json = {
        "id": 1,
        "titulo": "Prueba Code",
        "año": 2008,
        "genero": "Programación",
        "autor": {
          "id": 10,
          "nombre": "Daniel Castro",
          "pais": "Estados Unidos"
        },
        "categorias": [
          {"id": 1, "nombre": "Desarrollo"},
          {"id": 2, "nombre": "Buenas prácticas"}
        ],
        "reseñas": []
      };

      final libro = LibroModel.fromJson(json);

      expect(libro.id, 1);
      expect(libro.titulo, "Prueba Code");
      expect(libro.autor.nombre, "Daniel Castro");
      expect(libro.categorias.length, 2);
      expect(libro.resenias.isEmpty, true);
    });

    test('toJson regresa un mapa válido', () {
      final libro = LibroModel(
        id: 1,
        titulo: "Prueba Code",
        anio: 2008,
        genero: "Programación",
        autor: AutorModel(id: 10, nombre: "Daniel Castro", pais: "Estados Unidos"),
        categorias: [
          CategoriaModel(id: 1, nombre: "Desarrollo"),
          CategoriaModel(id: 2, nombre: "Buenas prácticas"),
        ],
        resenias: [],
      );

      final json = libro.toJson();

      expect(json["id"], 1);
      expect(json["titulo"], "Prueba Code");
      expect(json["autor"]["nombre"], "Daniel Castro");
      expect((json["categorias"] as List).length, 2);
    });
  });
}