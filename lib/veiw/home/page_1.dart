import 'package:flutter/material.dart';
import 'package:pokedex/present/home_control.dart';
import 'package:pokedex/veiw/home/pokemon_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    context.read<HomeControl>().loadPokemon();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pokedex'),
          actions: [
            Container(
              height: 35,
              width: 35,
              margin: EdgeInsets.all(10),
              child: Image.network('https://raw.githubusercontent.com/RafaelBarbosatec/SimplePokedex/master/assets/pokebola_img.png'),
            ),
          ],
        ),
        body: Consumer<HomeControl>(builder: (_, controler, child) {
          return Stack(
            children: [
              SafeArea(
                child: ListView.builder(
                  itemCount: controler.pokeList.length,
                  itemBuilder: (context, index) {
                    return PokemonWidget(
                      item: controler.pokeList[index],
                    );
                  },
                ),
              ),
            ],
          );
        }));
  }
}
