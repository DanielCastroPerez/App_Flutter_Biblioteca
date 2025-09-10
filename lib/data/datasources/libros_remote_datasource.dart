import 'dart:convert';

import 'package:biblioteca_mejorada/data/models/libro_model.dart';
import 'package:http/http.dart' as http;


abstract class LibrosRemoteDatasource {
  Future<List<LibroModel>> getLibros();
  Future<LibroModel> getLibroById(int id);
  Future<LibroModel> createLibro(LibroModel libro);
  Future<LibroModel> updateLibro(int id, LibroModel libro);
  Future<void> deleteLibro(int id);
}

class LibrosRemoteDataSourceImpl extends LibrosRemoteDatasource {
  final http.Client cliente;
  final String baseUrl;

  LibrosRemoteDataSourceImpl({required this.cliente, required this.baseUrl});

  @override
  Future<List<LibroModel>> getLibros() async {
    final response = await cliente.get(Uri.parse("$baseUrl/books/"));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList
          .map((e) => LibroModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception("Error al cargar libros: ${response.statusCode}");
    }
  }

  @override
  Future<LibroModel> getLibroById(int id) async {
    final response = await cliente.get(Uri.parse("$baseUrl/books/$id"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = jsonDecode(response.body);
      return LibroModel.fromJson(jsonMap);
    } else {
      throw Exception("Error al cargar libro $id: ${response.statusCode}");
    }
  }

  @override
  Future<LibroModel> createLibro(LibroModel libro) async {
    final response = await cliente.post(
      Uri.parse("$baseUrl/books/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(libro.toJson()),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> jsonMap = jsonDecode(response.body);
      return LibroModel.fromJson(jsonMap);
    } else {
      throw Exception("Error al crear el libro: ${response.statusCode}");
    }
  }

  @override
  Future<LibroModel> updateLibro(int id, LibroModel libro) async {
    final response = await cliente.put(
      Uri.parse("$baseUrl/books/$id"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(libro.toJson()),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = jsonDecode(response.body);
      return LibroModel.fromJson(jsonMap);
    } else {
      throw Exception(
        "El libro $id no se pudo actualizar: ${response.statusCode}",
      );
    }
  }

  @override
  Future <bool> deleteLibro(int id) async {
    final response = await cliente.delete(Uri.parse("$baseUrl/books/$id"));
    if (response.statusCode == 204) {
      return true;
    }else{
      throw Exception("Error al eliminar el libro $id: ${response.statusCode}");
    }
  }
}
