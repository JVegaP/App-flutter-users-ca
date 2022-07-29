import 'package:app_flutter_test_users/domain/entities/users/user.dart';

class UserModel extends User {
  UserModel({
    required int id,
    required String email,
    required String firstName,
    required String lastName,
    required String avatar
  }) : super(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      avatar: avatar
  );

  factory UserModel.fromJson(Map<dynamic, dynamic> parsedJson) {
    return UserModel(
      id: parsedJson['id'],
      email: parsedJson['email'].toString(),
      firstName: parsedJson['first_name'].toString(),
      lastName: parsedJson['last_name'].toString(),
      avatar: parsedJson['avatar'].toString()
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar'] = avatar;
    return data;
  }
}