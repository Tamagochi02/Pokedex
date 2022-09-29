import 'package:pokedex/models/pokemon.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> _openDB() async {
    return openDatabase(join(await 'C:\Users\Miriam\Documents\Desarrollo movil\pokedex\lib\data', 'pokemons.db'),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE pokemons(id INTEGER PRIMARY KEY, name TEXT)");
    }, version: 1);
  }

  static Future<Future<int>> insert(Pokemon poke) async {
    Database database = await _openDB();

    return database.insert("pokemons", poke.toMap(), conflictAlgorithm: ConflictAlgorithm.replace,);
  }

  static Future<List<Pokemon>> pokemons() async {
    Database database = await _openDB();

    final List<Map<String, dynamic>> pokemonsMap =
        await database.query("pokemons");

    return List.generate(
        pokemonsMap.length,
        (index) => Pokemon(
            name: pokemonsMap[index]['name'],
            id: pokemonsMap[index]['id'],));
  }
}
