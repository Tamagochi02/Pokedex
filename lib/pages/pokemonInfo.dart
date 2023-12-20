import 'package:flutter/material.dart';
import 'package:pokedex/models/db.dart';
import 'package:pokedex/models/pokemon.dart';

bool estaPokemon = false;

class PokemonInfoPage extends StatefulWidget {
  static const route = "/pokemoninfo";
  final String nombre;
  final String imagen;
  final int id;
  const PokemonInfoPage(
      {Key? key, this.nombre = "", this.imagen = "", this.id = 0})
      : super(key: key);

  @override
  State<PokemonInfoPage> createState() => _PokemonInfoPageState();
}

class _PokemonInfoPageState extends State<PokemonInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nombre),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          //
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 185, 183, 183),
                ),
                width: double.maxFinite,
                height: 300,
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(widget.imagen), // Imagen del pokemon
                      ],
                    )),
              ),
              //
              const SizedBox(height: 15),
              //
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 128, 127, 127),
                ),
                width: double.maxFinite,
                height: 370,
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Version Shiny",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        //
                        const SizedBox(height: 20),
                        //
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.network(
                                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/${widget.id}.png"),
                            Image.network(
                                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/${widget.id}.png")
                          ],
                        ),
                        const Text("Normal",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.network(
                                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${widget.id}.png"),
                            Image.network(
                                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/${widget.id}.png")
                          ],
                        ),
                        //
                        const SizedBox(height: 10),
                        //
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                DB.insert(Pokemon(
                                    id: widget.id, name: widget.nombre));
                                // estaPokemon = true;
                                print(DB.pokemons());
                              },
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.red),
                              child: const Text("Favoritos"),
                            ),
                            // Icon(estaPokemon ? Icons.favorite :Icons.favorite_border)
                          ],
                        )
                      ],
                    )),
              ),
            ],
          )),
    );
  }
}
