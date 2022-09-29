import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/models/db.dart';
import 'package:pokedex/models/pokemon.dart';
// import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/pages/pokemonInfo.dart';
import 'package:pokedex/widgets/poke_card.dart';

class PokeCard2 extends StatefulWidget {
  const PokeCard2({Key? key}) : super(key: key);

  @override
  State<PokeCard2> createState() => _PokeCardState();
}

class _PokeCardState extends State<PokeCard2> {
  List<Pokemon> listaPokemon = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cargarPokemonBD();
  }

  cargarPokemonBD() async {
    List<Pokemon> auxPokemon = await DB.pokemons();

    setState(() {
      listaPokemon = auxPokemon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listaPokemon.length,
      itemBuilder: (context, i) {
        _listas(i);
        // return GridView.count(
        //   crossAxisCount: 2,
        //   // children: _listaPokemon(listaPokemon[i], context));
        //   // children: Text(listaPokemon[i]),
        // );
        return const CircularProgressIndicator();
      },
    );
  }

  _listas(int i) {
    return ListTile(
      title: Text(listaPokemon[i].toString()),
    );
  }
}
