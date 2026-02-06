// -----------------------------------------------------------------------------
// ARCHIVO DE TEST: test/data/repositories/libros_repository_impl_test.dart
//
// OBJETIVO:
// Probar que 'LibrosRepositoryImpl' funcione correctamente.
//
// ¿QUÉ SIGNIFICA PROBAR UN REPOSITORIO?
// Significa verificar que:
// 1. Llame al Datasource correcto cuando le pedimos datos.
// 2. Devuelva los datos que el Datasource le entrega (posiblemente convertidos).
// 3. Maneje los errores si el Datasource falla (aunque en este caso básico solo probamos el éxito).
//
// NOTA: No queremos llamar a la API real (internet). Usaremos un "Mock" (un imitador).
// -----------------------------------------------------------------------------

import 'package:biblioteca_mejorada/data/models/libro_model.dart';
import 'package:biblioteca_mejorada/data/repositories/libros_repository_impl.dart';
import 'package:biblioteca_mejorada/domain/entities/autor.dart';
import 'package:biblioteca_mejorada/domain/entities/libro_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:biblioteca_mejorada/data/datasources/libros_remote_datasource.dart';

// -----------------------------------------------------------------------------
// 1. MOCK (EL IMITADOR)
// -----------------------------------------------------------------------------
// Como no queremos usar la API real (porque sería lento, gastaría internet y los datos pueden cambiar),
// creamos una clase "falsa" que finge ser 'LibrosRemoteDatasource'.
//
// Esta clase 'MockLibrosRemoteDatasource' nos permite controlar exactamente qué responde.
// Por ejemplo: "Cuando te pidan libros, devuelve esta lista fija".
class MockLibrosRemoteDatasource implements LibrosRemoteDatasource {
  // Estas variables nos servirán para configurar qué queremos que responda el Mock en cada test.
  List<LibroModel>? respuestaGetAll;
  LibroModel? respuestaGetById;
  LibroModel? respuestaCreate;
  LibroModel? respuestaUpdate;
  bool respuestaDelete = true;

  @override
  Future<List<LibroModel>> getAllLibros() async {
    // Simulamos que responde lo que hayamos configurado.
    print("valor de respuestaGetAll ${respuestaGetAll}");
    return respuestaGetAll ?? [];
  }

  @override
  Future<LibroModel> getLibroById(int id) async {
    // Si no configuramos respuesta, lanzamos error para que el test falle y nos demos cuenta.
    print("valor de respuestaGetById ${respuestaGetById}");
    if (respuestaGetById == null) throw Exception("No configurado");
    return respuestaGetById!;
  }

  @override
  Future<LibroModel> createLibro(LibroModel libro) async {
    print("valor de respuestaCreate ${respuestaCreate}");
    return respuestaCreate ?? libro;
  }

  @override
  Future<LibroModel> updateLibro(int id, LibroModel libro) async {
    print("valor de respuestaUpdate ${respuestaUpdate}");
    return respuestaUpdate ?? libro;
  }

  @override
  Future<bool> deleteLibro(int id) async {
    return respuestaDelete;
  }
}

// -----------------------------------------------------------------------------
// 2. DATOS DE PRUEBA (DUMMY DATA)
// -----------------------------------------------------------------------------
// Creamos un modelo de prueba para usarlo en los tests.
// No importa que los datos sean inventados, solo nos importa probar la lógica.
final tLibroModel = LibroModel(
  id: 1,
  titulo: "Test Book",
  anio: 2024,
  genero: "Test",
  autor: AutorEntity(id: 1, nombre: "Test Autor", pais: "Mexico"),
  categorias: [],
  resenias: [],
);

// -----------------------------------------------------------------------------
// 3. SUITE DE TESTS
// -----------------------------------------------------------------------------
void main() {
  // NOTA: Hemos eliminado el setUp() para hacer cada test más independiente y explícito.
  // Ahora, dentro de CADA test, crearemos el mock y el repositorio de nuevo.

  // Agrupamos los tests por funcionalidad para tener orden.
  group('getAllLibros', () {
    // ESTE ES UN TEST INDIVIDUAL
    test(
      'debe retornar una lista de LibroEntity cuando el datasource responde con éxito',
      () async {
        // --- PREPARACIÓN (ARRANGE) ---
        // 1. Creamos nuestro datasource falso (Mock) EXCLUSIVO para este test. [Instancia de MockLibrosRemoteDatasource]
        final mockDatasource = MockLibrosRemoteDatasource();

        // 2. Creamos el repositorio de verdad, inyectándole el Mock que acabamos de crear.
        final repository = LibrosRepositoryImpl(
          remoteDatasource: mockDatasource,
        );

        // 3. Configuramos la respuesta del Mock.
        final tLibrosList = [tLibroModel];
        mockDatasource.respuestaGetAll = tLibrosList;

        // --- ACCIÓN (ACT) ---
        // Ejecutamos la función que queremos probar: getAllLibros del repositorio.
        final result = await repository.getAllLibros();

        // --- VERIFICACIÓN (ASSERT) ---
        // Verificamos que el resultado sea lo que esperamos.

        // Verificamos que sea una lista de entidades.
        expect(result, isA<List<LibroEntity>>());

        // Verificamos que contenga exactamente 1 elemento.
        expect(result.length, 1);

        // Verificamos que el elemento sea el que esperamos.
        expect(result.first, tLibroModel);
      },
    );
  });

  group('getLibroById', () {
    test(
      'debe retornar un LibroEntity cuando el datasource encuentra el id',
      () async {
        // --- ARRANGE ---
        // Creamos mock y repositorio nuevamente (nuevo escenario limpio).
        final mockDatasource = MockLibrosRemoteDatasource();
        final repository = LibrosRepositoryImpl(
          remoteDatasource: mockDatasource,
        );

        // Configuramos el mock.
        mockDatasource.respuestaGetById = tLibroModel;

        // --- ACT ---
        // Pedimos el libro con id 1.
        final result = await repository.getLibroById(1);

        // --- ASSERT ---
        // Verificamos que nos devuelva exactamente el libro esperado.
        expect(result, tLibroModel);
      },
    );
  });

  group('createLibro', () {
    test('debe llamar al datasource y retornar el libro creado', () async {
      // --- ARRANGE ---
      final mockDatasource = MockLibrosRemoteDatasource();
      final repository = LibrosRepositoryImpl(remoteDatasource: mockDatasource);

      mockDatasource.respuestaCreate = tLibroModel;

      // --- ACT ---
      // Intentamos crear un libro. Pasamos tLibroModel.
      final result = await repository.createLibro(tLibroModel);

      // --- ASSERT ---
      expect(result, tLibroModel);
    });
  });

  group('updateLibro', () {
    test('debe actualizar el libro correctamente', () async {
      // --- ARRANGE ---
      final mockDatasource = MockLibrosRemoteDatasource();
      final repository = LibrosRepositoryImpl(remoteDatasource: mockDatasource);

      mockDatasource.respuestaUpdate = tLibroModel;

      // --- ACT ---
      final result = await repository.updateLibro(1, tLibroModel);

      // --- ASSERT ---
      expect(result, tLibroModel);
    });
  });

  group('deleteLibro', () {
    test('debe retornar true si la eliminación fue exitosa', () async {
      // --- ARRANGE ---
      final mockDatasource = MockLibrosRemoteDatasource();
      final repository = LibrosRepositoryImpl(remoteDatasource: mockDatasource);

      mockDatasource.respuestaDelete = true;

      // --- ACT ---
      final result = await repository.deleteLibro(1);

      // --- ASSERT ---
      expect(result, true);
    });
  });
}
