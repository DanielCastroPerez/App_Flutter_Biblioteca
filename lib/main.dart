import 'package:biblioteca_mejorada/core/env.dart';
import 'package:biblioteca_mejorada/data/datasources/libros_remote_datasource.dart';
import 'package:biblioteca_mejorada/data/repositories/libros_repository_impl.dart';
import 'package:biblioteca_mejorada/domain/usecases/create_libro.dart';
import 'package:biblioteca_mejorada/domain/usecases/delete_libro.dart';
import 'package:biblioteca_mejorada/domain/usecases/get_libro_by_id.dart';
import 'package:biblioteca_mejorada/domain/usecases/get_libros.dart';
import 'package:biblioteca_mejorada/domain/usecases/update_libro.dart';
import 'package:biblioteca_mejorada/presentation/providers/LibrosProvider.dart';
import 'package:biblioteca_mejorada/presentation/screens/libros_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main()  {
  final client = http.Client();
  dotenv.load(fileName: ".env");

  final remoteDatasource = LibrosRemoteDataSourceImpl(
    baseUrl:"http://10.0.2.2:8000",//EnvConfig.apiUrl, //"http://localhost:8000" "http://10.0.2.2:8000"
    cliente: client,
  );

  final repository = LibrosRepositoryImpl(
    remoteDatasource: remoteDatasource,
  );

  final getLibrosUseCase = GetLibrosUseCase(repository: repository);
  final getLibroByIdUseCase = GetLibroByIdUseCase(repository: repository);
  final createLibroUseCase = CreateLibroUseCase(repository: repository);
  final updateLibroUseCase = UpdateLibroUseCase(repository: repository);
  final deleteLibroUseCase = DeleteLibroUseCase(repository: repository);

  runApp(
    ChangeNotifierProvider(
      create: (_) => LibrosProvider(
        getLibrosUseCase: getLibrosUseCase,
        getLibroByIdUseCase: getLibroByIdUseCase,
        createLibroUseCase: createLibroUseCase,
        updateLibroUseCase: updateLibroUseCase,
        deleteLibroUseCase: deleteLibroUseCase,
      ),
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LibrosPage(),
    );
  }
}
