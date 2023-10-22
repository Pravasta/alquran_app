import 'dart:io';
import 'package:alquran_api/features/login/domain/usecases/set_user_usecases.dart';
import 'package:alquran_api/features/login/domain/usecases/sign_in_usecases.dart';
import 'package:alquran_api/features/login/domain/usecases/sign_up_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/user_entity.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final SignUpUseCase signUpUseCase;
  final SignInUseCase signInUseCase;
  final SetUserUseCase setUserUseCase;

  UserCubit(
    this.signUpUseCase,
    this.signInUseCase,
    this.setUserUseCase,
  ) : super(UserInitial());

  Future<void> submitSignIn({required UserEntity user}) async {
    emit(UserLoading());
    try {
      await signInUseCase.call(user);
      emit(const UserSuccess());
    } on SocketException catch (_) {
      emit(UserFailure());
    } catch (_) {
      emit(UserFailure());
    }
  }

  Future<void> submitSignUp({required UserEntity user}) async {
    emit(UserLoading());
    try {
      await signUpUseCase.call(user);
      await setUserUseCase.call(user);
      emit(const UserSuccess());
    } on SocketException catch (_) {
      emit(UserFailure());
    } catch (_) {
      emit(UserFailure());
    }
  }
}
