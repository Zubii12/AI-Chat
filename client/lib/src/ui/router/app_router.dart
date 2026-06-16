import 'package:ai_chat/src/ui/chat/view/chat_page.dart';
import 'package:ai_chat/src/ui/sign_in/view/sign_in_page.dart';
import 'package:flutter/widgets.dart';

abstract class AppRouter {
  static const String signIn = '/';
  static const String chat = '/chat';

  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    signIn: (_) => const SignInPage(),
    chat: (_) => const ChatPage(),
  };
}
