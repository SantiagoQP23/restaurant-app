import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                'Log In',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 36),
              LoginForm()
            ],
          )),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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

  @override
  Widget build(BuildContext context) {
    onSubmitForm() {
      context.go('/home');
      // if (_formKey.currentState!.validate()) {
        // Process data.
      // }
    }

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Email', style: TextStyle(fontWeight: FontWeight.bold)),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          SizedBox.fromSize(size: const Size.fromHeight(16)),
          const Text('Password', style: TextStyle(fontWeight: FontWeight.bold)),
          TextFormField(
            obscureText: passwordVisible,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
              hintText: 'Enter your password',
              suffixIcon: IconButton(
                  onPressed: onChangePasswordVisibility,
                  icon: Icon(passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off)),
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
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
            onPressed: onSubmitForm,
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
