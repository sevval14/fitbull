class Activity {
  final int id;
  final String name;
  final String description;
  final String imagePath;

  Activity({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'imagePath': imagePath,
  };

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    imagePath: json['imagePath'],
  );
}