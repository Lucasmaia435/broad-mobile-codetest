import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/views/pokedex/pokedex.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        textTheme: GoogleFonts.pressStart2pTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: const Pokedex(),
    );
  }
}
