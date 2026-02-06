// import 'package:biblioteca_mejorada/core/env.dart';
// import 'package:biblioteca_mejorada/data/datasources/libros_remote_datasource.dart';
// import 'package:biblioteca_mejorada/data/repositories/libros_repository_impl.dart';
// import 'package:biblioteca_mejorada/domain/usecases/create_libro.dart';
// import 'package:biblioteca_mejorada/domain/usecases/delete_libro.dart';
// import 'package:biblioteca_mejorada/domain/usecases/get_libro_by_id.dart';
// import 'package:biblioteca_mejorada/domain/usecases/get_libros.dart';
// import 'package:biblioteca_mejorada/domain/usecases/update_libro.dart';
// import 'package:biblioteca_mejorada/presentation/providers/LibrosProvider.dart';
// import 'package:biblioteca_mejorada/presentation/screens/home_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';

// void main() async {
//   // Necesario para inicializar Flutter antes de cargar async cosas
//   WidgetsFlutterBinding.ensureInitialized();

//   // Variable para capturar errores de inicialización y mostrarlos en pantalla si ocurren
//   String? initError;

//   try {
//     // Cargar variables de entorno (.env)
//     print('Cargando .env');
//     await dotenv.load(fileName: ".env");
//     print('dotenv cargado');

//     // Cliente HTTP que usaremos en el DataSource
//     final client = http.Client();

//     // Paso 1: Crear el DataSource (quien realmente llama a la API)
//     print('Leyendo EnvConfig.apiUrl: ${EnvConfig.apiUrl}');
//     final remoteDatasource = LibrosRemoteDataSourceImpl(
//       cliente: client,
//       baseUrl: EnvConfig.apiUrl,
//     );

//     // Paso 2: Crear el Repository (se comunica con DataSource y devuelve entidades)
//     final librosRepository = LibrosRepositoryImpl(
//       remoteDatasource: remoteDatasource,
//     );

//     // Paso 3: Crear los casos de uso (reciben el repositorio para ejecutar lógica de negocio)
//     final getLibrosUseCase = GetLibrosUseCase(repository: librosRepository);
//     final getLibroByIdUseCase = GetLibroByIdUseCase(
//       repository: librosRepository,
//     );
//     final createLibroUseCase = CreateLibroUseCase(repository: librosRepository);
//     final updateLibroUseCase = UpdateLibroUseCase(repository: librosRepository);
//     final deleteLibroUseCase = DeleteLibroUseCase(repository: librosRepository);

//     // Paso 4: Inyectar los casos de uso en el árbol de widgets (Provider)
//     runApp(
//       MyApp(
//         getLibrosUseCase: getLibrosUseCase,
//         getLibroByIdUseCase: getLibroByIdUseCase,
//         createLibroUseCase: createLibroUseCase,
//         updateLibroUseCase: updateLibroUseCase,
//         deleteLibroUseCase: deleteLibroUseCase,
//       ),
//     );
//   } catch (e, st) {
//     initError = e.toString();
//     print('Error durante inicialización: $e');
//     print(st);
//     // Si hubo un error, mostramos una app minimal con el error para facilitar debugging
//     runApp(ErrorApp(message: initError));
//   }
// }

// // App de error simple para mostrar la excepción de inicialización
// class ErrorApp extends StatelessWidget {
//   final String? message;
//   const ErrorApp({super.key, this.message});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Error de inicialización')),
//         body: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               message ?? 'Error desconocido',
//               style: const TextStyle(color: Colors.red),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   // Paso 5: Guardamos los casos de uso como propiedades para compartirlos con el Provider
//   final GetLibrosUseCase getLibrosUseCase;
//   final GetLibroByIdUseCase getLibroByIdUseCase;
//   final CreateLibroUseCase createLibroUseCase;
//   final UpdateLibroUseCase updateLibroUseCase;
//   final DeleteLibroUseCase deleteLibroUseCase;

//   const MyApp({
//     super.key,
//     required this.getLibrosUseCase,
//     required this.getLibroByIdUseCase,
//     required this.createLibroUseCase,
//     required this.updateLibroUseCase,
//     required this.deleteLibroUseCase,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         // Paso 6: Creamos nuestro Provider y le inyectamos TODOS los casos de uso
//         ChangeNotifierProvider(
//           // Cuando exista un cambio de lo que tiene dentro notificara al provider
//           create: (_) => LibrosProvider(
//             getLibroByIdUseCase: getLibroByIdUseCase,
//             createLibroUseCase: createLibroUseCase,
//             getLibrosUseCase: getLibrosUseCase,
//             deleteLibroUseCase: deleteLibroUseCase,
//             updateLibroUseCase: updateLibroUseCase,
//           ),
//         ),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Biblioteca Mejorada',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//           useMaterial3: true,
//         ),
//         home: HomeScreen(),
//       ),
//     );
//   }
// }

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

void main() async {
  // Necesario para inicializar Flutter antes de cargar async cosas
  WidgetsFlutterBinding.ensureInitialized();

  // Cargar variables de entorno (.env)
  await dotenv.load(fileName: ".env");

  // Cliente HTTP que usaremos en el DataSource
  final client = http.Client();

  // Paso 1: Crear el DataSource (quien realmente llama a la API)
  final remoteDatasource = LibrosRemoteDataSourceImpl(
    cliente: client,
    baseUrl: EnvConfig.apiUrl,
  );

  // Paso 2: Crear el Repository (se comunica con DataSource y devuelve entidades)
  final librosRepository = LibrosRepositoryImpl(
    remoteDatasource: remoteDatasource,
  );

  // Paso 3: Crear los casos de uso (reciben el repositorio para ejecutar lógica de negocio)
  final getLibrosUseCase = GetLibrosUseCase(repository: librosRepository);
  final getLibroByIdUseCase = GetLibroByIdUseCase(repository: librosRepository);
  final createLibroUseCase = CreateLibroUseCase(repository: librosRepository);
  final updateLibroUseCase = UpdateLibroUseCase(repository: librosRepository);
  final deleteLibroUseCase = DeleteLibroUseCase(repository: librosRepository);

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
}class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LibrosPage(),
    );
  }
}
