import 'package:flutter/material.dart';
import 'package:map_chat/src/features/authentication/data/auth_controller.dart';
import 'package:map_chat/src/features/authentication/presentation/signup_screen.dart';
import 'package:map_chat/src/utils/base_provider.dart';
import 'package:map_chat/src/utils/operation_runner.dart';
import 'package:map_chat/src/widgets/ai_textformfield.dart';
import 'package:map_chat/src/widgets/button/custom_button.dart';
import 'package:map_chat/src/widgets/button_loading.dart';
import 'package:map_chat/src/widgets/new_nav.dart';
import 'package:provider/provider.dart';

class LoginSscreen extends StatefulWidget {
  const LoginSscreen({super.key});

  @override
  State<LoginSscreen> createState() => _LoginSscreenState();
}

class _LoginSscreenState extends OperationRunnerState<LoginSscreen> {
  final _formKey = GlobalKey<FormState>();

  late AuthController _authController;
  late BaseProvider _baseProvider;

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    _authController = context.watch<AuthController>();
    _baseProvider = context.watch<BaseProvider>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                const Text(
                  'Hello Again!',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  'Welcome Back You’ve been \nmissed',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                AiTextFormField(
                  onChanged: (value) {
                    email = value.trim();
                  },
                  hintText: 'michaelasamoah@gmail.com',
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Color(
                      0XFF959DAE,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AiTextFormField(
                  onChanged: (value) {
                    password = value.trim();
                  },
                  hintText: 'Password',
                  obscureText: true,
                  maxLines: 1,
                  prefixIcon: const Icon(
                    Icons.lock_outline_sharp,
                    color: Color(
                      0XFF959DAE,
                    ),
                  ),
                  suffixIcon: const Icon(
                    Icons.remove_red_eye_outlined,
                    color: Color(
                      0XFF959DAE,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Forgot Password?',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 50,
                ),
                PrimaryButton(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      await signIn(email!, password!);
                    }
                  },
                  lableText: 'Sign In',
                  label: _baseProvider.state == ViewState.Busy
                      ? const ButtonLoadingIndicator()
                      : null,
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SingUpScreen(),
                      ),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'Don\'t Have Account? ',
                      style: TextStyle(
                        color: Color(0XFF777B8A),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign Up ',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF324EFF),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signIn(String email, String password) async {
    await runOperation<void>(() async {
      await _authController.signIn(email: email, password: password);
    });

    if (_authController.user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MyBottomNavigationBar(),
        ),
      );
    }
  }
}
