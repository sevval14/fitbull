class Register{
  final String email;
  final String username;
  final String password;

  Register({required this.username, required this.email, required this.password});

  Map<String , dynamic> toJson() =>{
    "email" : email,
    "username" : username,
    "password" : password,
  };
}