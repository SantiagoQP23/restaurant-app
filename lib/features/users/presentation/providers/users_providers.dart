
import 'package:restaurant_app/features/auth/domain/entities/user.dart';
import 'package:restaurant_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:restaurant_app/features/users/domain/repositories/users_repository.dart';
import 'package:restaurant_app/features/users/infraestructure/datasources/users_datasource_impl.dart';
import 'package:restaurant_app/features/users/infraestructure/repositories/users_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users_providers.g.dart';

@riverpod
UsersRepository usersRepository(UsersRepositoryRef ref) {
  final accessToken = ref.watch(authProvider).token ?? '';

  final repository = UsersRepositoryImpl(
      dataSource: UsersDatasourceImpl(accessToken: accessToken));

  return repository;
}

@riverpod
class Users extends _$Users {
  @override
  Future<List<User>> build() async {
    final repository = ref.watch(usersRepositoryProvider);
    return repository.getUsers();
  }
}