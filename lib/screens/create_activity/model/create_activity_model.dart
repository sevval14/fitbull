class Activity {
  final int id;
  final String name;
  final String description;
  final int gymId;

  Activity({
    required this.id,
    required this.name,
    required this.description,
    required this.gymId,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'gymId': gymId,
  };

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    gymId: json['gymId'],
  );
}