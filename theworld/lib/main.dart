import 'package:flutter/material.dart';
import 'package:theworld/pages/Home.dart';
import 'package:theworld/pages/Location.dart';
import 'package:theworld/pages/Loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/l': (context) => const Loading(),
      '/home': (context) => Home(),
      '/': (context) => const Location(),
    },
  ));
}
