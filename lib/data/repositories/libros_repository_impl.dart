// -----------------------------------------------------------------------------
// CAPA: DATA
// ARCHIVO: data/repositories/libros_repository_impl.dart
//
// OBJETIVO:
// Este archivo es la IMPLEMENTACIÓN del Repositorio.
// En Clean Architecture, el "Repositorio" es el puente entre el Dominio (reglas de negocio)
// y los Datos (APIs, bases de datos).
//
// ¿QUÉ HACE?
// Recibe las peticiones del Dominio (UseCases) y decide de dónde sacar los datos.
// En este caso, le pide los datos al "RemoteDatasource" (la API).
// -----------------------------------------------------------------------------

// Importamos el Datasource para poder pedirle datos a la API.
import 'package:biblioteca_mejorada/data/datasources/libros_remote_datasource.dart';
// Importamos la Entidad (Entity) porque el Dominio solo entiende de Entidades, no de Modelos.
import 'package:biblioteca_mejorada/domain/entities/libro_entity.dart';
// Importamos la interfaz del Repositorio que vamos a implementar.
import 'package:biblioteca_mejorada/domain/repositories/libros_repository.dart';

// Definimos la clase 'LibrosRepositoryImpl'.
// "implements LibrosRepository" significa que esta clase está OBLIGADA a cumplir el contrato
// definido en el archivo del dominio. Si el contrato dice "dame libros", aquí debemos dar libros.
class LibrosRepositoryImpl implements LibrosRepository {
  // ---------------------------------------------------------------------------
  // DEPENDENCIA: REMOTE DATASOURCE
  // ---------------------------------------------------------------------------

  // Aquí declaramos una variable para guardar nuestra conexión con la API (Datasource).
  // Es 'final' porque una vez que se asigna, no queremos que cambie.
  final LibrosRemoteDatasource remoteDatasource;

  // CONSTRUCTOR
  // Cuando alguien cree una instancia de este Repositorio, debe pasarnos (inyectar)
  // el datasource obligatoriamente ('required').
  // Esto se llama "Inyección de Dependencias".
  LibrosRepositoryImpl({required this.remoteDatasource});

  // ---------------------------------------------------------------------------
  // MÉTODOS (Implementación del contrato)
  // ---------------------------------------------------------------------------

  // @override indica que estamos sobrescribiendo un método definido en la interfaz (LibrosRepository).
  @override
  Future<List<LibroEntity>> getAllLibros() async {
    // 1. 'Future': Indica que esta función tomará un tiempo (es asíncrona), como pedir una pizza.
    // 2. 'async': Habilita el uso de 'await' dentro de la función.

    // Aquí llamamos al datasource usando 'await'.
    // 'await' significa: "Espera aquí a que la API responda antes de continuar".
    // El datasource nos devuelve Modelos (LibroModel), que extienden de Entidades.
    final libroModel = await remoteDatasource.getAllLibros();

    // RETORNA: List<LibroEntity> (Una lista de Entidades de Libros).
    // POR QUÉ: El Dominio espera recibir una lista de objetos de negocio (Entidades) para mostrarlos.
    // 'libroModel' es esa lista (que viene de la API).
    return libroModel;
  }

  @override
  Future<LibroEntity> getLibroById(int id) async {
    // Pedimos al datasource que busque un libro específico por su ID.
    // Esperamos la respuesta con 'await'.
    final libroid = await remoteDatasource.getLibroById(id);

    // RETORNA: LibroEntity (Un objeto de tipo Entidad).
    // POR QUÉ: El contrato (interfaz) pide devolver un 'LibroEntity' específico.
    // 'libroid' es ese objeto encontrado en la API.
    return libroid;
  }

  @override
  Future<LibroEntity> createLibro(LibroEntity libro) async {
    // IMPORTANTE: Conversión de Tipos
    // El Dominio nos pasa una 'LibroEntity' (reglas de negocio), pero
    // el Datasource (API) usualmente espera un 'LibroModel' (formato JSON/Dato).

    // Aquí hacemos un "cast" (conversión) rápido usando 'as dynamic'.
    // En un caso ideal, deberíamos tener un método 'toModel()' en la entidad,
    // pero 'as dynamic' le dice a Dart: "Confía en mí, trátalo como sea necesario".
    // Esto permite pasar la entidad al datasource que espera un modelo.
    final libroModel = libro as dynamic;

    // Llamamos al método createLibro del datasource y esperamos la respuesta.
    final newLibro = await remoteDatasource.createLibro(libroModel);

    // RETORNA: LibroEntity (El objeto Libro recién creado).
    // POR QUÉ: Es útil devolver el objeto confirmado por la API (por ejemplo, con su nuevo ID).
    // Así el Dominio tiene la certeza de qué se guardó exactamente.
    return newLibro;
  }

  @override
  Future<LibroEntity> updateLibro(int id, LibroEntity libro) async {
    // Similar al crear, recibimos una Entidad del dominio.
    // Necesitamos convertirla/tratarla como Modelo para la capa de Data.
    final libroModel = libro as dynamic;

    // Enviamos el ID y los datos actualizados a la API (Datasource).
    // Esperamos a que la API confirme y nos devuelva el libro actualizado.
    final updatedLibro = await remoteDatasource.updateLibro(id, libroModel);

    // RETORNA: LibroEntity (El objeto Libro actualizado).
    // POR QUÉ: Confirmamos al Dominio que la edición se aplicó correctamente en la API.
    // Devolvemos el dato actualizado como prueba de éxito.
    return updatedLibro;
  }

  @override
  Future<bool> deleteLibro(int id) async {
    // Llamamos al datasource para borrar el libro con ese ID.
    // No guardamos el resultado en una variable porque deleteLibro suele retornar void o Future<void>.
    await remoteDatasource.deleteLibro(id);

    // RETORNA: bool (Booleano: true).
    // POR QUÉ: La función debe responder si tuvo éxito o no (Future<bool>).
    // Si el código llega aquí (pasó el await), asumimos que no hubo error al borrar, así que devolvemos 'true'.
    return true;
  }
}
