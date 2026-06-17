import 'dart:async';

import 'package:ai_chat/src/ui/chat/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TypingIndicator extends StatelessWidget {
  const TypingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ChatCubit, ChatState, bool>(
      selector: (state) => state.isOtherTyping,
      builder: (context, isTyping) {
        if (!isTyping) return const SizedBox.shrink();

        return const _Component();
      },
    );
  }
}

class _Component extends StatefulWidget {
  const _Component();

  @override
  State<_Component> createState() => _ComponentState();
}

class _ComponentState extends State<_Component>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    unawaited(_controller.repeat());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildDot(int index) => AnimatedBuilder(
    animation: _controller,
    builder: (context, child) {
      final phase = (_controller.value + (index * 0.2)) % 1.0;

      final bounce = (.5 - (phase - 0.5).abs() * 2).clamp(0.0, 1.0);
      final offsetY = -7.0 * bounce;

      return Transform.translate(
        offset: Offset(0, offsetY),
        child: Container(
          width: 8,
          height: 8,
          margin: const .symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            shape: .circle,
          ),
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const .symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: .circular(18),
      ),
      child: Row(mainAxisSize: .min, children: List.generate(3, _buildDot)),
    );
  }
}
