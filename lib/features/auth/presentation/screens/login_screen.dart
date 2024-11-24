import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/features/auth/presentation/providers/providers.dart';
import 'package:restaurant_app/features/shared/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      body: Container(
          padding: const EdgeInsets.all(16),
          child: const Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 36),
              LoginForm()
            ],
          )),
    );
  }
}

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends ConsumerState<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  onChangePasswordVisibility() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final loginForm = ref.watch(loginFormProvider);

    ref.listen(authProvider, (previous, next) {
      if (next.errorMessage.isEmpty) return;
      showSnackbar(context, next.errorMessage);
    });

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // const Text('Email', style: TextStyle(fontWeight: FontWeight.bold)),
          CustomTextFormField(
            label: 'Enter your email',
            keyboardType: TextInputType.name,
          
            onChanged: ref.read(loginFormProvider.notifier).onUsernameChange,
            // errorMessage:
            //     loginForm.isFormPosted ? loginForm.email.errorMessage : null,
          ),
          SizedBox.fromSize(size: const Size.fromHeight(16)),
          // const Text('Password', style: TextStyle(fontWeight: FontWeight.bold)),
          CustomTextFormField(
            obscureText: passwordVisible,
            label: 'Enter your password',
            onChanged: ref.read(loginFormProvider.notifier).onPasswordChange,
            keyboardType: TextInputType.visiblePassword,
            // decoration: InputDecoration(
            //   hintText: 'Enter your password',
            //   suffixIcon: IconButton(
            //       onPressed: onChangePasswordVisibility,
            //       icon: Icon(passwordVisible
            //           ? Icons.visibility
            //           : Icons.visibility_off)),
            // ),
            onFieldSubmitted: (_) => ref.read(loginFormProvider.notifier).onFormSubmit(),
          ),
          SizedBox.fromSize(size: const Size.fromHeight(16)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.blue),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          SizedBox.fromSize(size: const Size.fromHeight(16)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(
                  double.infinity, 50), // Set minimum width and height
            ),
            onPressed: loginForm.isPosting
                ? null
                : ref.read(loginFormProvider.notifier).onFormSubmit,
            child: const Text('Login'),
          ),
          SizedBox.fromSize(size: const Size.fromHeight(26)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Don\'t have an account?'),
              TextButton(
                onPressed: () {
                  context.go('/signup');
                },
                child: const Text(
                  'Sign up',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
