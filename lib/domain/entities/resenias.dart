class ReseniasEntity {
  final int id;
  final String usuario;
  final String comentario;
  final int calificacion;

  ReseniasEntity({
    required this.id,
    required this.usuario,
    required this.comentario,
    required this.calificacion,
  });
}


// Las validacioces simpre iran en las entidades , en los modelos no porque su proposito es convertir los datos en modelos