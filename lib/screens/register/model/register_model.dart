class Register {
  final int id;
  final String email;
  final String username;
  final String password;

  Register({required this.id,required this.username, required this.email, required this.password});

  Map<String, dynamic> toJson() => {
    "id":id,
    "email": email,
    "username": username,
    "password": password,
  };

  factory Register.fromJson(Map<String, dynamic> json) {
    return Register(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
    );
  }
}
