abstract class Failure implements Exception {
  String get message;
}

class ConnectionError extends Failure {
  final String message;
  ConnectionError({this.message});
}

class ErrorLogout extends Failure {
  final String message;
  ErrorLogout({this.message});
}

class ErrorNotFound extends Failure {
  final String message;
  ErrorNotFound({this.message});
}
