import 'package:restaurant_app/features/auth/domain/entities/user.dart';
import 'package:restaurant_app/features/users/domain/datasources/users_datasource.dart';
import 'package:restaurant_app/features/users/domain/repositories/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersDatasource dataSource;

  UsersRepositoryImpl({required this.dataSource});

  @override
  Future<List<User>> getUsers() async {
    return dataSource.getUsers();
  }
  
  @override
  Future<User> getUserById(String id) {
    return dataSource.getUserById(id);
  }
}