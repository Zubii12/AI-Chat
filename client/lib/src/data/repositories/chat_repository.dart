import 'package:ai_chat/src/domain/repositories/chat_repository.dart';
import 'package:ai_chat/src/domain/services/chat_service.dart';

class ChatRepositoryImpl implements ChatRepository {
  const ChatRepositoryImpl({required this._chatService});

  final ChatService _chatService;

  @override
  Future<void> sendMessage(String message) => _chatService.sendMessage(message);
}
