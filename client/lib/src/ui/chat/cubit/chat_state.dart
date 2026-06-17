part of 'chat_cubit.dart';

@freezed
sealed class ChatState with _$ChatState {
  const factory ChatState({
    @Default([]) List<Message> messages,

    @Default(false) bool isLoading,
    @Default(false) bool isSending,
    @Default(false) bool isOtherTyping,

    @Default('') String errorMessage,
  }) = _ChatState;
}
