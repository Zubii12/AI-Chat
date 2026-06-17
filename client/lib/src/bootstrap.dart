import 'dart:async';
import 'dart:developer';

import 'package:ai_chat/src/data/repositories/auth_repository.dart';
import 'package:ai_chat/src/data/services/supabase_auth_service.dart';
import 'package:ai_chat/src/domain/repositories/auth_repository.dart';
import 'package:ai_chat/src/domain/services/auth_service.dart';
import 'package:ai_chat/src/ui/modules/cubit/auth_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthService>(
          create: (context) {
            return SupabaseAuthService(client: Supabase.instance.client);
          },
        ),
        RepositoryProvider<AuthRepository>(
          create: (context) {
            return AuthRepositoryImpl(authService: context.read<AuthService>());
          },
        ),
      ],
      child: BlocProvider(
        create: (context) {
          return AuthCubit(authRepository: context.read<AuthRepository>());
        },
        child: await builder(),
      ),
    ),
  );
}
