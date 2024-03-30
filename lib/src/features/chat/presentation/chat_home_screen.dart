import 'package:flutter/material.dart';
import 'package:map_chat/src/features/chat/presentation/start_chat_screen.dart';
import 'package:map_chat/src/widgets/button/custom_button.dart';

class ChatHomeScreen extends StatelessWidget {
  const ChatHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Ai Buddy'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0a0d14),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Spacer(),
              CircleAvatar(
                radius: 80,
                backgroundColor: const Color(0XFF324EFF),
                child: Image.asset('assets/images/logo2.png'),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Welcome To \nAi Buddy',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'start chatting with Ai Buddy now',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 30,
              ),
              PrimaryButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StartChatScreen(),
                    ),
                  );
                },
                lableText: 'Start Chat',
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
