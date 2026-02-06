import 'package:biblioteca_mejorada/domain/entities/libro_entity.dart';
import 'package:biblioteca_mejorada/presentation/providers/LibrosProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LibrosPage extends StatefulWidget {
  const LibrosPage({super.key});

  @override
  State<LibrosPage> createState() => _LibrosPageState();
}

class _LibrosPageState extends State<LibrosPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      //microtask para que se ejecute despues de build
      context
          .read<LibrosProvider>()
          .getLibros(); //context.read sirve para [acceder] al provider
    });
  }

  Widget build(BuildContext context) {
    final provider = context
        .watch<
          LibrosProvider
        >(); //context.watch sirve para escuchar los [cambios] en el provider

    return Scaffold(
      appBar: AppBar(title: const Text('Libros')),
      body: _buildBody(provider),
    );
  }

  Widget _buildBody(LibrosProvider provider) {
    switch (provider.state) {
      case LibrosState.loading:
        return Center(child: CircularProgressIndicator());

      case LibrosState.error:
        return Center(
          child: Text(provider.errorMessage ?? "Error desconocido"),
        );

      case LibrosState.loaded:
        return _buildList(provider.libros);

      case LibrosState.initial:
        return SizedBox.shrink();
    }
  }

  Widget _buildList(List<LibroEntity> libros) {
    return ListView.builder(
      itemCount: libros.length,
      itemBuilder: (context, index){
        final libro = libros[index];
        return ListTile(
          leading: Icon(Icons.book),
          title: Text(libro.titulo),
          subtitle: Text(libro.autor.nombre),

        );
      });
  }
}
