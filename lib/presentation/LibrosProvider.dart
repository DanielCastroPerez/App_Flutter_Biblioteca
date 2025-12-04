import 'package:biblioteca_mejorada/domain/entities/libro_entity.dart';
import 'package:biblioteca_mejorada/domain/usecases/create_libro.dart';
import 'package:biblioteca_mejorada/domain/usecases/delete_libro.dart';
import 'package:biblioteca_mejorada/domain/usecases/get_libro_by_id.dart';
import 'package:biblioteca_mejorada/domain/usecases/get_libros.dart';
import 'package:biblioteca_mejorada/domain/usecases/update_libro.dart';
import 'package:flutter/material.dart';

enum LibrosState {
  initial,
  loading,
  loaded,
  error,
} // Estados posibles para la gestion de libros

class LibrosProvider extends ChangeNotifier {
  // todos los casos de uso que tenemos
  final GetLibrosUseCase getLibrosUseCase;
  final GetLibroByIdUseCase getLibroByIdUseCase;
  final CreateLibroUseCase createLibroUseCase;
  final UpdateLibroUseCase updateLibroUseCase;
  final DeleteLibroUseCase deleteLibroUseCase;

  List<LibroEntity> libros = [];
  LibroEntity? selectedLibro;
  LibrosState state = LibrosState.initial; // estado inicial
  String? errorMessage;

  LibrosProvider({
    required this.getLibrosUseCase,
    required this.getLibroByIdUseCase,
    required this.createLibroUseCase,
    required this.updateLibroUseCase,
    required this.deleteLibroUseCase,
  });

  // Metodo para obtener todos los libros
  Future<void> getLibros() async {
    state = LibrosState.loading;
    notifyListeners();
    try {
      final result = await getLibrosUseCase();
      libros = result;
      state = LibrosState.loaded;
    } catch (e) {
      errorMessage = e.toString();
      state = LibrosState.error;
    }
    notifyListeners();
  }

  // Metodo para obtener un libro por su ID
  Future<void> fetchLibroById(int id) async {
    state = LibrosState.loading;
    notifyListeners();
    try {
      final resultLibro = await getLibroByIdUseCase(id);
      selectedLibro = resultLibro;
      state = LibrosState.loaded;
    } catch (e) {
      errorMessage = e.toString();
      state = LibrosState.error;
    }
    notifyListeners();
  }

  // Metodo para actualizar un libro
  Future<void> addLibros(LibroEntity libro) async {
    state = LibrosState.loading;
    notifyListeners();
    try {
      final nuevoLibro = await createLibroUseCase(libro);
      libros.add(nuevoLibro);
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
      final libroActualizado = await updateLibroUseCase(id, libro);
      final index = libros.indexWhere(
        (e) => e.id == id,
      ); // index obtiene la posicion del libro en la lista
      if (index != -1) {
        libros[index] = libroActualizado;
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
      final success = await deleteLibroUseCase(id);
      if (success) {
        libros.removeWhere((e) => e.id == id);
        state = LibrosState.loaded;
      }
    } catch (e) {
      errorMessage = e.toString();
      state = LibrosState.error;
    }
  }
}
