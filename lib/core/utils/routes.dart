import 'package:app_flutter_test_users/presentation/ui/home/home_screen.dart';
import 'package:app_flutter_test_users/presentation/ui/users/user_detail_screen.dart';
import 'package:app_flutter_test_users/presentation/ui/users/users_screen.dart';
import 'package:flutter/material.dart';

final routes = Routes();
class Routes {
  ///go to Home Screen
  openHomeScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(PageRouteBuilder(pageBuilder: (BuildContext context, _, __) => const HomePage()));
  }
  ///go to Users Screen
  openUsersScreen(BuildContext context) {
    Navigator.of(context).push(PageRouteBuilder(pageBuilder: (BuildContext context, _, __) => const UsersPage()));
  }
  ///go to Detail User Screen
  openDetailUserScreen(BuildContext context) {
    Navigator.of(context).push(PageRouteBuilder(pageBuilder: (BuildContext context, _, __) => const UsersDetailPage()));
  }
}