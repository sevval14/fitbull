

import 'package:fitbull/screens/create_activity/model/create_activity_model.dart';
import 'package:fitbull/screens/create_educator/model/create_educator_model.dart';

class Gym {
  final int id;
  final String name;
  final String location;
  final String imagePath;
  final String capacity;

  Gym({
    required this.id,
    required this.name,
    required this.location,
    required this.imagePath,
    required this.capacity,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'imagePath': imagePath,
      'capacity': capacity,
    };
  }

  factory Gym.fromJson(Map<String, dynamic> json) {
    return Gym(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      imagePath: json['imagePath'],
      capacity: json['capacity'],
    );
  }
}