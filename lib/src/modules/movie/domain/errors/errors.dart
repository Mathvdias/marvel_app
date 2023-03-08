abstract class IMoviesException {
  final String message;
  final StackTrace? stackTrace;

  const IMoviesException(this.message, [this.stackTrace]);
}

class MoviesException extends IMoviesException {
  const MoviesException(super.message, [super.stackTrace]);
}
