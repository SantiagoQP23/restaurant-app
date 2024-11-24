import 'package:restaurant_app/features/auth/domain/domain.dart';
import 'package:restaurant_app/features/auth/infraestructure/data_sources/auth_datasource_impl.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl({AuthDataSource? dataSource})
      : dataSource = dataSource ?? AuthDataSourceImpl();

  @override
  Future<LoginResponseDto> checkAuthStatus(String token) {
    return dataSource.checkAuthStatus(token);
  }

  @override
  Future<LoginResponseDto> login(String email, String password) {
    return dataSource.login(email, password);
  }

  @override
  Future<LoginResponseDto> register(
      String email, String password, String fullName) {
    return dataSource.register(email, password, fullName);
  }
}
