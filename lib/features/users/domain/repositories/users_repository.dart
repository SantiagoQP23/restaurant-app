
import 'package:restaurant_app/features/auth/domain/entities/user.dart';

abstract class UsersRepository {
  Future<User> getUserById(String id);
  Future<List<User>> getUsers();
}