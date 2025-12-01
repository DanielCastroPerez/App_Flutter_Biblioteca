import 'package:biblioteca_mejorada/main_OR.dart';
import 'package:flutter_test/flutter_test.dart';

// void main() {
//   group("Test UsuarioModel", () {
//     test("Convertir de json a modelo", () {
//       //arrange creo el mock
//       final mock = {
//         "id": 1,
//         "nombre": "Ricardo",
//         "email": "Alejandro@gmail.com",
//       };

//       //Act conviero un json a modelo
//       final usuario = UsuarioModel.fromJson(mock);

//       //assert
//       expect(usuario.id, 1);
//       expect(usuario.nombre, "Ricardo");
//       expect(usuario.email, "Alejandro@gmail.com");
//     });

//     test("Convertir de modedlo a json", () {
//       //arrange

//       final model = UsuarioModel(
//         id: 1,
//         nombre: "Ricardo",
//         email: "Alejandro@gmail.com",
//       );

//       //act Convierto de un modelo a json
//       final json = model.toJson();

//       //assert

//       expect(json, {
//         "id": 1,
//         "nombre": "Ricardo",
//         "email": "Alejandro@gmail.com",
//       });
//     });
//   });

//   //ProductoModel ////////////////////
//   group("Tester ProductoModel", () {
//     test("Testear ProductoModel", () {
//       //arrange
//       final mock = {
//         "id": 1,
//         "nombre": "Latas",
//         "precio": 13.5,
//         "categoria": "aluminio",
//       };
//       //act
//       final model = ProductoModel.fromJson(mock);
//       //assert
//       expect(model.id, 1);
//       expect(model.nombre, "Latas");
//       expect(model.precio, 13.5);
//       expect(model.categoria, "aluminio");
//     });

//     test("Convert de modelo a json", () {
//       //arrange
//       final modelo = ProductoModel(
//         id: 1,
//         nombre: "Latas",
//         precio: 13.5,
//         categoria: "aluminio",
//       );
//       //act
//       final json = modelo.toJson();
//       //assert
//       expect(json, {
//         "id": 1,
//         "nombre": "Latas",
//         "precio": 13.5,
//         "categoria": "aluminio",
//       });
//     });
//   });

//   group("Tester ProductoModel", () {
//     test("Convertir json a modelo", () {
//       final mock = {
//         "id": 1,
//         "nombre": "Latas",
//         "precio": 13.5,
//         "categoria": "aluminio",
//       };

//       final model = ProductoModel.fromJson(mock);

//       expect(model.id, 1);
//       expect(model.nombre, "Latas");
//       expect(model.precio, 13.5);
//       expect(model.categoria, "aluminio");
//     });

//     test("Convertir modelo a json", () {
//       final modelo = ProductoModel(
//         id: 1,
//         nombre: "Latas",
//         precio: 13.5,
//         categoria: "aluminio",
//       );

//       final json = modelo.toJson();

//       expect(json, {
//         "id": 1,
//         "nombre": "Latas",
//         "precio": 13.5,
//         "categoria": "aluminio",
//       });
//     });
//   });

//   group("Testeando PedidoModel", () {
//     test("Convirtiendo de json a modelo", () {
//       final json = {
//         "id": 1,
//         "usuarioId": 1,
//         "productos": [
//           {
//             "id": 1,
//             "nombre": "Latas",
//             "precio": 13.5,
//             "categoria": "aluminio",
//           },
//           {
//             "id": 2,
//             "nombre": "Cajas",
//             "precio": 22.5,
//             "categoria": "Carton",
//           },
//         ],
//         "total": 34.5,
//       };

//       final model = PedidoModel.fromJson(json);

//       expect(model.id, 1);
//       expect(model.usuarioId, 1);
//       expect(model.productos.length, 2);

//       expect(model.productos[0].nombre, "Latas");
//       expect(model.productos[0].precio, 13.5);
//       expect(model.productos[0].categoria, "aluminio");

//       expect(model.productos[1].nombre, "Cajas");
//       expect(model.productos[1].precio, 22.5);
//       expect(model.productos[1].categoria, "Carton");

//       expect(model.total, 34.5);
//     });

//     test("Convirtiendo de modelo a json", () {
//       final pedido = PedidoModel(
//         id: 1,
//         usuarioId: 1,
//         productos: [
//           ProductoModel(id: 1, nombre: "Latas", precio: 13.5, categoria: "aluminio"),
//           ProductoModel(id: 2, nombre: "Cajas", precio: 22.5, categoria: "Carton"),
//         ],
//         total: 34.5,
//       );

//       final json = pedido.toJson();

//       expect(json, {
//         "id": 1,
//         "usuarioId": 1,
//         "productos": [
//           {
//             "id": 1,
//             "nombre": "Latas",
//             "precio": 13.5,
//             "categoria": "aluminio",
//           },
//           {
//             "id": 2,
//             "nombre": "Cajas",
//             "precio": 22.5,
//             "categoria": "Carton",
//           },
//         ],
//         "total": 34.5,
//       });
//     });
//   });
// }

////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////

// void main() {
//   group("Test MascotaModel", () {
//     test("Convirtiendo de json a modelo", () {
//       // arrange creo mi mock
//       final mock = {
//         "id": 1,
//         "nombre": "Firulais",
//         "edad": 4,
//         "tipo": "perro",
//         "dueno": {
//           "id": 101,
//           "nombre": "Carlos Pérez",
//           "telefono": "555-123-4567",
//         },
//       };

//       //act creo entidad
//       final modelo = MascotaModel.fromJson(mock);

//       //assert
//       expect(modelo.id, 1);
//       expect(modelo.nombre, "Firulais");
//       expect(modelo.edad, 4);
//       expect(modelo.tipo, "perro");
//       //dueno
//       expect(modelo.dueno.id, 101);
//       expect(modelo.dueno.nombre, "Carlos Pérez");
//       expect(modelo.dueno.telefono, "555-123-4567");
//     });
//   });

//   group("Test de MascotaModel", () {
//     test("Test de modelo a json", () {
//       //arrange
//       final mocks = MascotaModel(
//         id: 1,
//         nombre: "Firulais",
//         edad: 4,
//         tipo: "perro",
//         dueno: DuenoModel(
//           id: 101,
//           nombre: "Carlos Pérez",
//           telefono: "555-123-4567",
//         ),
//       );

//       //act
//       final model = mocks.toJson();
//       expect(model, {
//         "id": 1,
//         "nombre": "Firulais",
//         "edad": 4,
//         "tipo": "perro",
//         "dueno": {
//           "id": 101,
//           "nombre": "Carlos Pérez",
//           "telefono": "555-123-4567",
//         },
//       });
//     });
//   });

//   group("Tets de DuenoModel", () {
//     test("Convertir de json a model", () {
//       //arage
//       final mock = {
//         "id": 101,
//         "nombre": "Carlos Pérez",
//         "telefono": "555-123-4567",
//       };

//       //ACT
//       final modelo = DuenoModel.fromJson(mock);

//       //assert
//       expect(modelo.id, 101);
//       expect(modelo.nombre, "Carlos Pérez");
//       expect(modelo.telefono, "555-123-4567");
//     });
//   });

//   group("Test DuenoModel", () {
//     test("Convirtiendo de modelo a json", () {
//       //arrange
//       final model = DuenoModel(
//         id: 101,
//         nombre: "Carlos Pérez",
//         telefono: "555-123-4567",
//       );
//       //act
//       final json = model.toJson();
//       //assert
//       expect(json, {
//           "id": 101,
//           "nombre": "Carlos Pérez",
//           "telefono": "555-123-4567",
//         });

//     });
//   });
// }
////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////

void main() {
  group("Test AutosEntity", () {
    test("Convierte de json a modelo", () {
      //arrange
      final json = {
        "id": 10,
        "marca": "Toyota",
        "modelo": "Corolla",
        "anio": 2020,
        "precio_por_dia": 750,
        "disponible": true,
        "sucursal": {
          "id": 1,
          "nombre": "Sucursal Centro",
          "direccion": "Av. Reforma 123",
        },
      };

      //act
      final model = AutosModel.fromJson(json);

      expect(model.id, 10);
      expect(model.marca, "Toyota");
      expect(model.modelo, "Corolla");
      expect(model.anio, 2020);
      expect(model.precioPorDia, 2020);
      expect(model.disponible, true);
    });
  });

  group("Test de AutosEntity ", () {
    final model = AutosModel(
      id: 10,
      marca: "Toyota",
      modelo: "Corolla",
      anio: 2020,
      precioPorDia: 750,
      disponible: true,
      sucursal: SucursalModel(
        id: 1,
        nombre: "Sucursal Centro",
        direccion: "Av. Reforma 123",
      ),
    );
  });
}
