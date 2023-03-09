import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part '../states/movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());
}
