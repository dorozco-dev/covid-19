import 'package:covid_19/src/views/index.view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.white,
            fontFamily: 'Staatliches',
            brightness: Brightness.light
        ),
        home: Index(),
      );
  }
}