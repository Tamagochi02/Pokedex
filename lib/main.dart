import 'package:flutter/material.dart';
import 'package:pokedex/pages/favourite.dart';
import 'package:pokedex/pages/home.dart';
import 'package:pokedex/pages/pokemonInfo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.route:(context) => const HomePage(),
        FavouritePage.route:(context) => const FavouritePage()
        // PokemonInfoPage.route:(context) => const PokemonInfoPage()
      },
      initialRoute: HomePage.route,
    );
  }
}