import 'package:flutter/material.dart';
import 'package:pokedex/pages/favourite.dart';
import 'package:pokedex/widgets/poke_card.dart';

class HomePage extends StatelessWidget {
  static const String route = "/home";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 224, 224),
      appBar: AppBar(
        title: Text("Pokemon"),
        centerTitle: true,
        backgroundColor: Colors.red,
        leading: Icon(Icons.catching_pokemon, size: 30),
        actions: <Widget>[
          IconButton(onPressed: () {
             Navigator.pushNamedAndRemoveUntil(
              context, FavouritePage.route, (route) => false);
          }, icon: Icon(Icons.favorite))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        //
        child: PokeCard()
      ),
    );
  }
}
