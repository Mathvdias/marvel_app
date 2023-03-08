import 'package:marvel_app/src/modules/movie/domain/repositories/post_repository.dart';

import '../entities/movie.dart';

abstract class IGetMovies {
  Future<List<Movie>> call();
}

class GetMovies implements IGetMovies {
  final IMovieRepository repository;

  GetMovies(this.repository);
  @override
  Future<List<Movie>> call() async {
    return await repository.getMovies();
  }
}
