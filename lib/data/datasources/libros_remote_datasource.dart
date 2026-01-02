// creo una clase abstarcta para hacer los contratos que despues se conectaran con al capa de dominio/repositories
import 'dart:convert';

import 'package:biblioteca_mejorada/data/models/libro_model.dart';
import 'package:http/http.dart' as http;

// contratos de la capa de datos para conectarse con una API REST
/// Contratos que vienen de la capa Data/datasource [Future LibroModel] http.
abstract class LibrosRemoteDatasource {
  // ¿Por qué creo otra vez los contratos y no reutilizo los que hice en domain/repositories? Respuesta: Porque la capa de dominio no conoce data y data no conoce a dominio.
  Future<List<LibroModel>> getAllLibros(); //Tendere una lista de modelos(objetos) [ LibroEntity(), LibroEntity(), LibroEntity() ]
  Future<LibroModel> getLibroById(int id);
  Future<LibroModel> createLibro(LibroModel libro);
  Future<LibroModel> updateLibro(int id, LibroModel libro);
  Future<bool> deleteLibro(int id);
}
/// implementacion de los contratos de LibrosRemoteDatasource data(capa de datos)+http+api rest
class LibrosRemoteDataSourceImpl extends LibrosRemoteDatasource {
  final http.Client cliente; // cliente http para hacer las peticiones
  final String baseUrl; // obtendra la url
  

  LibrosRemoteDataSourceImpl({required this.baseUrl, required this.cliente});

  // se declaran los contratos de LibrosRemoteDatasource
  @override
  Future<List<LibroModel>> getAllLibros() async {
    final response = await cliente.get(Uri.parse("$baseUrl/books/"));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(
        response.body,
      ); // creo una lista porque es una lista de objetos
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
      final Map<String, dynamic> json = jsonDecode(
        response.body,
      ); // aqui creo un [Map] ya que  retornare un [Future<LibroModel>] objeto y un objeto es un diccionario
      return LibroModel.fromJson(
        json,
      ); // retorno el objeto lo que nececita la funcion [getLibroById]
    } else {
      throw Exception("Error al cargar libro $id: ${response.statusCode}");
    }
  }

  @override
  Future<LibroModel> createLibro(LibroModel libro) async {
    // async significa que puede trabajar de manera asincrona son operaciones podrían tardar en completarse sin bloquear el hilo de ejecución principal.
    final response = await cliente.post( // await [espera] a que se complete la operacion asincrona
      Uri.parse("$baseUrl/books/"),
      headers: {"Content-Type": "application/json"}, // especifica que el contenido es json
      body: jsonEncode(libro.toJson()), // convierte el objeto libro a json
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
    // sera una funcion asincrona
    final response = await cliente.put(
      Uri.parse("$baseUrl/books/$id"),
      headers: {"Content-Type": "aplication/json"},
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
  Future<bool> deleteLibro(int id) async {
    final response = await cliente.delete(Uri.parse("$baseUrl/books/$id"));
    if (response.statusCode == 204) {
      return true;
    } else {
      throw Exception("Error al eliminar el libro $id: ${response.statusCode}");
    }
  }
}
