class GymEntry {
  final int id;
  final int userId;
  final int gymId;
  final DateTime entryTime;
  final String startWeight;
  final String goalWeight;
  final List<String> selectedDays;
  final String gymName;
  final String gymLocation;
  final String startHour;
  final String endHour;

  GymEntry({
    required this.id,
    required this.userId,
    required this.gymId,
    required this.entryTime,
    required this.startWeight,
    required this.goalWeight,
    required this.selectedDays,
    required this.gymName,
    required this.gymLocation,
    required this.startHour,
    required this.endHour,
  });

  factory GymEntry.fromJson(Map<String, dynamic> json) {
    return GymEntry(
      id: json['id'],
      userId: json['userId'] ,
      gymId: json['gymId'],
      entryTime: DateTime.parse(json['entryTime'] ),
      startWeight: json['startWeight'] ,
      goalWeight: json['goalWeight'] ,
      selectedDays: List<String>.from(json['selectedDays']),
      gymName: json['gymName'] ,
      gymLocation: json['gymLocation'],
      startHour: json['startHour'],
      endHour: json['endHour'],
    );
  }
}
