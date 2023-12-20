import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/pages/pokemonInfo.dart';

List<String> listaPokemon = [];
List<int> listaIds = [];

int ids = 0;
String nombre = "";

class PokeCard extends StatefulWidget {
  const PokeCard({Key? key}) : super(key: key);

  @override
  State<PokeCard> createState() => _PokeCardState();
}

class _PokeCardState extends State<PokeCard> {
  late Future<List<String>> futurePokemon;

  Future<List<String>> fetchData() async {
    final response = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=151'));

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);

      for (var item in jsonData["results"]) {
        nombre = item["name"];
        ids += 1;
        listaPokemon.add(nombre);
        listaIds.add(ids);
      }

      return listaPokemon;
    } else {
      throw Exception('Ocurrrio un error al cargar pokemon');
    }
  }

  @override
  void initState() {
    super.initState();
    futurePokemon = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futurePokemon,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          String datos = snapshot.data.toString();
          String datos2 = datos.replaceAll("[", "").replaceAll("]", "");
          final List<String> p = datos2.split(', ');
          return GridView.count(
              crossAxisCount: 2, children: _listaPokemon(p, context));
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}

getIndexId(String nombre) {
  int indice = listaPokemon.indexOf(nombre);
  return indice;
}

List<Widget> _listaPokemon(List<String> data, BuildContext context) {
  List<Widget> pokemons = [];

  data.asMap().forEach((indice, name) => pokemons.add(Card(
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PokemonInfoPage(
                      nombre: name,
                      // imagen: "https://raw.githubusercontent.com/PokeAPI/sprites/f301664fbbce6ccbe09f9561287e05653379f870/sprites/pokemon/${indice + 1}.png",
                      imagen:
                          "https://pokefanaticos.com/pokedex/assets/images/pokemon_imagenes/${indice + 1}.png",
                      id: indice + 1,
                    )),
          ),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 128, 127, 127),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20)),
                    //
                    Text("#${indice + 1}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20)),
                  ],
                ),
                Image.network(
                  // "https://raw.githubusercontent.com/PokeAPI/sprites/f301664fbbce6ccbe09f9561287e05653379f870/sprites/pokemon/${indice + 1}.png"),
                  "https://pokefanaticos.com/pokedex/assets/images/pokemon_imagenes/${indice + 1}.png",
                  scale: 2.5,
                ),
              ]),
            ),
          ),
        ),
      )));
  return pokemons;
}
