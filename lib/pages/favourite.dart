import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex/pages/home.dart';
import 'package:pokedex/widgets/poke_card.dart';
import 'package:pokedex/widgets/poke_card2.dart';

class FavouritePage extends StatefulWidget {
  static const route = "/favourite";
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 224, 224),
      appBar: AppBar(
        title: Text("Favoritos"),
        centerTitle: true,
        backgroundColor: Colors.red,
        leading: IconButton(onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
              context, HomePage.route, (route) => false);
        }, icon: Icon(Icons.arrow_back_rounded))
        // actions: <Widget>[
        //   IconButton(onPressed: () {}, icon: Icon(Icons.favorite))
        // ],
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          //
          child: PokeCard2()),
    );
  }
}
