import 'dart:convert';
import 'package:app_flutter_test_users/core/utils/preferences.dart';
import 'package:app_flutter_test_users/core/utils/routes.dart';
import 'package:app_flutter_test_users/domain/entities/users/user.dart';
import 'package:app_flutter_test_users/presentation/provider/users/users_provider.dart';
import 'package:app_flutter_test_users/presentation/ui/users/widgets/list_users.dart';
import 'package:app_flutter_test_users/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);
  @override
  Users createState()=> Users();
}

class Users extends State<UsersPage> {
  late UsersProvider provider;
  final prefs = Preferences();

  @override
  void initState() {
    provider = Provider.of<UsersProvider>(context,listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      _loadUsers();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<UsersProvider>(this.context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Padding(padding: const EdgeInsets.only(top: 80),
                    child: listUsers(
                        context,
                        provider.users,
                        _openDetailUser
                    )
                ),
                Column(
                  children: [
                    appBar(context, true, true, _saveUsers),
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }


  /// Method for load all users
  _loadUsers() async{
    provider.loadAllUsers();
  }

  /// Method for save user db local
  _saveUsers() {
    if(provider.users.isNotEmpty) {
      if(prefs.users == "0") {
        prefs.users = jsonEncode(provider.users);
      }
    }
  }

  /// Method open detail user screen
  _openDetailUser(User user) async{
    provider.detailUser(user.email);
    routes.openDetailUserScreen(context);
  }

}