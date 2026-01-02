import 'package:biblioteca_mejorada/domain/entities/categoria.dart';

class CategoriaModel extends CategoriaEntity {
  CategoriaModel({required super.id, required super.nombre});

  factory CategoriaModel.fromJson(Map<String, dynamic> json) {
    return CategoriaModel(id: json["id"], nombre: json["nombre"]);
  }

  Map<String, dynamic> toJson() => {"id": id, "nombre": nombre};
}