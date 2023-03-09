import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/src/modules/movie/domain/entities/movie.dart';
import 'package:marvel_app/src/modules/movie/domain/repositories/post_repository.dart';
import 'package:marvel_app/src/modules/movie/domain/usecases/get_movies.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';

class MovieRepositoryMock extends Mock implements IMovieRepository {}

void main() {
  final repository = MovieRepositoryMock();
  final usecase = GetMovies(repository);
  test('deve retornar uma lista de filmes', () async {
    when(() => repository.getMovies())
        .thenAnswer((_) async => const Success([]));
    final result = await usecase();
    expect(result.whenSuccess((success) => List<Movie>), List<Movie>);
  });
}
