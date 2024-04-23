class Login{
  final String email;
  final String password;
  final int gymId;

  Login({required this.email, required this.password, required this.gymId});

  Map<String , dynamic> toJson() =>{
    "email" : email,
    "password" : password,
    "gymId" : gymId,

  };
}