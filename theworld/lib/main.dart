import 'package:flutter/material.dart';
import 'package:theworld/pages/Home.dart';
import 'package:theworld/pages/Location.dart';
import 'package:theworld/pages/Loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location': (context) => const Location(),
    },
  ));
}
