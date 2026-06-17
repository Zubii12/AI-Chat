import 'dart:developer';

import 'package:ai_chat/src/domain/repositories/sign_in_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_cubit.freezed.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this._signInRepository})
    : super(const SignInState.initial());

  final SignInRepository _signInRepository;

  Future<void> signInWithApple() async {
    emit(const SignInState.loading());

    try {
      await _signInRepository.signInWithApple();

      emit(const SignInState.success());
    } on Exception catch (error) {
      log('Error signing in with Apple', error: error);
      emit(const SignInState.error(message: 'Failed to sign in'));
    }
  }
}
