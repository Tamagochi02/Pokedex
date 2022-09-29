class Pokemon {
  String name;
  int id;

  Pokemon({required this.name, required this.id,});

  Map<String, dynamic> toMap() {
    return {'name': name, 'id': id};
  }
}
