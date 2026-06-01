import 'package:biblioteca_mejorada/domain/entities/libro_entity.dart';
import 'package:flutter/material.dart';

class Screeninfo extends StatelessWidget {
  final LibroEntity libros;
  const Screeninfo({required this.libros, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(libros.titulo), backgroundColor: Colors.blue),
      body: Column(
        children: [
          Text(
            libros.titulo,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.right,
          ),
          Text(
            "${libros.autor.nombre}, ${libros.autor.pais}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.right,
          ),
          Text("Genero: ${libros.genero}", textAlign: TextAlign.right),
          Text("Año: ${libros.anio.toString()}", textAlign: TextAlign.right),
          Divider(),
          Text("Categorias"),
        ],
      ),
    );
  }
}
