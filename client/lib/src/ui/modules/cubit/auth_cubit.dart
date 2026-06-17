import 'dart:async';

import 'package:ai_chat/src/domain/models/auth_state.dart' as auth_model;
import 'package:ai_chat/src/domain/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this._authRepository})
    : super(const AuthState.initial()) {
    _authSubscription = _authRepository.authStateChanges.listen((authState) {
      if (authState != null) {
        emit(const AuthState.authenticated());
      } else {
        emit(const AuthState.unauthenticated());
      }
    });
  }

  final AuthRepository _authRepository;

  late final StreamSubscription<auth_model.AuthState?> _authSubscription;

  Future<void> signOut() async {
    emit(const AuthState.unauthenticated());

    await _authRepository.signOut();
  }

  @override
  Future<void> close() async {
    await _authSubscription.cancel();
    return super.close();
  }
}
