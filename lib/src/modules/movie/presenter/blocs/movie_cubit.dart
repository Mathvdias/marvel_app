import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marvel_app/src/modules/movie/domain/entities/movie.dart';
import 'package:marvel_app/src/modules/movie/domain/usecases/get_movies.dart';

part '../states/movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final IGetMovies getMovies;
  MovieCubit(this.getMovies) : super(MovieInitial());

  Future<void> fetchMovies() async {
    emit(MovieLoading());
    final result = await getMovies.call();
    result.when(
      (s) => emit(MovieSuccess(s)),
      (e) => emit(MovieFailure(e.message)),
    );
  }
}
