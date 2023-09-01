class User {
  String? userId;
  String? username;
  String? password;
  String? phoneNumber;
  String? email;
  String? address;

  User(
    this.userId,
    this.username,
    this.password,
    this.phoneNumber,
    this.email,
    this.address,
  );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'username': username,
        'password': password,
        'phone_number': phoneNumber,
        'email': email,
        'address': address,
      };

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['user_id'],
      json['username'],
      json['password'],
      json['phone_number'],
      json['email'],
      json['address'],
    );
  }
}
