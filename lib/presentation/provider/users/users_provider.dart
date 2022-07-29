import 'dart:convert';
import 'dart:io';
import 'package:app_flutter_test_users/core/utils/preferences.dart';
import 'package:app_flutter_test_users/data/models/users/user_model.dart';
import 'package:app_flutter_test_users/data/sources/remote_source/users/users_data_source.dart';
import 'package:app_flutter_test_users/domain/entities/users/user.dart';
import 'package:app_flutter_test_users/domain/uses_cases/users/get_all_users_use_case.dart';
import 'package:flutter/material.dart';

final prefs = Preferences();
class UsersProvider with ChangeNotifier {
  late GetAllUsersUseCase getAllUsersUseCase;
  late UsersDataSource usersDataSource;
  UsersProvider() {
    usersDataSource = UsersDataSource();
    getAllUsersUseCase = GetAllUsersUseCase(usersDataSource);
  }

  final List<User> _users =  <User>[];
  List<User> get users {
    return _users;
  }
  set users (List<User> users) {
    _users.clear();
    _users.addAll(users);
    notifyListeners();
  }
  /// Load all users
  loadAllUsers() async{
    users = await getAllUsersUseCase.invoke();
  }

  late User _user;
  User get user {
    return _user;
  }
  set user (User user) {
    _user = user;
    notifyListeners();
  }
  /// Load detail user
  detailUser(String email) async{
    if(prefs.users!="0") {
      var decodeJSON = jsonDecode(prefs.users);
      List<User> usersTemp = <User>[];
      decodeJSON.forEach((item) => usersTemp.add(UserModel.fromJson(item)));
      for(var it in usersTemp) {
        if(it.email == email) {
          user = it;
        }
      }
    }
  }

  late File _selectedImage;
  File get selectedImage {
    return _selectedImage;
  }
  set selectedImage (File selectedImage) {
    _selectedImage = selectedImage;
    notifyListeners();
  }

  bool _imageLoad = false;
  bool get imageLoad {
    return _imageLoad;
  }
  set imageLoad (bool imageLoad) {
    _imageLoad = imageLoad;
    notifyListeners();
  }
}