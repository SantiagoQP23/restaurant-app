class LoginResponseDto {
  final String token;

  LoginResponseDto({required this.token});

  bool get isAdmin {
    return token == 'admin';
  }
}
