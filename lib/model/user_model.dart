class UserModel {
  final String? id;
  final String? email;
  final String? firstName;
  final String? lastName;

  UserModel({this.id, this.email, this.firstName, this.lastName});

  factory UserModel.fromJson(json) {
    return UserModel(
        id: json['id'],
        email: json['email'],
        firstName: json['firstName'],
        lastName: json['lastName']);
  }
}
