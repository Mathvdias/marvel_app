part of '../blocs/movie_cubit.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieSuccess extends MovieState {
  final List<Movie> movies;

  const MovieSuccess(this.movies);
}

class MovieFailure extends MovieState {
  final String message;

  const MovieFailure(this.message);
}
