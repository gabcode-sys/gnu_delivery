abstract class Failure implements Exception {
  String get message;
}

class ConnectionError extends Failure {
  final String message;
  ConnectionError({this.message});
}

class ErrorLoginEmail extends Failure {
  final String message;
  ErrorLoginEmail({this.message});
}

class ErrorGetLoggedUser extends Failure {
  final String message;
  ErrorGetLoggedUser({this.message});
}

class ErrorLogout extends Failure {
  final String message;
  ErrorLogout({this.message});
}

class ErrorLoginPhone extends Failure {
  final String message;
  ErrorLoginPhone({this.message});
}

class NotAutomaticRetrieved extends Failure {
  final String verificationId;
  final String message;
  NotAutomaticRetrieved(this.verificationId, {this.message});
}

class InternalError extends Failure {
  final String message;
  InternalError({this.message});
}
