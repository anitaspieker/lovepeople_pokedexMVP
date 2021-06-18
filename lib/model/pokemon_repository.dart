import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/model/pokemon.dart';

class PokemonRepository {
  Future<List<Pokemon>> load() async {
    var url = Uri.parse('http://104.131.18.84/pokemon/?limit=200&page=0');
    return http.get(url).then<List<Pokemon>>((response) {
      if (response.statusCode == 200) {
        Map json = JsonDecoder().convert(response.body);

        return json['data'].map<Pokemon>((item) {
          return Pokemon.fromJson(item);
        }).toList();
      } 
      else {
        return [];
      }
    });
  }
}
