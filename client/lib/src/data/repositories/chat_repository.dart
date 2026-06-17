import 'package:ai_chat/src/domain/models/message.dart';
import 'package:ai_chat/src/domain/repositories/chat_repository.dart';
import 'package:ai_chat/src/domain/services/chat_service.dart';
import 'package:collection/collection.dart';

class ChatRepositoryImpl implements ChatRepository {
  const ChatRepositoryImpl({required this._chatService});

  final ChatService _chatService;

  @override
  Future<List<Message>> sendMessage(
    Message message, {
    required List<Message> history,
  }) async {
    final messages = await _chatService.sendMessage(
      message.content,
      history: history.map((m) => m.toJson()).toList(),
    );

    final lastId = message.id;

    return messages
        .mapIndexed(
          (index, message) => Message(
            id: lastId + index + 1,
            content: message,
            role: .assistant,
          ),
        )
        .toList();
  }
}
