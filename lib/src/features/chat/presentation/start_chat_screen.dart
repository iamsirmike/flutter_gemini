import 'package:flutter/material.dart';
import 'package:map_chat/src/features/chat/data/chat_controller.dart';
import 'package:map_chat/src/features/chat/presentation/widgets/chat.dart';
import 'package:map_chat/src/features/chat/presentation/widgets/empty_chat.dart';
import 'package:map_chat/src/utils/base_provider.dart';
import 'package:map_chat/src/widgets/ai_textformfield.dart';
import 'package:provider/provider.dart';

class StartChatScreen extends StatefulWidget {
  const StartChatScreen({
    super.key,
  });

  @override
  State<StartChatScreen> createState() => _ChatState();
}

class _ChatState extends State<StartChatScreen> {
  final _formKey = GlobalKey<FormState>();
  final messageTextController = TextEditingController();

  late ChatController _chatController;

  @override
  Widget build(BuildContext context) {
    _chatController = context.watch<ChatController>();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0XFF111728),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(0XFF959DAE),
            ),
          ),
          title: const Text("StartChatScreen"),
          titleTextStyle: const TextStyle(
            color: Color(0XFF959DAE),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: _chatController.chats.isEmpty
                  ? SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                            ),
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: const Color(0XFF324EFF),
                              child: Image.asset(
                                'assets/images/logo2.png',
                                height: 60,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const EmptyChatItem(
                              text: 'I am artificial intelligence',
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const EmptyChatItem(
                              text: 'make easy articles with Ai.',
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const EmptyChatItem(
                              text:
                                  'As an AI language model, I don\'t have personal emotions or physical sensations. ',
                            ),
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _chatController.chats.length,
                      itemBuilder: (context, index) {
                        final chat = _chatController.chats[index];
                        return ChatWidget(
                          generatedResponse: chat.response,
                          message: chat.message,
                        );
                      },
                    ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                  key: _formKey,
                  child: Row(
                    children: [
                      Expanded(
                        child: AiTextFormField(
                          hintText: 'Write your message',
                          controller: messageTextController,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          radius: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      _chatController.state == ViewState.Busy
                          ? const CircularProgressIndicator(
                              color: Color(0XFF324EFF),
                            )
                          : GestureDetector(
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  FocusScope.of(context).unfocus();
                                  await _chatController.generateResponse(
                                      messageTextController.text);
                                  messageTextController.clear();
                                }
                              },
                              child: const CircleAvatar(
                                radius: 28,
                                backgroundColor: Color(0XFF324EFF),
                                child: Icon(
                                  Icons.send_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            )
                    ],
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
