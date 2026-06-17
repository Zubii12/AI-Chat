import 'dart:convert';

import 'package:ai_chat/src/domain/services/chat_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseChatService implements ChatService {
  const SupabaseChatService({required this._client});

  final SupabaseClient _client;

  @override
  Future<List<String>> sendMessage(
    String message, {
    required List<Map<String, dynamic>> history,
  }) async {
    final response = await _client.functions.invoke(
      'send_message',
      body: {'message': message, 'history': history},
    );

    final data = jsonDecode(response.data as String) as Map<String, dynamic>;
    final messages = data['messages'] as List<dynamic>?;

    if (messages == null) {
      throw Exception('Invalid response from server: missing messages');
    }

    return messages.map((m) => m.toString()).toList();
  }
}
