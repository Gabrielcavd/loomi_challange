abstract class Failure implements Exception {}

class ResponseIsNullException extends Failure {
  ResponseIsNullException();
}

class RequestException extends Failure {
  final String message;
  RequestException(this.message);

  @override
  String toString() => 'RequestException(message: $message)';
}

class JsonSerializationException extends Failure {
  final String message;
  JsonSerializationException(this.message);

  @override
  String toString() => 'JsonSerializationException(message: $message)';
}

class ObjectTypeException extends Failure {
  final String message;
  ObjectTypeException(this.message);

  @override
  String toString() => 'ObjectTypeException(message: $message)';
}

class UnauthorizedException extends Failure {
  final String message;
  UnauthorizedException(this.message);

  @override
  String toString() => 'UnauthorizedException(message: $message)';
}
