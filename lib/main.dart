import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/src/modules/movie_module.dart';

import 'src/modules/movie_widget.dart';

void main() {
  runApp(ModularApp(module: MovieModule(), child: const MyApp()));
}
