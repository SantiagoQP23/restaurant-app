import 'package:dio/dio.dart';
import 'package:restaurant_app/config/config.dart';
import 'package:restaurant_app/features/auth/domain/domain.dart';
import 'package:restaurant_app/features/auth/infraestructure/errors/auth_errors.dart';
import 'package:restaurant_app/features/auth/infraestructure/models/login_response_model.dart';

class AuthDataSourceImpl extends AuthDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.apiUrl,
  ));

  @override
  Future<LoginResponseDto> checkAuthStatus(String token) async {
    try {
      final response = await dio.get('/auth/auth-renew',
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      final loginResponseModel = LoginResponseModel.fromJson(response.data);

      return loginResponseModel.toEntity();
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError('Token expired');
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<LoginResponseDto> login(String email, String password) async {
    Future.delayed(const Duration(milliseconds: 500));

    try {
      final response = await dio
          .post('/auth/login', data: {'username': email, 'password': password});

      final loginResponseModel = LoginResponseModel.fromJson(response.data);

      return loginResponseModel.toEntity();
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError(e.response?.data['message'] ?? 'Crendenciales incorrectas');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Timeout');
      }
      throw Exception();
    }
    catch (e) {
      throw Exception();
    }
  }

  @override
  Future<LoginResponseDto> register(
      String email, String password, String fullName) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
