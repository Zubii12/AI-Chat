import 'dart:async';

import 'package:ai_chat/src/ui/chat/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputBar extends StatefulWidget {
  const InputBar({super.key});

  @override
  State<InputBar> createState() => _InputBarState();
}

class _InputBarState extends State<InputBar> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    final currentState = _formKey.currentState;
    if (currentState == null) return;
    if (!currentState.validate()) return;

    final isSending = context.read<ChatCubit>().state.isSending;

    if (isSending) return;

    unawaited(context.read<ChatCubit>().sendMessage(_controller.text));
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const .symmetric(horizontal: 24, vertical: 8),
        child: Row(
          mainAxisSize: .min,
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Type your message',
                    border: OutlineInputBorder(
                      borderRadius: .all(Radius.circular(8)),
                    ),
                  ),
                  minLines: 1,
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Message cannot be empty';
                    }

                    return null;
                  },
                  onChanged: (value) {
                    if (value.trim().isEmpty) return;

                    _formKey.currentState?.validate();
                  },
                  onFieldSubmitted: (_) => _sendMessage(),
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                ),
              ),
            ),
            const SizedBox(width: 16),
            BlocSelector<ChatCubit, ChatState, bool>(
              selector: (state) => state.isSending,
              builder: (context, isSending) => IconButton.filled(
                iconSize: 16,
                onPressed: isSending ? null : _sendMessage,
                icon: const Icon(Icons.send),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
