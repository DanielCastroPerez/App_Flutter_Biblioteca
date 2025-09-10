import 'package:biblioteca_mejorada/data/models/libro_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CategoriaModel', () {
    test('fromJson crea un CategoriaModel válido', () {
      final json = {"id": 1, "nombre": "Desarrollo"};

      final categoria = CategoriaModel.fromJson(json);

      expect(categoria.id, 1);
      expect(categoria.nombre, "Desarrollo");
    });

    test('toJson regresa un mapa válido', () {
      final categoria = CategoriaModel(id: 1, nombre: "Desarrollo");

      final json = categoria.toJson();

      expect(json["id"], 1);
      expect(json["nombre"], "Desarrollo");
    });
  });
}
