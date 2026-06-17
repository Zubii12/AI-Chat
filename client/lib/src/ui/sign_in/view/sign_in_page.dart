import 'package:ai_chat/src/data/repositories/sign_in_repository.dart';
import 'package:ai_chat/src/data/services/supabase_sign_in_service.dart';
import 'package:ai_chat/src/domain/repositories/sign_in_repository.dart';
import 'package:ai_chat/src/domain/services/sign_in_service.dart';
import 'package:ai_chat/src/ui/sign_in/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SignInService>(
          create: (context) {
            return SupabaseSignInService(client: Supabase.instance.client);
          },
        ),
        RepositoryProvider<SignInRepository>(
          create: (context) => SignInRepositoryImpl(
            signInService: context.read<SignInService>(),
          ),
        ),
      ],
      child: BlocProvider(
        create: (context) {
          return SignInCubit(
            signInRepository: context.read<SignInRepository>(),
          );
        },
        child: const _SignInView(),
      ),
    );
  }
}

class _SignInView extends StatelessWidget {
  const _SignInView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) => state.maybeWhen(
          error: (message) => ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(message))),
          orElse: () => null,
        ),
        builder: (context, state) {
          final isLoading = state.maybeWhen(
            loading: () => true,
            orElse: () => false,
          );

          return Center(
            child: Padding(
              padding: const .symmetric(horizontal: 24),
              child: SignInWithAppleButton(
                style: Theme.of(context).brightness == .dark ? .white : .black,
                onPressed: isLoading
                    ? null
                    : () => context.read<SignInCubit>().signInWithApple(),
              ),
            ),
          );
        },
      ),
    );
  }
}
