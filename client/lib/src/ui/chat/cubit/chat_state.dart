part of 'chat_cubit.dart';

@freezed
sealed class ChatState with _$ChatState {
  const factory ChatState.initial() = _ChatInitial;
  const factory ChatState.loading() = _ChatLoading;
  const factory ChatState.success() = _ChatSuccess;
  const factory ChatState.error([String? error]) = _ChatError;
}
