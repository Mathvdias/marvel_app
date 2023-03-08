import 'package:multiple_result/multiple_result.dart';

import '../entities/movie.dart';
import '../errors/errors.dart';

abstract class IMovieRepository {
  Future<Result<List<Movie>, IMoviesException>> getMovies();
}
