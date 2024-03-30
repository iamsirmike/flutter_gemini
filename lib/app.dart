import 'package:flutter/material.dart';
import 'package:map_chat/src/features/authentication/data/auth_controller.dart';
import 'package:map_chat/src/features/chat/data/chat_controller.dart';
import 'package:map_chat/src/splash.dart';
import 'package:map_chat/src/utils/base_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthController>(create: (_) => AuthController()),
        ChangeNotifierProvider<BaseProvider>(create: (_) => BaseProvider()),
        ChangeNotifierProvider<ChatController>(create: (_) => ChatController()),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          scaffoldBackgroundColor: const Color(0xFF0a0d14),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
