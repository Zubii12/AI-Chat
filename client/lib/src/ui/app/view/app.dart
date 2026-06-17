import 'package:ai_chat/src/ui/modules/cubit/auth_cubit.dart';
import 'package:ai_chat/src/ui/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        brightness: .dark,
      ),
      routes: AppRouter.routes,
      builder: (context, child) => BlocListener<AuthCubit, AuthState>(
        listener: (context, state) => state.map(
          initial: (_) => navigatorKey.currentState?.pushNamedAndRemoveUntil(
            AppRouter.splash,
            (_) => false,
          ),
          authenticated: (_) => navigatorKey.currentState
              ?.pushNamedAndRemoveUntil(AppRouter.chat, (_) => false),
          unauthenticated: (_) => navigatorKey.currentState
              ?.pushNamedAndRemoveUntil(AppRouter.signIn, (_) => false),
        ),
        child: child,
      ),
    );
  }
}
