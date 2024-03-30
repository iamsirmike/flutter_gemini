import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:share_plus/share_plus.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
    required this.message,
    required this.generatedResponse,
  });

  final String message;
  final String generatedResponse;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 15,
          ),
      
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 30),
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: const Color(0XFF324EFF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
      
          const SizedBox(
            height: 20,
          ),
      
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 25,
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: const Color(0XFF364156),
                child: Image.asset(
                  'assets/images/logo2.png',
                  height: 25,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Share.share(generatedResponse);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 16),
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: const Color(0XFF364156),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: MarkdownBody(
                        data: generatedResponse,
                        styleSheet: MarkdownStyleSheet(
                          p: const TextStyle(color: Colors.white),
                          listBullet: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
      
          // Text(
          //   text,
          //   style: Theme.of(context).textTheme.bodyMedium,
          // ),
        ],
      ),
    );
  }
}