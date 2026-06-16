import 'package:ai_chat/src/ui/router/app_router.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: AppRouter.routes);
  }
}
