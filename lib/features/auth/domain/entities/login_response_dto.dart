import 'package:restaurant_app/features/auth/domain/entities/user.dart';

class LoginResponseDto {
  final String token;
  final User user;

  LoginResponseDto({required this.token, required this.user});

  bool get isAdmin {
    return user.role == Roles.admin;
  }

  bool get isWaiter {
    return user.role == Roles.waiter;
  }

  bool get isCook {
    return user.role == Roles.cook;
  }
}
