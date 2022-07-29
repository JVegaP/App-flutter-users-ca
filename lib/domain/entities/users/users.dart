import 'package:app_flutter_test_users/domain/entities/users/user.dart';

class Users{
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<User> data;
  Users({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data
  });
}