class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.isAdmin,
    required this.token,
  });

  final String id;
  final String name;
  final String email;
  final String password;
  final bool isAdmin;
  final String token;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    isAdmin: json["isAdmin"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "password": password,
    "isAdmin": isAdmin,
    "token": token,
  };
}