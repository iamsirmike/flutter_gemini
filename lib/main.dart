import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:map_chat/app.dart';
import 'package:map_chat/src/utils/shared_pref.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadAppData();
  runApp(const MyApp());
}

Future<void> loadAppData() async {
  final prefs = AppPreferences();
  await prefs.init();
  await dotenv.load(fileName: ".env");
  final url = dotenv.env['SUPABASE_URL'];
  final anonKey = dotenv.env['SUPABASE_KEY'];

  await Supabase.initialize(
    url: '$url',
    anonKey: '$anonKey',
  );

}
