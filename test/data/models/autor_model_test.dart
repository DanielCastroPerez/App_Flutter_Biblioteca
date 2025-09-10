import 'package:biblioteca_mejorada/data/models/libro_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AutorModel', () {
    test('fromJson crea un AutorModel válido', () {
      final json = {"id": 10, "nombre": "Daniel Castro", "pais": "Estados Unidos"};

      final autor = AutorModel.fromJson(json);

      expect(autor.id, 10);
      expect(autor.nombre, "Daniel Castro");
      expect(autor.pais, "Estados Unidos");
    });

    test('toJson regresa un mapa válido', () {
      final autor = AutorModel(id: 10, nombre: "Daniel Castro", pais: "Estados Unidos");

      final json = autor.toJson();

      expect(json["id"], 10);
      expect(json["nombre"], "Daniel Castro");
      expect(json["pais"], "Estados Unidos");
    });
  });
}
