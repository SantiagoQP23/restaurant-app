import 'package:restaurant_app/features/auth/domain/entities/role.dart';
import 'package:restaurant_app/features/shared/domain/entities/person.dart';

enum Roles { admin, waiter, cook }

class User {
  final String id;
  final String username;
  final Person person;
  final bool online;
  final Role role;

  User({
    required this.id,
    required this.username,
    required this.person,
    required this.online,
    required this.role,
  });
}
