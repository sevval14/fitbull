class UserResponse {
  final int id;
  final String userName;
  final String email;
  late int entryId;

  UserResponse({required this.id, required this.userName, required this.email, required this.entryId});

  Map<String, dynamic> toJson() => {
    "id": id,
    "userName": userName,
    "email": email,
    "entryId": entryId,
  };

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json['id'],
      userName: json['userName'],
      email: json['email'],
      entryId: json['entryId'],
    );
  }
}