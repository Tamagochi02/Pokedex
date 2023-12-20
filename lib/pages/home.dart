import 'package:flutter/material.dart';
import 'package:pokedex/pages/favourite.dart';
import 'package:pokedex/widgets/poke_card.dart';

class HomePage extends StatelessWidget {
  static const String route = "/home";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 224, 224),
      appBar: AppBar(
        title: const Text("Pokemon"),
        centerTitle: true,
        backgroundColor: Colors.red,
        leading: const Icon(Icons.catching_pokemon, size: 30),
        actions: <Widget>[
          IconButton(onPressed: () {
             Navigator.pushNamedAndRemoveUntil(
              context, FavouritePage.route, (route) => false);
          }, icon: const Icon(Icons.favorite))
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(10),
        //
        child: PokeCard()
      ),
    );
  }
}
