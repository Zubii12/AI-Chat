import 'dart:developer';

import 'package:ai_chat/src/domain/models/message.dart';
import 'package:ai_chat/src/domain/repositories/chat_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_cubit.freezed.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit({required this._chatRepository}) : super(const ChatState());

  final ChatRepository _chatRepository;

  Future<void> sendMessage(String message) async {
    emit(
      state.copyWith(isSending: true, isOtherTyping: true, errorMessage: ''),
    );

    // This is a temporary solution to generate a unique ID for the new message.
    // In a real application, you would typically get the ID from the server
    // after the message is saved.
    final userMessage = Message.newMessage(
      id: state.messages.length + 1,
      content: message,
    );

    final currentMessages = state.messages;

    emit(state.copyWith(messages: [...currentMessages, userMessage]));

    try {
      final newMessages = await _chatRepository.sendMessage(
        userMessage,
        history: currentMessages,
      );

      emit(
        state.copyWith(
          isSending: false,
          messages: [...state.messages, ...newMessages],
        ),
      );
    } on Exception catch (e, stackTrace) {
      log('Failed to send message: $e', stackTrace: stackTrace);

      emit(
        state.copyWith(
          isSending: false,
          errorMessage: 'Failed to send message',
        ),
      );
    }
  }
}
