import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvel_app/src/modules/movie/presenter/blocs/movie_cubit.dart';

import 'package:marvel_app/src/modules/movie/presenter/utils/format_date.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<MovieCubit>()..fetchMovies(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: SvgPicture.asset(
            'assets/icons/marvel.svg',
            width: 100,
          ),
        ),
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onTap: () =>
                      Modular.to.pushNamed('/details', arguments: movie),
                  leading: CircleAvatar(
                    foregroundColor: Colors.red[900],
                    backgroundColor: Colors.red[50],
                    child: Text(movie.title[0]),
                  ),
                  title: Text(
                    movie.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  subtitle: Text(
                    movie.date.getFormattedDate(),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(movie.vote.toString())
                    ],
                  ),
                );
              });
        }
        return child;
      },
    );
  }
}
