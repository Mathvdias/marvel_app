import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/src/modules/movie/domain/entities/movie.dart';
import 'package:marvel_app/src/modules/movie/domain/usecases/get_movies.dart';

part '../states/movie_state.dart';

class MovieCubit extends Cubit<MovieState> implements Disposable {
  final IGetMovies getMovies;
  MovieCubit(this.getMovies) : super(MovieInitial());

  Future<void> fetchMovies() async {
    emit(MovieLoading());
    final result = await getMovies.call();
    final state = result.when(
      (s) => MovieSuccess(s),
      (e) => MovieFailure(e.message),
    );
    emit(state);
  }

  @override
  void dispose() {
    dispose();
  }
}
