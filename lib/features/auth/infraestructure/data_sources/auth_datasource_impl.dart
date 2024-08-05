import 'package:dio/dio.dart';
import 'package:restaurant_app/config/config.dart';
import 'package:restaurant_app/features/auth/domain/domain.dart';
import 'package:restaurant_app/features/auth/infraestructure/errors/auth_errors.dart';
import 'package:restaurant_app/features/auth/infraestructure/models/login_response_model.dart';

class AuthDataSourceImpl extends AuthDataSource {

  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.apiUrl,
    )
  );
  
  @override
  Future<void> checkAuthStatus(String token) {
    // TODO: implement checkAuthStatus
    throw UnimplementedError();
  }

  @override
  Future<LoginResponseDto> login(String email, String password) async {
    try {
      final response = await dio.post('/auth/login', data: {
        'email': email,
        'password': password
      });

      final loginResponse = LoginResponseModel.fromJson(response.data);
      
      return LoginResponseDto(token: loginResponse.token);

    } catch (e) {
      throw WrongCredentials();
    }
  }

  @override
  Future<LoginResponseDto> register(String email, String password, String fullName) {
    // TODO: implement register
    throw UnimplementedError();
  }

}