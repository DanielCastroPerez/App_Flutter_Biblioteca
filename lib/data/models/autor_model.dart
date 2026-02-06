import 'package:biblioteca_mejorada/domain/entities/autor.dart';

class AutorModel extends AutorEntity {
  AutorModel({required super.id, required super.nombre, required super.pais});

  factory AutorModel.fromJson(Map<String, dynamic> json) {
    return AutorModel(
      id: json["id"],
      nombre: json["nombre"],
      pais: json["pais"],
    );
  }

  Map<String, dynamic> toJson() => {"id": id, "nombre": nombre, "pais": pais};
}

// Models

// Los modelos representan la estructura real de los datos externos (API).
// Se encargan de convertir JSON ↔ objeto. 
// Usas herencia (polimorfismo)