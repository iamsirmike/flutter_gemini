import 'package:map_chat/src/utils/base_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends BaseProvider {
  // Get a reference your Supabase client
  final supabase = Supabase.instance.client;

  User? _user;
  User? get user => _user;

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    final AuthResponse res = await supabase.auth.signUp(
      email: email,
      password: password,
    );
    _user = res.user;
    notifyListeners();
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    final AuthResponse res = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    _user = res.user;
    notifyListeners();
  }

  Future<void> getCurrentUser() async {
    _user = supabase.auth.currentUser;
    notifyListeners();
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
    _user = null;
    notifyListeners();
  }
}
