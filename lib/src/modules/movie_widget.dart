import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      title: 'Marvel Movies',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Akshar',
        useMaterial3: true,
        primarySwatch: Colors.red,
      ),
    );
  }
}
