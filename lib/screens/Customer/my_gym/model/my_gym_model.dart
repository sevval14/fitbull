class GymUser {
  final int id;
  final String userName;
  final String email;
  final int entryId;

  GymUser({
    required this.id,
    required this.userName,
    required this.email,
    required this.entryId,
  });

  factory GymUser.fromJson(Map<String, dynamic> json) {
    return GymUser(
      id: json['id'],
      userName: json['userName'],
      email: json['email'],
      entryId: json['entryId'],
    );
  }
}