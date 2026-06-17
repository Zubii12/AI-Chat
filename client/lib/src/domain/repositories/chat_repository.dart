import 'package:ai_chat/src/domain/models/message.dart';

abstract class ChatRepository {
  Future<List<Message>> sendMessage(
    Message message, {
    required List<Message> history,
  });
}
