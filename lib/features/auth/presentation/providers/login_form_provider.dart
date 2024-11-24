import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:restaurant_app/features/shared/infraestructure/inputs/inputs.dart';

import 'auth_provider.dart';

final loginFormProvider = StateNotifierProvider<LoginFormNotifier, LoginFormState>((ref){
  final loginUserCallback = ref.watch(authProvider.notifier).loginUser;
  return LoginFormNotifier(loginUserCallback: loginUserCallback);

    });

class LoginFormNotifier extends StateNotifier<LoginFormState> {
  final Function(String email, String password) loginUserCallback;

  LoginFormNotifier({required this.loginUserCallback})
      : super(LoginFormState());

  // onEmailChange(String value) {
  //   final newEmail = Email.dirty(value);
  //   state = state.copyWith(
  //       email: newEmail, 
  //       // isValid: Formz.validate([newEmail, state.password])
  //       isValid: true
  //       );
  // }

  onUsernameChange(String value) {
    state = state.copyWith(username: value);
  }

  onPasswordChange(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
        password: newPassword,
        isValid: Formz.validate([ newPassword]));
  }

  onFormSubmit() async {
    _touchEveryField();
    if (!state.isValid) return;

    state = state.copyWith(isPosting: true);

    await loginUserCallback(state.username, state.password.value);

    state = state.copyWith(isPosting: false);
  }

  _touchEveryField() {
    // final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    state = state.copyWith(
        // email: email,
        password: password,
        isFormPosted: true,
        isValid: true
        // isValid: Formz.validate([email, password])
        );
  }
}

class LoginFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  // final Email email;
  final String username;
  final Password password;

  LoginFormState(
      {this.isPosting = false,
      this.isFormPosted = false,
      this.isValid = false,
      this.username = '',
      // this.email = const Email.pure(),
      this.password = const Password.pure()});

  LoginFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    // Email? email,
    Password? password,
    String? username,
  }) =>
      LoginFormState(
        isPosting: isPosting ?? this.isPosting,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        username: username ?? this.username,
        // email: email ?? this.email,
        password: password ?? this.password,
      );
}
