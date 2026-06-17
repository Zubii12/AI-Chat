import 'package:ai_chat/src/domain/enums/message_role.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.g.dart';
part 'message.freezed.dart';

@freezed
sealed class Message with _$Message {
  const factory Message({
    required int id,
    required String content,
    required MessageRole role,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  const Message._();

  factory Message.newMessage({required int id, required String content}) {
    return Message(id: id, content: content, role: .user);
  }
}
