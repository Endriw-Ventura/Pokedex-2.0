class Pokemon {
  final int id;
  final String name;
  final String image;
  final String num;
  final List<String> type;

  factory Pokemon.fromMap(Map<String, dynamic> json){
    return Pokemon(
      name: json['name'],
      image: json['img'],
      type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
      num: json['num'],
      id: json['id'],
    );
  }

  Pokemon(
      {required this.name, required this.image, required this.type, required this.num, required this.id});

}