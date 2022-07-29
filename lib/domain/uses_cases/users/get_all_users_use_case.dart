import 'package:app_flutter_test_users/domain/entities/users/user.dart';
import 'package:app_flutter_test_users/domain/repositories/users/users_repository.dart';

class GetAllUsersUseCase {
  late final UsersRepository usersRepository;
  GetAllUsersUseCase(this.usersRepository);
  ///*
  ///Method to consult all users
  ///*
  Future<List<User>> invoke() async {
    return await usersRepository.getUsers();
  }
}