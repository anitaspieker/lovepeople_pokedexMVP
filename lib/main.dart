import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_repository.dart';
import 'package:pokedex/present/home_control.dart';
import 'package:provider/provider.dart';
import 'veiw/home/page_1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:  (_)=> HomeControl(PokemonRepository()),
      child: MaterialApp(
        title: 'pokedex',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

