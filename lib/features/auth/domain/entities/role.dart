import 'package:restaurant_app/features/auth/domain/entities/user.dart';

class Role  {
  final int id;
  final Roles name;
  final String description;

  Role({
    required this.id,
    required this.name,
    required this.description,
  });

}