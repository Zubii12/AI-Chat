import 'package:ai_chat/src/bootstrap.dart';
import 'package:ai_chat/src/ui/app/app.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
