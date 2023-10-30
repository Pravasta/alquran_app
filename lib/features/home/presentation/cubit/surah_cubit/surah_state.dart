part of 'surah_cubit.dart';

sealed class SurahState extends Equatable {
  const SurahState();

  @override
  List<Object> get props => [];
}

final class SurahInitial extends SurahState {}

final class SurahLoading extends SurahState {}

final class SurahSucces extends SurahState {
  final List<SurahEntity> surah;

  const SurahSucces(this.surah);

  @override
  List<Object> get props => [surah];
}

final class SurahFailed extends SurahState {
  final String error;

  const SurahFailed(this.error);

  @override
  List<Object> get props => [error];
}
