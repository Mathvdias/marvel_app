import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/src/modules/movie/domain/repositories/post_repository.dart';
import 'package:marvel_app/src/modules/movie/domain/usecases/get_movies.dart';
import 'package:marvel_app/src/modules/movie/external/movie_datasource.dart';
import 'package:marvel_app/src/modules/movie/presenter/pages/movie_page.dart';

import 'movie/infra/datasources/movie_datasource.dart';
import 'movie/infra/repositories/movie_repository.dart';
import 'movie/presenter/blocs/movie_cubit.dart';
import 'movie/presenter/pages/movie_details.dart';

class MovieModule extends Module {
  @override
  List<Bind> get binds => [
        //datasource
        Bind.factory<IMovieDatasource>((_) => MovieDatasource()),
        //repository
        Bind.factory<IMovieRepository>((i) => MovieRepository(i())),
        //usecase
        Bind.factory((i) => GetMovies(i())),
        //bloc
        Bind.factory((i) => MovieCubit(i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (ctx, args) => const MoviePage(),
          transition: TransitionType.rightToLeft,
        ),
        ChildRoute(
          '/details',
          child: (context, args) => MovieDetails(movie: args.data),
          transition: TransitionType.rightToLeft,
        ),
      ];
}
