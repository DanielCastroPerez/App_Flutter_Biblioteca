//El Provider pertenece a la capa presentation y actúa como un mediador entre la interfaz y los casos de uso. Se encarga de ejecutar los use cases, manejar el estado de la vista y notificar cambios, sin conocer detalles de repositorios ni de la capa data.
import 'package:biblioteca_mejorada/domain/entities/libro_entity.dart';
import 'package:biblioteca_mejorada/domain/usecases/create_libro.dart';
import 'package:biblioteca_mejorada/domain/usecases/delete_libro.dart';
import 'package:biblioteca_mejorada/domain/usecases/get_libro_by_id.dart';
import 'package:biblioteca_mejorada/domain/usecases/get_libros.dart';
import 'package:biblioteca_mejorada/domain/usecases/update_libro.dart';
import 'package:flutter/material.dart';


enum LibrosState { // declaro los estados  de inicio ,cargando cargado y error
  initial,
  loading,
  loaded,
  error,
} // Estados posibles para la gestion de libros

class LibrosProvider extends ChangeNotifier { // declaro la clase LibrosProvider que extiende de ChangeNotifier que es para que este atento a los cambios
  // todos los casos de uso que tenemos
  final GetLibrosUseCase getLibrosUseCase;  // aqui aplico el call  llamo a la clase y a su metodo
  final GetLibroByIdUseCase getLibroByIdUseCase;
  final CreateLibroUseCase createLibroUseCase;
  final UpdateLibroUseCase updateLibroUseCase;
  final DeleteLibroUseCase deleteLibroUseCase;

  List<LibroEntity> libros = []; // creo una lista de libros LibroEntity para cuando almacene getLibrosUseCase
  LibroEntity? selectedLibro; // declaro una variable selectedLibro de tipo LibroEntity y le pongo? poruqe SÍ puede ser nulo
  LibrosState state = LibrosState.initial; // declaro la variable state que sera de tipo LibrosState y la inicializo con estado inicial
  String? errorMessage; // declaro una variable errorMessage que swra un string? le digo que no sera nula 

  LibrosProvider({ // creo su constructor
    required this.getLibrosUseCase,
    required this.getLibroByIdUseCase,
    required this.createLibroUseCase,
    required this.updateLibroUseCase,
    required this.deleteLibroUseCase,
  });

  // Metodo para obtener todos los libros
  Future<void> getLibros() async { // creo un metodo vacio porque no devolvera nada y async para para que no interumpa ejecuciones 
    state = LibrosState.loading; //inicializo state con cargando
    notifyListeners(); // mandoa llamar a notify para que este a la escucha
    try {
      final result = await getLibrosUseCase(); // en result guardo lo que traiga getLibrosUseCase y await para que espera la respuesta
      libros = result; // guardo el resultado en la lista libros
      state = LibrosState.loaded; // como ya tengo la lista de libros state la camio a cargado
    } catch (e) { // capturo su error
      errorMessage = e.toString();
      state = LibrosState.error; // si hay un error el state lo cambio a error
    }
    notifyListeners();
  }

  // Metodo para obtener un libro por su ID
  Future<void> fetchLibroById(int id) async { //  creo un metodo con usu parametros y vacio porque no devolvera nada y async para para que no interumpa ejecuciones 
    state = LibrosState.loading;
    notifyListeners();
    try {
      final resultLibro = await getLibroByIdUseCase(id); // en resultLibro guardo lo que trajo getLibroByIdUseCase
      selectedLibro = resultLibro; // lo almaceno en selectedLibro y es de tipo LibroEntity
      state = LibrosState.loaded;
    } catch (e) {
      errorMessage = e.toString();
      state = LibrosState.error;
    }
    notifyListeners();
  }

  // Metodo para actualizar un libro
  Future<void> addLibro(LibroEntity libro) async {
    state = LibrosState.loading;
    notifyListeners();
    try {
      final nuevoLibro = await createLibroUseCase(libro);// en nuevoLibro guardo lo que trajo createLibroUseCase
      libros.add(nuevoLibro); // lo agrego a la lista libros
      state = LibrosState.loaded;
    } catch (e) {
      errorMessage = e.toString();
      state = LibrosState.error;
    }
    notifyListeners();
  }

  Future<void> updateLibro(int id, LibroEntity libro) async {
    state = LibrosState.loading;
    notifyListeners();
    try {
      final libroActualizado = await updateLibroUseCase(id, libro);  // en libroActualizado guado lo que tare updateLibroUseCase
      final index = libros.indexWhere( // aqui hago una busqueda de en que index esta ese id  pero debo estudiar un poco mas como sirve indexWhere
        (e) => e.id == id,
      ); // index obtiene la posicion del libro en la lista
      if (index != -1) {
        libros[index] = libroActualizado;// actualizo la lista por medio del indice que encontramos
      }
    } catch (e) {
      errorMessage = e.toString();
      state = LibrosState.error;
    }
    notifyListeners();
  }

  Future<void> deleteLibro(int id) async {
    state = LibrosState.loading;
    notifyListeners();
    try {
      final success = await deleteLibroUseCase(id); // success guardamos el valor que devuelve deleteLibroUseCase
      if (success) { // si es true elimina el libro 
        libros.removeWhere((e) => e.id == id); //  recorre libros y elimina el id que coincida con id
        state = LibrosState.loaded;
      }
    } catch (e) {
      errorMessage = e.toString();
      state = LibrosState.error;
    }
    notifyListeners();
  }
}


// Capa Presentation (Provider)

// El Provider conecta los casos de uso con la interfaz de usuario.
// Funciones del Provider:

// Ejecuta UseCases

// Maneja estados (loading, loaded, error)

// Guarda datos para la UI

// Notifica cambios con notifyListeners()

// 1 UI llama provider.addLibro()
// 2 Provider ejecuta CreateLibroUseCase
// 3 UseCase llama al contrato LibrosRepository
// 4 RepositoryImpl usa LibrosRemoteDatasource
// 5 Datasource llama a la API
// 6 API responde JSON
// 7 Model convierte JSON
// 8 Repository devuelve LibroEntity
// 9 Provider actualiza estado
// 10 UI se reconstruye