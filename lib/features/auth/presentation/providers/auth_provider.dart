import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_app/features/auth/domain/domain.dart';
import 'package:restaurant_app/features/auth/infraestructure/repositories/auth_repository_impl.dart';
import 'package:restaurant_app/features/shared/infraestructure/services/preferences_service.dart';
import 'package:restaurant_app/features/shared/infraestructure/services/preferences_service_impl.dart';

enum AuthStatus { checking, authenticated, unauthenticated }

final AuthProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImpl();
  final preferencesService = PreferencesServiceImpl();

  return AuthNotifier(
      authRepository: authRepository, preferencesService: preferencesService);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;
  final PreferencesService preferencesService;

  AuthNotifier({required this.authRepository, required this.preferencesService})
      : super(AuthState());

  void checkAuthStatus() async {
    final token = await preferencesService.getValue<String>(Preferences.token);
    if (token == null) {
      return logout();
    }

    try {
      final user = await authRepository.checkAuthStatus(token);
      _setLoggedUser(token);
    } catch (e) {
      logout();
    }
  }

  void _setLoggedUser(
    String token,
  ) async {
    await preferencesService.setKeyValue(Preferences.token, token);
    state = state.copyWith(authStatus: AuthStatus.authenticated, token: token);
  }

  void loginUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  void registerUser(String email, String password, String fullName) async {}

  Future<void> logout() async {
    await preferencesService.removeKey(Preferences.token);
    state = state.copyWith(authStatus: AuthStatus.unauthenticated);
  }
}

class AuthState {
  final AuthStatus authStatus;
  final String? token;
  final String errorMessage;

  AuthState(
      {this.authStatus = AuthStatus.checking,
      this.token,
      this.errorMessage = ''});

  AuthState copyWith({
    AuthStatus? authStatus,
    String? token,
    String? errorMessage,
  }) =>
      AuthState(
        authStatus: authStatus ?? this.authStatus,
        token: token ?? this.token,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
