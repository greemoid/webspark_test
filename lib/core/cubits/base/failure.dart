abstract class Failure {
  final String message;

  const Failure({required this.message});
}

class NetworkFailure extends Failure {
  const NetworkFailure()
    : super(message: 'A network error occurred. Please check your connection.');
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure()
    : super(message: 'You are not authorized to perform this action.');
}

class ServerFailure extends Failure {
  const ServerFailure()
    : super(message: 'A server error occurred. Please try again later.');
}

class NotFoundFailure extends Failure {
  const NotFoundFailure()
    : super(message: 'The requested resource was not found.');
}

class UnknownFailure extends Failure {
  const UnknownFailure() : super(message: 'An unknown error occurred.');
}

class CalculationFailure extends Failure {
  const CalculationFailure(String message) : super(message: message);
}
