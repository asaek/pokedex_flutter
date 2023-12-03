//! Estas excepciones no se estan usando pero se pueden usar para manejar errores
//! en el dominio de la aplicacion y de mejor manera

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
}

class GeneralException implements Exception {
  final String message;
  GeneralException(this.message);
}
