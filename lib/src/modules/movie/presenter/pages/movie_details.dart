// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:marvel_app/src/modules/movie/presenter/utils/format_date.dart';

import '../../domain/entities/movie.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;
  const MovieDetails({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: FittedBox(
          child: Text(
            movie.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        children: [
          const Padding(
            padding: EdgeInsets.all(32),
            child: Icon(
              Icons.image_outlined,
              size: 200,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text.rich(TextSpan(
                  text: 'ID ',
                  style: Theme.of(context).textTheme.titleLarge,
                  children: <InlineSpan>[
                    TextSpan(
                        text: '${movie.id}',
                        style: Theme.of(context).textTheme.labelMedium)
                  ])),
              const Spacer(),
              const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Text(movie.vote.toString()),
            ],
          ),
          const Divider(),
          Text.rich(TextSpan(
              text: 'Titulo Original   ',
              style: Theme.of(context).textTheme.titleLarge,
              children: <InlineSpan>[
                TextSpan(
                    text: movie.originalTitle,
                    style: Theme.of(context).textTheme.labelLarge)
              ])),
          const Divider(),
          Text.rich(TextSpan(
              text: 'Data de Lançamento   ',
              style: Theme.of(context).textTheme.titleLarge,
              children: <InlineSpan>[
                TextSpan(
                    text: movie.date.getFormattedDate(),
                    style: Theme.of(context).textTheme.labelLarge)
              ])),
          const Divider(),
          Text.rich(TextSpan(
              text: 'Popularidade   ',
              style: Theme.of(context).textTheme.titleLarge,
              children: <InlineSpan>[
                TextSpan(
                    text: '${movie.popularity}',
                    style: Theme.of(context).textTheme.labelLarge)
              ])),
          const Divider(),
          Text.rich(TextSpan(
              text: 'Votos   ',
              style: Theme.of(context).textTheme.titleLarge,
              children: <InlineSpan>[
                TextSpan(
                    text: '${movie.voteCount}',
                    style: Theme.of(context).textTheme.labelLarge)
              ])),
          const Divider(),
          Text.rich(TextSpan(
              text: 'Descrição   ',
              style: Theme.of(context).textTheme.titleLarge,
              children: <InlineSpan>[
                TextSpan(
                    text: movie.subtitle,
                    style: Theme.of(context).textTheme.bodyLarge)
              ])),
          const Divider(),
        ],
      ),
    );
  }
}
