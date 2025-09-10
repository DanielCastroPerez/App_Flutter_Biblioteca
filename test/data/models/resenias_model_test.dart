import 'package:biblioteca_mejorada/data/models/libro_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ReseniasModel', () {
    test('fromJson crea un ReseniasModel válido', () {
      final json = {
        "id": 3,
        "usuario": "Carlos",
        "comentario": "Excelente libro",
        "calificacion": 5
      };

      final resenia = ReseniasModel.fromJson(json);

      expect(resenia.id, 3);
      expect(resenia.usuarios, "Carlos");
      expect(resenia.comentarios, "Excelente libro");
      expect(resenia.calificacion, 5);
    });

    test('toJson regresa un mapa válido', () {
      final resenia = ReseniasModel(
        id: 3,
        usuarios: "Carlos",
        comentarios: "Excelente libro",
        calificacion: "5",
      );

      final json = resenia.toJson();

      expect(json["id"], 3);
      expect(json["usuario"], "Carlos");
      expect(json["comentario"], "Excelente libro");
      expect(json["calificacion"], 5);
    });
  });
}
