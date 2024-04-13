class Services {
  final int id;
  final String name;
  final int gymId;

  Services({
    required this.id,
    required this.name,
    required this.gymId,

  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'gymId': gymId,

  };

  factory Services.fromJson(Map<String, dynamic> json) => Services(
    id: json['id'],
    name: json['name'],
    gymId: json['gymId'],

  );
}