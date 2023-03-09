import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/src/modules/movie/domain/repositories/post_repository.dart';
import 'package:marvel_app/src/modules/movie/domain/usecases/get_movies.dart';
import 'package:marvel_app/src/modules/movie/external/movie_datasource.dart';

import 'movie/infra/datasources/movie_datasource.dart';
import 'movie/infra/repositories/movie_repository.dart';

class MovieModule extends Module {
  @override
  List<Bind> get binds => [
        //datasource
        Bind.factory<IMovieDatasource>((_) => MovieDatasource()),
        //repository
        Bind.factory<IMovieRepository>((i) => MovieRepository(i())),
        //usecase
        Bind.factory((i) => GetMovies(i())),
      ];
}
