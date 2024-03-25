class Activity {
  final int id;
  final String name;
  final String imagePath;
  final String date;
  final String price;
  final int gymId;

  Activity({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.date,
    required this.price,
    required this.gymId,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'imagePath': imagePath,
    'date': date,
    'price': price,
    'gymId': gymId,
  };

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
    id: json['id'],
    name: json['name'],
    imagePath: json['imagePath'],
    date: json['date'],
    price: json['price'],
    gymId: json['gymId'],
  );
}