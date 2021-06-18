import 'package:flutter/cupertino.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/model/pokemon_repository.dart';

class HomeControl extends ChangeNotifier {

  final PokemonRepository _repository;

  HomeControl(this._repository);

  List<Pokemon> pokeList = [];
  bool loading = false;

  void loadPokemon () {
    _repository.load().then((value) {
      pokeList = value;
      notifyListeners();
    });
  }
}