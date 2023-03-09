import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/src/modules/movie/presenter/blocs/movie_cubit.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<MovieCubit>()..fetchMovies(),
      child: Scaffold(
        appBar: AppBar(
            title: Text(
          'Movies Marvel',
          style: Theme.of(context).textTheme.headlineLarge,
        )),
        body: const MovieList(),
      ),
    );
  }
}

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieState>(
      listener: (ctx, state) {
        if (state.props.isEmpty) {
          Modular.get<MovieCubit>().fetchMovies();
        }
      },
      builder: (ctx, state) {
        Widget child = Container();

        if (state is MovieLoading) {
          child = const Center(child: CircularProgressIndicator.adaptive());
        }
        if (state is MovieFailure) {
          child = Center(child: Text(state.message));
        }
        if (state is MovieSuccess) {
          child = ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (ctx, index) {
                final movie = state.movies[index];
                return ListTile(
                  title: Text(movie.title),
                );
              });
        }
        return child;
      },
    );
  }
}
