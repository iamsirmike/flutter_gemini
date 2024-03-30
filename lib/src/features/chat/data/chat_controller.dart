import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:map_chat/src/features/chat/domain/chat_model.dart';
import 'package:map_chat/src/utils/base_provider.dart';

class ChatController extends BaseProvider {
  String? _generatedResponse;
  String? get generatedResponse => _generatedResponse;

  final List<ChatModel> _chats = [];
  List<ChatModel> get chats => _chats;

  Future<void> generateResponse(String message) async {
    final apiKey = dotenv.env['GEMINI_KEY'];

    setState(ViewState.Busy);
    final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey!);
    final content = [
      Content.text(
        message,
      )
    ];

    final response = await model.generateContent(content);

    _chats.add(
      ChatModel(
          message: message,
          response: response.text ?? "Error getting response"),
    );
    _generatedResponse = response.text ?? "";
    setState(ViewState.Idle);

    notifyListeners();
  }
}
