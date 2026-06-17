import 'package:ai_chat/src/domain/models/message.dart';
import 'package:ai_chat/src/ui/chat/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ChatCubit, ChatState, List<Message>>(
      selector: (state) => state.messages,
      builder: (context, messages) {
        if (messages.isEmpty) {
          return const Center(child: Text('No messages yet'));
        }

        final reversedMessages = messages.reversed.toList();

        return ListView.builder(
          reverse: true,
          itemCount: reversedMessages.length,
          padding: const .symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            final message = reversedMessages[index];
            final isUserMessage = message.role == .user;

            return Align(
              alignment: isUserMessage ? .centerRight : .centerLeft,
              child: Padding(
                padding: const .all(8),
                child: Container(
                  padding: const .all(12),
                  decoration: BoxDecoration(
                    color: isUserMessage
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: .circular(8),
                  ),
                  child: Text(
                    message.content,
                    style: TextStyle(
                      color: isUserMessage
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
