class Educator {
  final int id;
  final String name;
  final String imagePath;
  final String phoneNumber;
  final int gymId;

  Educator({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.phoneNumber,
    required this.gymId,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'imagePath': imagePath,
    'phoneNumber': phoneNumber,
    'gymId': gymId,
  };

  factory Educator.fromJson(Map<String, dynamic> json) => Educator(
    id: json['id'],
    name: json['name'],
    imagePath: json['imagePath'],
    phoneNumber: json['phoneNumber'],
    gymId: json['gymId'],
  );
}