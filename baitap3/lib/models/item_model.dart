class Item {
  final String id;
  final String name;
  final int age;
  final String email;

  Item({
    required this.id,
    required this.name,
    required this.age,
    required this.email,
  });

  Item copyWith({
    String? id,
    String? name,
    int? age,
    String? email,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      email: email ?? this.email,
    );
  }
}