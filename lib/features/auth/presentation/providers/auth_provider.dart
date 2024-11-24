import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_app/features/auth/domain/domain.dart';
import 'package:restaurant_app/features/auth/domain/entities/user.dart';
import 'package:restaurant_app/features/auth/infraestructure/errors/auth_errors.dart';
import 'package:restaurant_app/features/auth/infraestructure/repositories/auth_repository_impl.dart';
import 'package:restaurant_app/features/shared/infraestructure/services/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

enum AuthStatus { checking, authenticated, unauthenticated }

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl();
}

// final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
//   final authRepository = AuthRepositoryImpl();
//   final preferencesService = PreferencesServiceImpl();

//   return AuthNotifier(
//       authRepository: authRepository, preferencesService: preferencesService);
// });

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  AuthState build() {
    checkAuthStatus();
    return AuthState();
  }

  void checkAuthStatus() async {
    try {
      final preferencesService = PreferencesServiceImpl();
      final authRepository = ref.watch(authRepositoryProvider);
      final token =
          await preferencesService.getValue<String>(Preferences.token);
      // final token = 'token';
      if (token == null) return logout();

      final loginResponse = await authRepository.checkAuthStatus(token);
      _setLoggedUser(loginResponse.token, loginResponse.user);
    } catch (e) {
      logout();
    }
  }

  void _setLoggedUser(String token, User user) async {
    final preferencesService = PreferencesServiceImpl();
    await preferencesService.setKeyValue(Preferences.token, token);
    state = state.copyWith(
        authStatus: AuthStatus.authenticated, token: token, user: user);
  }

  void loginUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      final authRepository = ref.watch(authRepositoryProvider);
      final loginResponse = await authRepository.login(email, password);
      final token =
      _setLoggedUser(loginResponse.token, loginResponse.user);
    } on CustomError catch (e) {
      logout(e.message);
    } catch (e) {
      logout('Uncontrolled error');
    }
  }

  void registerUser(String email, String password, String fullName) async {}

  Future<void> logout([String? errorMessage]) async {
    // await preferencesService.removeKey(Preferences.token);
    state = state.copyWith(
        authStatus: AuthStatus.unauthenticated,
        token: null,
        user: null,
        errorMessage: errorMessage);
  }
}

// class AuthNotifier extends StateNotifier<AuthState> {
//   final AuthRepository authRepository;
//   final PreferencesService preferencesService;

//   AuthNotifier({required this.authRepository, required this.preferencesService})
//       : super(AuthState()) {
//     checkAuthStatus();
//   }

//   void checkAuthStatus() async {
//     try {
//       final token =
//           await preferencesService.getValue<String>(Preferences.token);
//       // final token = 'token';
//       if (token == null) return logout();

//       final loginResponse = await authRepository.checkAuthStatus(token);
//       _setLoggedUser(loginResponse.token, loginResponse.user);
//     } catch (e) {
//       logout();
//     }
//   }

//   void _setLoggedUser(String token, User user) async {
//     await preferencesService.setKeyValue(Preferences.token, token);
//     state = state.copyWith(
//         authStatus: AuthStatus.authenticated, token: token, user: user);
//   }

//   void loginUser(String email, String password) async {
//     await Future.delayed(const Duration(milliseconds: 500));
//     try {
//       final loginResponse = await authRepository.login(email, password);
//       _setLoggedUser(loginResponse.token, loginResponse.user);
//     } on CustomError catch (e) {
//       logout(e.message);
//     } catch (e) {
//       logout('Uncontrolled error');
//     }
//   }

//   void registerUser(String email, String password, String fullName) async {}

//   Future<void> logout([String? errorMessage]) async {
//     // await preferencesService.removeKey(Preferences.token);
//     state = state.copyWith(
//         authStatus: AuthStatus.unauthenticated,
//         token: null,
//         user: null,
//         errorMessage: errorMessage);
//   }
// }

class AuthState {
  final AuthStatus authStatus;
  final String? token;
  final User? user;
  final String errorMessage;

  AuthState(
      {this.authStatus = AuthStatus.checking,
      this.token,
      this.user,
      this.errorMessage = ''});

  AuthState copyWith({
    AuthStatus? authStatus,
    String? token,
    User? user,
    String? errorMessage,
  }) =>
      AuthState(
        authStatus: authStatus ?? this.authStatus,
        token: token ?? this.token,
        errorMessage: errorMessage ?? this.errorMessage,
        user: user ?? this.user,
      );
}
