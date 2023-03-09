// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

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
        title: Text(movie.title),
      ),
    );
  }
}
