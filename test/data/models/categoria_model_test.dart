import 'package:biblioteca_mejorada/data/models/categoria_moder.dart';
import 'package:biblioteca_mejorada/data/models/libro_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("CategoriaModel | Tests", () {
    test("fromJson convierte un json (mapa) a un modelo CategoriaModel", () {
      // ARRANGE: simulo un json que viene del backend
      final json = {"id": 1, "nombre": "Developer"};

      // ACT: convierto el mapa en un objeto CategoriaModel
      final categoria = CategoriaModel.fromJson(json);

      // ASSERT: verifico que los datos se hayan asignado bien
      expect(categoria.id, 1);
      expect(categoria.nombre, "Developer");
    });

    test("toJson convierte un objeto CategoriaModel a json (mapa)", () {
      // ARRANGE
      final categoria = CategoriaModel(id: 1, nombre: "Developer");

      // ACT
      final json = categoria.toJson();

      // ASSERT
      expect(json, {"id": 1, "nombre": "Developer"});
    });
  });
}
