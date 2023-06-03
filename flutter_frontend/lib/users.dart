class Users {
  String username;
  String password;
  String gender;
  String age;

  Users(
    this.username,
    this.password,
    this.gender,
    this.age,
  );

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'gender': gender,
        'age': age,
      };

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      json['username'],
      json['password'],
      json['gender'],
      json['age'],
    );
  }
}
