part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UserFailure extends UserState {
  @override
  List<Object> get props => [];
}

class UserSuccess extends UserState {
  const UserSuccess();

  @override
  List<Object> get props => [];
}
