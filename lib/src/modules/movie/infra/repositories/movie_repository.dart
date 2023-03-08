import 'package:marvel_app/src/modules/movie/domain/errors/errors.dart';
import 'package:marvel_app/src/modules/movie/domain/entities/movie.dart';
import 'package:marvel_app/src/modules/movie/domain/repositories/post_repository.dart';
import 'package:marvel_app/src/modules/movie/infra/adapters/movie_adapter.dart';
import 'package:marvel_app/src/modules/movie/infra/datasources/movie_datasource.dart';
import 'package:multiple_result/multiple_result.dart';

class MovieRepository extends IMovieRepository {
  final MovieDatasource movieDatasource;

  MovieRepository(this.movieDatasource);
  @override
  Future<Result<List<Movie>, IMoviesException>> getMovies() async {
    try {
      final list = await movieDatasource.getMovies();

      final movies = list.map(MovieAdapter.fromJson).toList();
      return Success(movies);
    } on IMoviesException catch (e) {
      return Error(e);
    }
  }
}
