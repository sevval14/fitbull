class Equipment {
  final int id;
  final String name;
  final int gymId;

  Equipment({
    required this.id,
    required this.name,
    required this.gymId,

  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'gymId': gymId,

  };

  factory Equipment.fromJson(Map<String, dynamic> json) => Equipment(
    id: json['id'],
    name: json['name'],
    gymId: json['gymId'],

  );
}