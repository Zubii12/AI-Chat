import 'package:ai_chat/src/ui/chat/chat.dart';
import 'package:ai_chat/src/ui/sign_in/sign_in.dart';
import 'package:ai_chat/src/ui/splash/splash.dart';
import 'package:flutter/widgets.dart';

abstract class AppRouter {
  static const String splash = '/';
  static const String signIn = '/sign-in';
  static const String chat = '/chat';

  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    splash: (_) => const SplashPage(),
    signIn: (_) => const SignInPage(),
    chat: (_) => const ChatPage(),
  };
}
