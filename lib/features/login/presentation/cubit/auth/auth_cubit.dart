import 'dart:io';

import 'package:alquran_api/features/login/domain/usecases/get_user_id_usecase.dart';
import 'package:alquran_api/features/login/domain/usecases/is_sign_in_usecases.dart';
import 'package:alquran_api/features/login/domain/usecases/sign_out_usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final GetUserIdUseCase getUserIdUseCase;
  final IsSignInUseCases isSignInUseCases;
  final SignOutUseCase signOutUseCase;

  AuthCubit(this.getUserIdUseCase, this.isSignInUseCases, this.signOutUseCase)
      : super(AuthInitial());

  Future<void> appStarted() async {
    try {
      final isSignIn = await isSignInUseCases.call();
      if (isSignIn) {
        final uid = await getUserIdUseCase.call();
        emit(Authenticated(uid: uid));
      } else {
        emit(UnAuthenticated());
      }
    } on SocketException catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedIn() async {
    try {
      final uid = await getUserIdUseCase.call();
      emit(Authenticated(uid: uid));
    } on SocketException catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedOut() async {
    try {
      await signOutUseCase.call();
      emit(UnAuthenticated());
    } on SocketException catch (_) {
      emit(UnAuthenticated());
    }
  }
}
