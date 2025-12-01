// //Capa  domain //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// // capa entities

// class LibroEntity {
//   final int id;
//   final String titulo;
//   final int anio;
//   final String genero;
//   final AutorEntity autor;
//   final List<CategoriaEntity> categorias;
//   final List<ReseniasEntity> resenias;

//   LibroEntity({
//     required this.id,
//     required this.titulo,
//     required this.anio,
//     required this.genero,
//     required this.autor,
//     required this.categorias,
//     required this.resenias,
//   });
// }

// class AutorEntity {
//   final int id;
//   final String nombre;
//   final String pais;

//   AutorEntity({required this.id, required this.nombre, required this.pais});
// }

// class CategoriaEntity {
//   final int id;
//   final String nombre;

//   CategoriaEntity({required this.id, required this.nombre});
// }

// class ReseniasEntity {
//   final int id;
//   final String usuario;
//   final String comentario;
//   final int calificacion;

//   ReseniasEntity({
//     required this.id,
//     required this.usuario,
//     required this.comentario,
//     required this.calificacion,
//   });
// }

// // Fin capa entities

// //Capa data //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ///Models
// class LibroModel extends LibroEntity {
//   LibroModel({
//     required super.id,
//     required super.titulo,
//     required super.anio,
//     required super.genero,
//     required super.autor,
//     required super.categorias,
//     required super.resenias,
//   });

//   factory LibroModel.fromJson(Map<String, dynamic> json) {
//     return LibroModel(
//       id: json["id"],
//       titulo: json["titulo"],
//       anio: json["anio"], // corregido
//       genero: json["genero"],
//       autor: AutorModel.fromJson(json["autor"]),

//       categorias: (json["categorias"] as List)
//           .map((e) => CategoriaModel.fromJson(e))
//           .toList(),
//       // SEGUNDA FORMA DE HACE
//       resenias: (json["reseñas"] as List)
//           .map(
//             (d) => ReseniasModel(
//               id: d["id"],
//               usuario: d["usuario"],
//               comentario: d["comentario"],
//               calificacion: d["calificacion"],
//             ),
//           )
//           .toList(),
//     );
//   }

//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "titulo": titulo,
//     "anio": anio,
//     "genero": genero,
//     "autor": (autor as AutorModel).toJson(),
//     "categorias": categorias
//         .map((c) => (c as CategoriaModel).toJson())
//         .toList(),
//     "resenias": resenias.map((r) => (r as ReseniasModel).toJson()).toList(),
//   };
// }

// class AutorModel extends AutorEntity {
//   AutorModel({required super.id, required super.nombre, required super.pais});

//   factory AutorModel.fromJson(Map<String, dynamic> json) {
//     return AutorModel(
//       id: json["id"],
//       nombre: json["nombre"],
//       pais: json["pais"],
//     );
//   }

//   Map<String, dynamic> toJson() => {"id": id, "nombre": nombre, "pais": pais};
// }

// class CategoriaModel extends CategoriaEntity {
//   CategoriaModel({required super.id, required super.nombre});

//   factory CategoriaModel.fromJson(Map<String, dynamic> json) {
//     return CategoriaModel(id: json["id"], nombre: json["nombre"]);
//   }

//   Map<String, dynamic> toJson() => {"id": id, "nombre": nombre};
// }

// class ReseniasModel extends ReseniasEntity {
//   ReseniasModel({
//     required super.id,
//     required super.usuario,
//     required super.comentario,
//     required super.calificacion,
//   });

//   factory ReseniasModel.fromJson(Map<String, dynamic> json) {
//     return ReseniasModel(
//       id: json["id"],
//       usuario: json["usuario"],
//       comentario: json["comentario"],
//       calificacion: json["calificacion"],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "usuario": usuario,
//     "comentario": comentario,
//     "calificacion": calificacion,
//   };
// }

// //Models


////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

//getAllLibros

class UsuarioEntity {
  final int id;
  final String nombre;
  final String email;

  UsuarioEntity({required this.id, required this.nombre, required this.email});
}

class ProductoEntity {
  final int id;
  final String nombre;
  final double precio;
  final String categoria;

  ProductoEntity({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.categoria,
  });
}

class PedidoEntity {
  final int id;
  final int usuarioId;
  final List<ProductoEntity> productos;
  final double total;

  PedidoEntity({
    required this.id,
    required this.usuarioId,
    required this.productos,
    required this.total,
  });
}

class UsuarioModel extends UsuarioEntity {
  UsuarioModel({
    required super.id,
    required super.nombre,
    required super.email,
  });

  factory UsuarioModel.fromJson(Map<String, dynamic> json) {
    return UsuarioModel(
      id: json["id"],
      nombre: json["nombre"],
      email: json["email"],
    );
  }

  Map<String, dynamic> toJson() => {"id": id, "nombre": nombre, "email": email};
}

class ProductoModel extends ProductoEntity {
  ProductoModel({
    required super.id,
    required super.nombre,
    required super.precio,
    required super.categoria,
  });

  factory ProductoModel.fromJson(Map<String, dynamic> json) {
    return ProductoModel(
      id: json["id"],
      nombre: json["nombre"],
      precio: (json["precio"] as num).toDouble(),
      categoria: json["categoria"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre": nombre,
    "precio": precio,
    "categoria": categoria,
  };
}

class PedidoModel extends PedidoEntity {
  PedidoModel({
    required super.id,
    required super.usuarioId,
    required super.productos,
    required super.total,
  });

  factory PedidoModel.fromJson(Map<String, dynamic> json) {
    return PedidoModel(
      id: json["id"],
      usuarioId: json["usuarioId"],
      productos: (json["productos"] as List)
          .map((e) => ProductoModel.fromJson(e))
          .toList(),
      total: (json["total"] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "usuarioId": usuarioId,
    "productos": productos.map((p) => (p as ProductoModel).toJson()).toList(),
    "total": total,
  };
}

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

//model/entities

class MascotaEntity{ // esta clase depende de DuenoEntity por eso se agrega
  final int id;
  final String nombre;
  final int edad;
  final String tipo ;
  final DuenoEntity dueno; // es una entidad

  MascotaEntity({
    required this.id,
    required this.nombre,
    required this.edad,
    required this.tipo,
    required this.dueno,
  });
}

class DuenoEntity {
  final int id;
  final String nombre;
  final String telefono;

  DuenoEntity({
    required this.id,
    required this.nombre,
    required this.telefono,
  });
}

///capa data/Models

class MascotaModel extends MascotaEntity {
  final DuenoModel dueno;

  MascotaModel({
    required super.id,
    required super.nombre,
    required super.edad,
    required super.tipo,
    required this.dueno,
  }) : super(
          dueno: dueno,
        );

  factory MascotaModel.fromJson(Map<String, dynamic> json) {
    return MascotaModel(
      id: json["id"],
      nombre: json["nombre"],
      edad: json["edad"],
      tipo: json["tipo"],
      dueno: DuenoModel.fromJson(json["dueno"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nombre": nombre,
      "edad": edad,
      "tipo": tipo,
      "dueno": dueno.toJson(),
    };
  }
}

class DuenoModel extends DuenoEntity{
  DuenoModel({
    required super.id,
    required super.nombre,
    required super.telefono,
  });

  factory DuenoModel.fromJson(Map <String,dynamic> json){
    return DuenoModel(
      id: json["id"],
      nombre: json["nombre"],
      telefono: json["telefono"],
      );
  }

  Map <String,dynamic> toJson()=>{
    "id":id,
    "nombre":nombre,
    "telefono":telefono,
  };
}

//DOMAIN/REPOSITORIES

// abstract class MascotasRepository {
//   Future<Either<Failure, List<MascotaEntity>>> getAllMascotas();
//   Future<Either<Failure, MascotaEntity>> getMascotaById(int id); //solo devolvera una entidad {}
//   Future<Either<Failure, Unit>> updateMascota(int id, MascotaEntity mascota);
//   Future<Either<Failure, Unit>> deleteMascota(int id);
// }

// Domain/entities
class AutosEntity {
  final int id;
  final String marca;
  final String modelo;
  final int anio;
  final int precioPorDia;
  final bool disponible;
  final SucursalEntity sucursal;//es una entidad {}

  AutosEntity({
    required this.id,
    required this.marca,
    required this.modelo,
    required this.anio,
    required this.precioPorDia,
    required this.disponible,
    required this.sucursal,
  });
}

class SucursalEntity {
  final int id;
  final String nombre;
  final String direccion;

  SucursalEntity({
    required this.id,
    required this.nombre,
    required this.direccion,
  });
}

//Data/Models

class AutosModel extends AutosEntity {
  final SucursalModel sucursal;

  AutosModel({
    required super.id,
    required super.marca,
    required super.modelo,
    required super.anio,
    required super.precioPorDia,
    required super.disponible,
    required this.sucursal,
  }) : super(sucursal: sucursal);

  factory AutosModel.fromJson(Map <String,dynamic>json){
    return AutosModel(
      id: json["id"], 
      marca: json["marca"], 
      modelo: json["modelo"], 
      anio: json["anio"], 
      precioPorDia: json["precioPorDia"], 
      disponible: json["disponible"], 
      sucursal: SucursalModel.fromJson(json["sucursal"]), //convierte este modelo a json porque estamos trabajando con jsoon
      );
  }

  Map <String,dynamic> toJson()=>{
    "id":id,
    "marca":marca,
    "modelo":marca,
    "anio":anio,
    "precioPorDia":precioPorDia,
    "disponible": disponible,
    "sucursal":sucursal.toJson(),

  };
}

class SucursalModel extends SucursalEntity {
  SucursalModel({
    required super.id,
    required super.nombre,
    required super.direccion,
  });
  
  factory SucursalModel.fromJson(Map <String,dynamic> json){
    return SucursalModel(
      id: json["id"], 
      nombre: json["nombre"], 
      direccion: json["direccion"],
      );
  }
  
  Map <String,dynamic> toJson()=>{
    "id":id,
    "nombre":nombre,
    "direccion": direccion,
  };

}


//Models/repositopry

abstract class AutosRepository{
  Future <List<AutosModel>> getAllAutos();
  Future <AutosModel> getAutosById(int id); //solo recibire una entidad de auto osea un solo auto
  Future <AutosModel> updateAuto(AutosModel auto);// devolvere la entidad que modifique 
  Future <void> deleteAuto(int id);

}