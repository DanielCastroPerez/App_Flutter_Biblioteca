import 'package:biblioteca_mejorada/domain/entities/resenias.dart';

class ReseniasModel extends ReseniasEntity {
  ReseniasModel({
    required super.id,
    required super.usuario,
    required super.comentario,
    required super.calificacion,
  });

  factory ReseniasModel.fromJson(Map<String, dynamic> json) {
    return ReseniasModel(
      id: json["id"],
      usuario: json["usuario"],
      comentario: json["comentario"],
      calificacion: json["calificacion"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "usuario": usuario,
    "comentario": comentario,
    "calificacion": calificacion,
  };
}