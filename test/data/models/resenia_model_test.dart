import 'package:biblioteca_mejorada/data/models/resenias_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("ReseniasModel | Test", () {
    test("ReseniasModel | Convierte de json a modelo", () {
      // arange (Prepara los datos mock)
      final model = {
        "id": 1,
        "usuario": "Rodri",
        "comentario": "Excelente libro para mejorar como programador.",
        "calificacion": 5,
      };

      // act (Ejecuta la accion, crea una instancia)
      final modelJs = ReseniasModel.fromJson(model);

      // assert (Valida datos) 
      expect(modelJs, isA<ReseniasModel>());
      expect(modelJs.id, 1);
      expect(modelJs.usuario, "Rodri");
      expect(modelJs.calificacion, 5);
      expect(modelJs.comentario, "Excelente libro para mejorar como programador.");
       
    });

    test("ReseniasModel | Convertir de json a modelo", () {
      // arrange (Prepara datos, mock)
      final model2 = ReseniasModel(
        id: 1,
        usuario: "Rodri",
        comentario: "Excelente libro para mejorar como programador.",
        calificacion: 5,
      );
      // act( Ejecuta la accion crea una isntancia)
      final json = model2.toJson();

      //assert (Valida datos) opcion 1
      // expect(json["id"], 1);
      // expect(json["comentario"], "Excelente libro para mejorar como programador.");
      // expect(json["calificacion"], 5);

      // assert ( Valida datos) opcion 2
      expect(json, {
        "id": 1,
        "usuario": "Rodri",
        "comentario": "Excelente libro para mejorar como programador.",
        "calificacion": 5,
      });

    });
  });
}
