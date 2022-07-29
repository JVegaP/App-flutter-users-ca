import 'package:app_flutter_test_users/domain/entities/users/user.dart';

abstract class UsersRepository {
  ///*
  ///Implementation of method to consult all users
  ///*
  Future<List<User>> getUsers();
}