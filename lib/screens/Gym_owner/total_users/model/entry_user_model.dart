class GymEntry {
  final int id;
  final int userId;
  final int gymId;
  final DateTime entryTime;

  GymEntry({
    required this.id,
    required this.userId,
    required this.gymId,
    required this.entryTime,
  });

  factory GymEntry.fromJson(Map<String, dynamic> json) {
    return GymEntry(
      id: json['id'] as int,
      userId: json['userId'] as int,
      gymId: json['gymId'] as int,
      entryTime: DateTime.parse(json['entryTime'] as String),
    );
  }
}
