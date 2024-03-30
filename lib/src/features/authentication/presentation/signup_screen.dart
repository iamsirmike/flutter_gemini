import 'package:flutter/material.dart';
import 'package:map_chat/src/features/authentication/data/auth_controller.dart';
import 'package:map_chat/src/features/authentication/presentation/login_screen.dart';
import 'package:map_chat/src/features/chat/presentation/start_chat_screen.dart';
import 'package:map_chat/src/features/chat/presentation/chat_home_screen.dart';
import 'package:map_chat/src/utils/base_provider.dart';
import 'package:map_chat/src/utils/operation_runner.dart';
import 'package:map_chat/src/widgets/ai_textformfield.dart';
import 'package:map_chat/src/widgets/alert/alert_dialog.dart';
import 'package:map_chat/src/widgets/button/custom_button.dart';
import 'package:map_chat/src/widgets/button_loading.dart';
import 'package:map_chat/src/widgets/new_nav.dart';
import 'package:provider/provider.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends OperationRunnerState<SingUpScreen> {
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
                  'Lets Get Started',
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
                  'Create you account and start using Ai Buddy',
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
                  height: 50,
                ),
                PrimaryButton(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      await signUp(email!, password!);
                    }
                  },
                  lableText: 'Sign Up',
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
                        builder: (context) => const LoginSscreen(),
                      ),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'Already Have Account? ',
                      style: TextStyle(
                        color: Color(0XFF777B8A),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign In ',
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

  Future<void> signUp(String email, String password) async {
    await runOperation<void>(() async {
      await _authController.signUp(email: email, password: password);
    });

    if (_authController.user != null) {
      showAlertDialog(context, 'Successfully \nRegistered',
          subtext:
              'Congratulations, your account has been created. Click on Ok to proceed.',
          imagePath: 'assets/images/success.png', onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MyBottomNavigationBar(),
          ),
        );
      });
    }
  }
}
