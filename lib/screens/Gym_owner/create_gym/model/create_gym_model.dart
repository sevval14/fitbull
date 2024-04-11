class Gym {
  final int id;
  final String name;
  final String location;
  final String imagePath;
  final String capacity;
  final String startHour;
  final String endHour;
  final String taxNumber;
  final String? webSite; // webSite opsiyonel olabilir

  Gym({
    required this.id,
    required this.name,
    required this.location,
    required this.imagePath,
    required this.capacity,
    required this.startHour,
    required this.endHour,
    required this.taxNumber,
    this.webSite, // Opsiyonel olduğu için required değil
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'imagePath': imagePath,
      'capacity': capacity,
      'startHour': startHour,
      'endHour': endHour,
      'taxNumber': taxNumber,
      'webSite': webSite, // null olabilir, JSON'da görünecek ama değeri null olabilir
    };
  }

  factory Gym.fromJson(Map<String, dynamic> json) {
    return Gym(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      imagePath: json['imagePath'],
      capacity: json['capacity'],
      startHour: json['startHour'],
      endHour: json['endHour'],
      taxNumber: json['taxNumber'],
      webSite: json['webSite'], // Opsiyonel alanlar için null kontrolü yapmaya gerek yok
    );
  }
}
