import 'package:biblioteca_mejorada/data/models/autor_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Tester capa models ", () {
    test("AutorModel:fromJson debe analizarse correctamente", () {
      final jsonModel = {
        "id": 1,
        "nombre": "Robert C. Martin",
        "pais": "Estados Unidos",
      };

      final autor = AutorModel.fromJson(jsonModel);

      expect(autor.id, 1);
      expect(autor.nombre, "Robert C. Martin");
      expect(autor.pais, "Estados Unidos");
    });

    test("AutorModel:toJson regresa un mapa válido", () {
      // arrange (preparar datos)
      final autorModel = AutorModel(
        id: 1,
        nombre: "Robert C. Martin",
        pais: "Estados Unidos",
      );

      // act (ejecutar la acción)
      final json = autorModel.toJson();

      expect(json["id"],1);
      expect(json["nombre"], "Robert C. Martin");
      expect(json["pais"], "Estados Unidos");

      
      // assert (validar resultados) y segunda forma de testear
      expect(json, {
        "id": 1,
        "nombre": "Robert C. Martin",
        "pais": "Estados Unidos",
      });
    });
  });
}
