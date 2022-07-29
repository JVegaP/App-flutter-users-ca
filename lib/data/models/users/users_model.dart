import 'package:app_flutter_test_users/data/models/users/user_model.dart';
import 'package:app_flutter_test_users/domain/entities/users/user.dart';
import 'package:app_flutter_test_users/domain/entities/users/users.dart';

class UsersModel extends Users {
  UsersModel({
    required int page,
    required int perPage,
    required int total,
    required int totalPages,
    required List<User> data
  }) : super(
      page: page,
      perPage: perPage,
      total: total,
      totalPages: totalPages,
      data: data
  );

  factory UsersModel.fromJson(Map<dynamic, dynamic> parsedJson) {
    return UsersModel(
      page: parsedJson['page'],
      perPage: parsedJson['per_page'],
      total: parsedJson['total'],
      totalPages: parsedJson['total_pages'],
      data: List<UserModel>.from(parsedJson['data'].map((data) => UserModel.fromJson(data))),
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataResponse = <String, dynamic>{};
    dataResponse['page'] = page;
    dataResponse['per_page'] = perPage;
    dataResponse['total'] = total;
    dataResponse['total_pages'] = totalPages;
    dataResponse['data'] = List<dynamic>.from(data.map((data) => data));
    return dataResponse;
  }
}