class User {
  late int userId;
  late String name;
  late String? email;
  late String mobile;
  late String image;

  User({
    required this.userId,
    required this.name,
    this.email,
    required this.mobile,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json["userId"],
      name: json["name"],
      email: json["email"],
      mobile: json["mobileNo"],
      image: json["image"],
    );
  }
}
