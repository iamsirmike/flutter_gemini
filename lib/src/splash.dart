import 'package:flutter/material.dart';
import 'package:map_chat/src/features/authentication/data/auth_controller.dart';
import 'package:map_chat/src/features/authentication/presentation/login_screen.dart';
import 'package:map_chat/src/widgets/new_nav.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AuthController _authController;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      _authController.getCurrentUser();
      if (_authController.user == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginSscreen(),
          ),
        );
        return;
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MyBottomNavigationBar(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    _authController = context.watch<AuthController>();

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            CircleAvatar(
              radius: 60,
              backgroundColor: const Color(0XFF324EFF),
              child: Image.asset('assets/images/logo2.png'),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Welcome to Ai\n Buddy Pro',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
