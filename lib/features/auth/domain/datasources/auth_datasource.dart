import '../entities/login_response_dto.dart';

abstract class AuthDataSource {
  Future<LoginResponseDto> login(String email, String password);

  Future<LoginResponseDto> register(
      String email, String password, String fullName);

  Future<LoginResponseDto> checkAuthStatus(String token);
}
