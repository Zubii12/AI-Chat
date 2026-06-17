abstract class ChatService {
  Future<List<String>> sendMessage(
    String message, {
    required List<Map<String, dynamic>> history,
  });
}
