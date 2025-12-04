import 'package:flutter/material.dart';
import 'package:biblioteca_mejorada/presentation/LibrosProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<LibrosProvider>(context, listen: false).getLibros());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Biblioteca")),
      body: Consumer<LibrosProvider>(
        builder: (context, provider, _) {
          switch (provider.state) {
            case LibrosState.loading:
              return const Center(child: CircularProgressIndicator());
            case LibrosState.error:
              return Center(
                  child: Text(provider.errorMessage ?? "Error desconocido"));
            case LibrosState.loaded:
              if (provider.libros.isEmpty) {
                return const Center(child: Text("No hay libros disponibles"));
              }
              return ListView.builder(
                itemCount: provider.libros.length,
                itemBuilder: (context, i) {
                  final libro = provider.libros[i];
                  return ListTile(
                    title: Text(libro.titulo),
                    subtitle: Text(libro.autor.nombre),
                  );
                },
              );
            case LibrosState.initial:
            return const Center(child: Text("Bienvenido a la Biblioteca"));
          }
        },
      ),
    );
  }
}
