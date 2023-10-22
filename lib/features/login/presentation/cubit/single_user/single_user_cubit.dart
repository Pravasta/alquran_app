import 'dart:io';

import 'package:alquran_api/features/login/domain/entities/user_entity.dart';
import 'package:alquran_api/features/login/domain/usecases/get_single_user_usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'single_user_state.dart';

class SingleUserCubit extends Cubit<SingleUserState> {
  final GetSingleUserUseCase getSingleUserUseCase;

  SingleUserCubit(this.getSingleUserUseCase) : super(SingleUserInitial());

  Future<void> getSingleUser({required String uid}) async {
    emit(SingleUserLoading());
    try {
      final streamResponse = getSingleUserUseCase.call(uid);
      streamResponse.listen((users) {
        emit(SingleUserLoaded(userEntity: users.first));
      });
    } on SocketException catch (_) {
      emit(SingleUserFailure());
    } catch (_) {
      emit(SingleUserFailure());
    }
  }
}
