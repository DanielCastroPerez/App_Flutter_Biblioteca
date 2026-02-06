class AutorEntity {
  final int id;
  final String nombre;
  final String pais;

  AutorEntity({required this.id, required this.nombre, required this.pais});
}

// Entities
// Las entidades representan la lógica de negocio pura.
// No dependen de Flutter, HTTP, JSON ni base de datos.