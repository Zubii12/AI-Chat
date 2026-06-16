import 'package:ai_chat/src/domain/services/chat_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseChatService implements ChatService {
  const SupabaseChatService({required this._client});

  final SupabaseClient _client;

  @override
  Future<void> sendMessage(String message) async {
    // TODO: Implement sending message
  }
}
