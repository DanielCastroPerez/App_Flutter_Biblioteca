import 'package:biblioteca_mejorada/domain/entities/libro_entity.dart';
import 'package:biblioteca_mejorada/domain/usecases/create_libro.dart';
import 'package:biblioteca_mejorada/domain/usecases/delete_libro.dart';
import 'package:biblioteca_mejorada/domain/usecases/get_libro_by_id.dart';
import 'package:biblioteca_mejorada/domain/usecases/get_libros.dart';
import 'package:biblioteca_mejorada/domain/usecases/update_libro.dart';
import 'package:flutter/material.dart';

class LibrosProvider with ChangeNotifier {
  // todos los casos de uso que tenemos
  final GetLibrosUseCase getLibrosUseCase;
  final CreateLibroUseCase createLibroUseCase;
  final GetLibroByIdUseCase getLibroByIdUseCase;
  final DeleteLibroUseCase deleteLibroUseCase;
  final UpdateLibroUseCase updateLibroUseCase;

  LibrosProvider({
    required this.getLibroByIdUseCase,
    required this.createLibroUseCase,
    required this.getLibrosUseCase,
    required this.deleteLibroUseCase,
    required this.updateLibroUseCase,
  });

  // variables privadas
  List<LibroEntity> _libros = [];
  LibroEntity? _selectedLibro; // es una entidad {nombre:"", apellido:""}
  bool _isLoading = false;
  String? _errorMessage;

  // Getters para exponer el estado [tipo de retorno get variable_privada]
  List<LibroEntity> get libros => _libros;
  LibroEntity? get selectedLibro => _selectedLibro; // porque no puedo usar esta variable para cuandi haga un update? esta variable seria el libro que voy a odificar
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchLibros() async {
    _isLoading = true;
    notifyListeners();
    try {
      _libros = await getLibrosUseCase();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchLibroById(int id) async {
    _isLoading = true;
    notifyListeners();
    try {
      _selectedLibro = await getLibroByIdUseCase(id);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addLibro(LibroEntity libro) async {
    _isLoading = true;
    notifyListeners();
    try {
      final nuevo = await createLibroUseCase(libro);
      _libros.add(nuevo);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateLibro(int id, LibroEntity libro) async {
    _isLoading = true;
    notifyListeners(); // notifica los cambios
    try {
      final actualizado = await updateLibroUseCase(id, libro);
      final index = _libros.indexWhere((e) => e.id == id);
      if (index != -1) {
        _libros[index] = actualizado;
      }
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteLibro(int id) async {
    _isLoading = true;
    notifyListeners();
    try {
      bool estado = await deleteLibroUseCase(id);
      _libros.removeWhere((l) => l.id == id);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}


// Dudas frecuentes jej
// 1. ¿Por qué los Future<void> no retornan nada?
// El use case (getLibrosUseCase) sí retorna List<LibroEntity>.
// El provider (fetchLibros) recibe eso, actualiza su estado interno (_libros) y notifica a la UI con notifyListeners().
// La UI no necesita el return, porque accede a los getters:

/*¿El Provider guarda todas las respuestas de la API en una lista ficticia?

Exacto ✅

El Provider funciona como tu cache en memoria de lo que ya descargaste/actualizaste de la API.

Esa lista (_libros) no es la base de datos real, pero refleja el estado de la API.

Esa lista es la que alimenta la UI (con **notifyListeners()** haces que los widgets se redibujen cuando cambia la lista).

👉 Piensa que el Provider = fuente de verdad dentro de la app mientras la app está abierta.*/
