import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PokemonInfoPage extends StatefulWidget {
  static const route = "/pokemoninfo";
  final String nombre;
  final String imagen;
  const PokemonInfoPage({Key? key, this.nombre = "", this.imagen = ""})
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
          padding: EdgeInsets.all(20),
          //
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 185, 183, 183),
                ),
                width: double.maxFinite,
                height: 300,
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(widget.imagen),
                      ],
                    )),
              ),
              //
              SizedBox(height: 15),
              //
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 128, 127, 127),
                ),
                width: double.maxFinite,
                height: 300,
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Version Shiny",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        Row(
                          children: [],
                        )
                      ],
                    )),
              ),
            ],
          )
          //
          // child: ListView(children: [
          //   SizedBox(
          //     child: Container(
          //       child: Image.network(imagen, scale: 1.0),
          //       color: Colors.white,
          //     ),
          //   ),
          //   Text(nombre)
          // ]),
          // ),
          ),
    );
  }
}
