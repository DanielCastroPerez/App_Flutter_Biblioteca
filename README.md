# **Biblioteca Mejorada**

Este es un proyecto en Flutter donde construyo una pequeña app de biblioteca conectada a una API. Lo uso principalmente para practicar **Clean Architecture**, manejar estado con **Provider** y trabajar con **pruebas unitarias**, todo en un entorno sencillo para seguir mejorando.

---

## **Características**

* **CRUD completo** de libros (listar, obtener por ID, crear, editar y eliminar).
* Comunicación con una **API remota** usando HTTP.
* Manejo de estado con **Provider**.
* Proyecto organizado con **Clean Architecture** para mantener el código limpio y fácil de probar.

---

## **Stack / Dependencias principales**

* Flutter SDK (ver versión en `pubspec.yaml`).
* `provider`, `http`, `flutter_dotenv`, `fpdart`.

---

## **Arquitectura (visión general)**

* **presentation/**: Widgets, pantallas y el `LibrosProvider`.
* **domain/**: Entidades, repositorios y casos de uso.
* **data/**: DataSources, Models y repositorio.
* **core/**: Configuración general (variables de entorno, helpers, etc.).

---

## **Estructura rápida del proyecto**

* `lib/main.dart`: Punto de entrada. Se crea el datasource, repositorio, casos de uso y el Provider.
* `lib/core/env.dart`: Lectura de `API_BASE_URL`.
* `lib/data/datasources/libros_remote_datasource.dart`: Llamadas HTTP.
* `lib/data/repositories/libros_repository_impl.dart`: Implementación del repositorio.
* `lib/domain/usecases/`: Casos de uso (Get, Create, Update, Delete).
* `lib/presentation/LibrosProvider.dart`: Lógica de estado conectada a la UI.

---

## **Variables de entorno**

Archivo `.env` en la raíz del proyecto:

```
API_BASE_URL=tu_url_aqui
```

---

## **Cómo ejecutar**

1. Tener Flutter instalado.
2. Crear un archivo `.env` con la URL base.
3. Instalar dependencias:

   ```bash
   flutter pub get
   ```
4. Ejecutar la app:

   ```bash
   flutter run
   ```

---

## **Tests**

El proyecto incluye pruebas para modelos, repositorios y casos de uso.

Ejecutar tests:

```bash
flutter test
```

---

## **Flujo interno (resumen rápido)**

1. `main.dart` crea el datasource con `http.Client` y la URL del `.env`.
2. Se construye el repositorio.
3. Se inicializan los casos de uso.
4. `LibrosProvider` se registra en el `MultiProvider` y la UI lo consume.

---

## **Notas y mejoras futuras**

* Mejorar conversión entre Models y Entities sin usar `dynamic`.
* Manejo más claro de errores usando Either/Failure.
* Crear un archivo de inyección de dependencias (`injection.dart`).
* Añadir pruebas para casos de error y escenarios límite.
