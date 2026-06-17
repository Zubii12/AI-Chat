import 'package:ai_chat/src/data/repositories/chat_repository.dart';
import 'package:ai_chat/src/data/services/supabase_chat_service.dart';
import 'package:ai_chat/src/domain/repositories/chat_repository.dart';
import 'package:ai_chat/src/domain/services/chat_service.dart';
import 'package:ai_chat/src/ui/chat/cubit/chat_cubit.dart';
import 'package:ai_chat/src/ui/chat/view/widgets/input_bar.dart';
import 'package:ai_chat/src/ui/chat/view/widgets/messages_list.dart';
import 'package:ai_chat/src/ui/chat/view/widgets/typing_indicator.dart';
import 'package:ai_chat/src/ui/modules/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ChatService>(
          create: (context) {
            return SupabaseChatService(client: Supabase.instance.client);
          },
        ),
        RepositoryProvider<ChatRepository>(
          create: (context) {
            return ChatRepositoryImpl(chatService: context.read<ChatService>());
          },
        ),
      ],
      child: BlocProvider(
        create: (context) {
          return ChatCubit(chatRepository: context.read<ChatRepository>());
        },
        child: const _ChatView(),
      ),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with Lena'),
        actions: [
          IconButton(
            onPressed: () => context.read<AuthCubit>().signOut(),
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: BlocListener<ChatCubit, ChatState>(
        listenWhen: (previous, current) {
          return previous.errorMessage != current.errorMessage;
        },
        listener: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        child: const Column(
          crossAxisAlignment: .start,
          children: [
            Expanded(child: MessagesList()),
            Padding(
              padding: .symmetric(horizontal: 24),
              child: TypingIndicator(),
            ),
            InputBar(),
          ],
        ),
      ),
    );
  }
}
