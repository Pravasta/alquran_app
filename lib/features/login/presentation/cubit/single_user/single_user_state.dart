part of 'single_user_cubit.dart';

sealed class SingleUserState extends Equatable {
  const SingleUserState();

  @override
  List<Object> get props => [];
}

final class SingleUserInitial extends SingleUserState {
  @override
  List<Object> get props => [];
}

final class SingleUserLoading extends SingleUserState {
  @override
  List<Object> get props => [];
}

final class SingleUserLoaded extends SingleUserState {
  final UserEntity userEntity;

  const SingleUserLoaded({required this.userEntity});

  @override
  List<Object> get props => [userEntity];
}

final class SingleUserFailure extends SingleUserState {
  @override
  List<Object> get props => [];
}
