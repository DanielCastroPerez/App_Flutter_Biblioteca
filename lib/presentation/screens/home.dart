import 'package:biblioteca_mejorada/domain/entities/libro_entity.dart';
import 'package:biblioteca_mejorada/presentation/providers/LibrosProvider.dart';
import 'package:biblioteca_mejorada/presentation/screens/libros_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _LibrosPageState();
}

class _LibrosPageState extends State<Home> {
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
      // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 1, // Número de columnas (elementos en el eje transversal)
      //   crossAxisSpacing: 8.0, // Espaciado horizontal entre elementos
      //   mainAxisSpacing: 8.0, // Espaciado vertical entre elementos
      //   childAspectRatio: 1.0, // Relación de aspecto de cada elemento (ancho/alto). 1.0 = cuadrado.
      // ),
      itemCount: libros.length,
      itemBuilder: (context, index) {
        return LibrosPage(libros: libros[index]);
      },
    );
  }
}


    

//  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount:MediaQuery.of(context).size.width > 600 ? 2 : 1,  //3 : 2,
//           // crossAxisSpacing: 1,
//           // mainAxisSpacing: 1,
//           // childAspectRatio: 1.2,
//         ),

   
