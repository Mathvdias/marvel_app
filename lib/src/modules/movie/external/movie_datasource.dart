import 'dart:convert';

import 'package:flutter/services.dart';

import '../domain/errors/errors.dart';
import '../infra/datasources/movie_datasource.dart';

class MovieDatasource implements IMovieDatasource {
  @override
  Future<List> getMovies() async {
    try {
      final String response = await rootBundle.loadString('assets/mock.json');
      final data = await jsonDecode(response);
      return data['mcu'];
    } on DatasourceMovieException catch (e, s) {
      throw DatasourceMovieException(e.message, s);
    }
  }
}
