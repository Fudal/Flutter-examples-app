abstract class NetworkError implements Exception {
  final String? message;

  NetworkError(this.message);
}

class Unauthorized extends NetworkError implements Exception {
  Unauthorized(super.message);
}

class ServiceUnavailable extends NetworkError implements Exception {
  ServiceUnavailable(super.message);
}

class ServerError extends NetworkError implements Exception {
  ServerError(super.message);
}

class ConnectionError extends NetworkError implements Exception {
  ConnectionError() : super("");
}
