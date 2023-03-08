import 'package:marvel_app/src/modules/movie/domain/repositories/post_repository.dart';
import 'package:multiple_result/multiple_result.dart';

import '../entities/movie.dart';
import '../errors/errors.dart';

abstract class IGetMovies {
  Future<Result<List<Movie>, IMoviesException>> call();
}

class GetMovies implements IGetMovies {
  final IMovieRepository repository;

  GetMovies(this.repository);
  @override
  Future<Result<List<Movie>, IMoviesException>> call() async {
    
    return await repository.getMovies();
  }
}
