import 'package:biblioteca_mejorada/domain/entities/categoria.dart';
import 'package:biblioteca_mejorada/domain/entities/libro_entity.dart';
import 'package:biblioteca_mejorada/presentation/screens/screenInfo.dart';
import 'package:flutter/material.dart';

class LibrosPage extends StatelessWidget {
  final LibroEntity libros;
  const LibrosPage({required this.libros, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => Screeninfo(libros: libros),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                libros.titulo,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Author: ${libros.autor.nombre}',
                style: TextStyle(fontSize: 13, color: Colors.grey[700]),
              ),
              SizedBox(height: 4),
              Text(
                'Género: ${libros.genero}',
                style: TextStyle(fontSize: 13, color: Colors.grey[700]),
              ),
              SizedBox(height: 4),
              Text(
                'Año: ${libros.anio.toString()}',
                style: TextStyle(fontSize: 13, color: Colors.grey[700]),
              ),
              SizedBox(height: 12),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: libros.categorias.map<Widget>((
                  CategoriaEntity related,
                ) {
                  return Chip(
                    label: Text(related.nombre, style: TextStyle(fontSize: 12)),
                    backgroundColor: const Color.fromARGB(255, 238, 205, 43),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
