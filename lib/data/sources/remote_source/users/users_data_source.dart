import 'dart:convert';
import 'dart:io';
import 'package:app_flutter_test_users/data/models/users/users_model.dart';
import 'package:app_flutter_test_users/domain/repositories/users/users_repository.dart';
import 'package:http/http.dart' as http;
import 'package:app_flutter_test_users/domain/entities/users/user.dart';

class UsersDataSource extends UsersRepository {

  ///*
  ///Call to the api that consumes all the characters
  ///*
  @override
  Future<List<User>> getUsers() async {
    try {
      final response = await http.get(Uri.parse('https://reqres.in/api/users'))
          .timeout(const Duration(seconds: 30));
      if(response.body.isNotEmpty) {
        return UsersModel.fromJson(jsonDecode(response.body)).data;
      } else {
        throw Exception('No fue posible obtener la información.');
      }
    } on SocketException catch (_) {
      throw Exception('Ocurrio un error.');
    }
  }
}