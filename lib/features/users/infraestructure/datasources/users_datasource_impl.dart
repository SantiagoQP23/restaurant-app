import 'package:dio/dio.dart';
import 'package:restaurant_app/config/config.dart';
import 'package:restaurant_app/features/auth/domain/entities/user.dart';
import 'package:restaurant_app/features/auth/infraestructure/models/user_model.dart';
import 'package:restaurant_app/features/users/domain/datasources/users_datasource.dart';

class UsersDatasourceImpl implements UsersDatasource {
  late final Dio dio;
  final String accessToken;

  UsersDatasourceImpl({required this.accessToken})
      : dio = Dio(BaseOptions(
          baseUrl: Environment.apiUrl,
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ));

  @override
  Future<User> getUserById(String id) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getUsers() async {
    try {
      final response = await  dio.get('/users');
      final users = response.data['users'] as List;
      return users.map((user) {
        final userModel = UserModel.fromJson(user);
        return userModel.toEntity();
      }).toList();
    } on DioException catch (e) {
      throw Exception();
    }
  }
}