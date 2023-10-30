part of 'detail_surah_cubit.dart';

sealed class DetailSurahState extends Equatable {
  const DetailSurahState();

  @override
  List<Object> get props => [];
}

final class DetailSurahInitial extends DetailSurahState {}

final class DetailSurahLoading extends DetailSurahState {}

final class DetailSurahSucces extends DetailSurahState {
  final DetailSurahEntity detailSurah;

  const DetailSurahSucces(this.detailSurah);

  @override
  List<Object> get props => [detailSurah];
}

final class DetailSurahFailed extends DetailSurahState {
  final String error;

  const DetailSurahFailed(this.error);

  @override
  List<Object> get props => [error];
}
